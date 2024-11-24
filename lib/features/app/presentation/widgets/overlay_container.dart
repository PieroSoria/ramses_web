import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ramses_web/features/app/data/models/info_model.dart';

class HoverOverlay extends StatelessWidget {
  final InfoModel data;
  const HoverOverlay({super.key, required this.data});

  static const double dialogWidth = 1000;
  static const double dialogHeight = 600;
  static const Color overlayColor = Color.fromARGB(158, 0, 0, 0);
  static const Color gradientStart = Color.fromARGB(62, 0, 0, 0);
  static const Color gradientEnd = Color.fromARGB(172, 0, 0, 0);
  static Future<dynamic> showinfomas(BuildContext context, InfoModel data) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Dismiss",
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 500),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        // Animación de escala
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutBack,
          ),
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: dialogWidth,
            height: dialogHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  // Imagen de fondo
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          data.imagen!,
                          width: dialogWidth,
                          height: dialogHeight,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: dialogWidth,
                      height: dialogHeight,
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            gradientStart,
                            gradientStart,
                            gradientStart,
                            gradientEnd,
                            gradientEnd,
                            gradientEnd,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: dialogWidth / 2,
                      height: dialogHeight,
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            data.title!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            data.description!,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      style:
                          IconButton.styleFrom(backgroundColor: Colors.white),
                      icon: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showinfomas(context, data);
      },
      child: Container(
        width: 600,
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        margin: const EdgeInsets.only(bottom: 20, top: 40),
        height: 300,
        decoration: BoxDecoration(
          color: overlayColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text(
            "VER MÁS",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
