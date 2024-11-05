import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:ui_web' as ui_web;

class VideoWebPage extends StatefulWidget {
  const VideoWebPage({super.key});

  @override
  State<VideoWebPage> createState() => _VideoWebPageState();
}

class _VideoWebPageState extends State<VideoWebPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceIn,
    );

    Future.delayed(const Duration(milliseconds: 100), () {
      _controller.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: AnimatedBuilder(
          animation: _controller,
          child: const WebVideoPlayer(),
          builder: (context, child) {
            return AnimatedOpacity(
              opacity: _animation.value,
              duration: const Duration(seconds: 1),
              child: child,
            );
          },
        ),
      ),
    );
  }
}

class WebVideoPlayer extends StatefulWidget {
  const WebVideoPlayer({super.key});

  @override
  State<WebVideoPlayer> createState() => _WebVideoPlayerState();
}

class _WebVideoPlayerState extends State<WebVideoPlayer> {
  late html.VideoElement _videoElement;
  html.IntersectionObserver? _observer;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      _videoElement = html.VideoElement()
        ..src = 'assets/video/data.mp4'
        ..autoplay = false
        ..controls = false
        ..loop = true
        ..muted = true
        ..style.width = 'width: 100%'
        ..style.height = 'height: 100%';

      _observer = html.IntersectionObserver(
        (entries, observer) {
          for (var entry in entries) {
            var intersectionEntry = entry as html.IntersectionObserverEntry;
            if (intersectionEntry.isIntersecting!) {
              _videoElement.play();
            } else {
              _videoElement.pause();
            }
          }
        },
        {'threshold': 0.5},
      );

      _observer!.observe(_videoElement);

      ui_web.platformViewRegistry.registerViewFactory(
        'videoPlayer',
        (int viewId) => _videoElement,
      );
    }
  }

  @override
  void dispose() {
    _observer?.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return const HtmlElementView(viewType: 'videoPlayer');
    } else {
      return Container();
    }
  }
}
