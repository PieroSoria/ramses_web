import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class MenuOptionsDown extends StatefulWidget {
  const MenuOptionsDown({super.key});

  @override
  State<MenuOptionsDown> createState() => _MenuOptionsDownState();
}

class _MenuOptionsDownState extends State<MenuOptionsDown>
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
          clipper: MyCustomClipperBto(),
          child: Container(
            width: _animation.value.isNaN ? 0 : _animation.value,
            height: 80,
            padding: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
              color: Colors.amber,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icons/facebook.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.fill,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icons/instagram.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.fill,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icons/tiktok.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.fill,
                    scale: 70,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class MyCustomClipperBto extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final h = size.height;
    final w = size.width;

    path.moveTo(0, 0);
    path.cubicTo(0, 0, w * 0.0125, h * 0.1875, w * 0.05, h * 0.25);
    path.lineTo(w * 0.05, h * 0.25);
    path.lineTo(w * 0.9, h * 0.25);
    path.cubicTo(w * 0.9, h * 0.25, w * 0.9375, h * 0.3125, w * 0.95, h * 0.5);
    path.lineTo(w * 0.95, h * 0.5);
    path.lineTo(w * 0.9625, h * 0.75);
    path.cubicTo(w * 0.9625, h * 0.75, w * 0.975, h * 0.9375, w, h);
    path.lineTo(0, h);
    path.lineTo(0, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
