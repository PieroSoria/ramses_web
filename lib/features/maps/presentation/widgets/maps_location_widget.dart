import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramses_web/core/routes/app_routes.dart';

class MapsLocationWidget extends StatefulWidget {
  final String location;
  final String image;
  final String maps;
  const MapsLocationWidget(
      {super.key,
      required this.location,
      required this.image,
      required this.maps});

  @override
  State<MapsLocationWidget> createState() => _MapsLocationWidgetState();
}

class _MapsLocationWidgetState extends State<MapsLocationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animated;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animated = Tween<double>(
      begin: 0,
      end: 80,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    // _animated = CurvedAnimation(parent: _controller, curve: Curves.bounceIn,);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        _controller.forward();
      },
      onExit: (event) {
        _controller.reverse();
      },
      child: GestureDetector(
        onTap: () {
          context.goNamed(
            AppRoutes.maps,
            extra: {'imagen': widget.image, 'maps': widget.maps},
          );
        },
        child: Container(
          width: 400,
          height: 250,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(widget.image),
              fit: BoxFit.fill,
            ),
          ),
          alignment: Alignment.bottomCenter,
          child: AnimatedBuilder(
            animation: _controller,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                widget.location,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
            builder: (context, child) {
              return Container(
                height: _animated.value.isNaN ? 0 : _animated.value,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Color.fromARGB(157, 0, 0, 0),
                      Color.fromARGB(157, 0, 0, 0),
                    ],
                  ),
                ),
                alignment: Alignment.bottomCenter,
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }
}
