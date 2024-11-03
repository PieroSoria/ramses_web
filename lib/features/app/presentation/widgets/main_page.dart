import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:ui_web' as ui_web;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: LayoutBuilder(builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: const WebVideoPlayer(),
          );
        }),
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
    _observer?.disconnect(); // Desconectar el observador
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
