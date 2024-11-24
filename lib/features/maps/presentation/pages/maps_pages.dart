import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MapsPages extends StatefulWidget {
  final String imagen;
  final String maps;
  const MapsPages({super.key, required this.imagen, required this.maps});

  @override
  State<MapsPages> createState() => _MapsPagesState();
}

class _MapsPagesState extends State<MapsPages>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    Future.delayed(const Duration(milliseconds: 500), () {
      _controller.forward();
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            widget.imagen,
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            fit: BoxFit.fill,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _animation.value,
                  child: Container(
                    height: MediaQuery.sizeOf(context).height / 2,
                    padding: const EdgeInsets.only(top: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
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
                    child: Image.asset(
                      widget.maps,
                      width: 800,
                      height: 400,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                right: 20,
              ),
              child: IconButton(
                onPressed: () {
                  context.pop();
                },
                style: IconButton.styleFrom(backgroundColor: Colors.white),
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
