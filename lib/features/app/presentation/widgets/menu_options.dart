import 'package:flutter/material.dart';

class MenuOptions extends StatefulWidget {
  const MenuOptions({super.key});

  @override
  State<MenuOptions> createState() => _MenuOptionsState();
}

class _MenuOptionsState extends State<MenuOptions>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _animation = Tween<double>(begin: 0, end: 400).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticOut,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, snapshot) {
        return ClipPath(
          clipper: MyCustomClipper(),
          child: Container(
              width: _animation.value.isNaN ? 0 : _animation.value,
              height: 80,
              padding: const EdgeInsets.only(left: 40, bottom: 30),
              decoration: const BoxDecoration(
                color: Colors.amber,
              ),
              child: Center()),
        );
      },
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final h = size.height;
    final w = size.width;

    path.moveTo(0, 0);
    path.lineTo(w, 0);
    path.lineTo(w, h);
    path.cubicTo(
      w,
      h,
      w * 0.9875,
      h * 0.75,
      w * 0.95,
      h * 0.75,
    );
    path.lineTo(w * 0.95, h * 0.75);
    path.lineTo(w * 0.1, h * 0.75);
    path.cubicTo(
      w * 0.1,
      h * 0.75,
      w * 0.05,
      h * 0.6875,
      w * 0.05,
      h * 0.5,
    );
    path.lineTo(w * 0.05, h * 0.5);
    path.lineTo(w * 0.0375, h * 0.25);
    path.cubicTo(
      w * 0.0375,
      h * 0.25,
      w * 0.0375,
      h * 0.0375,
      0,
      0,
    );
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
