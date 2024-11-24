import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramses_web/core/helper/app_images.dart';
import 'package:ramses_web/core/routes/app_routes.dart';
import 'package:ramses_web/features/app/data/models/info_model.dart';
import 'package:ramses_web/features/app/presentation/widgets/item_image_hover.dart';
import 'package:ramses_web/features/app/presentation/widgets/overlay_container.dart';
import 'package:ramses_web/features/app/presentation/widgets/video_web_page.dart';
import 'package:ramses_web/features/app/presentation/widgets/menu_options.dart';
import 'package:ramses_web/features/app/presentation/widgets/menu_options_down.dart';
import 'package:flutter/material.dart';
import 'package:ramses_web/features/maps/presentation/widgets/maps_location_widget.dart';

class MainPageHome extends StatefulWidget {
  const MainPageHome({
    super.key,
  });

  @override
  State<MainPageHome> createState() => _MainPageHomeState();
}

class _MainPageHomeState extends State<MainPageHome>
    with TickerProviderStateMixin {
  final carousel = CarouselSliderController();
  int indexcarousel = 0;
  bool isindex = false;
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _offsetAnimation;
  late Animation<Offset> _offset2Animation;
  late Animation<Offset> _offset3Animation;
  final data = <InfoModel>[
    InfoModel(
        title: 'Sala de musica',
        description: 'description',
        imagen: AppImages.salamusc),
    InfoModel(
        title: 'clase Grupales',
        description: 'description',
        imagen: AppImages.clasegrupales),
    InfoModel(
        title: 'Spinning',
        description: 'description',
        imagen: AppImages.spinning),
    InfoModel(
        title: 'Zona Funcional',
        description: 'description',
        imagen: AppImages.zonafuncional),
  ];

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceIn,
    );

    _offset2Animation = Tween<Offset>(
      begin: const Offset(2, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );
    _offset3Animation = Tween<Offset>(
      begin: const Offset(-2, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    _offsetAnimation = Tween<double>(
      begin: 0,
      end: 300,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    Future.delayed(const Duration(seconds: 1), () {
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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: Colors.amber),
      child: Stack(
        children: [
          const VideoWebPage(),
          Align(
            alignment: Alignment.center,
            child: AnimatedBuilder(
              animation: _controller,
              child: Image.asset(
                'assets/icons/rances_icon.png',
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
              builder: (context, child) {
                return AnimatedOpacity(
                  opacity: _animation.value,
                  duration: const Duration(seconds: 1),
                  child: child,
                );
              },
            ),
          ),
          const Positioned(
            top: 0,
            right: 0,
            child: MenuOptions(),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            child: MenuOptionsDown(),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SlideTransition(
              position: _offset2Animation,
              child: Container(
                width: 400,
                height: 800,
                margin: const EdgeInsets.only(right: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.amber),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Column(
                    children: [
                      Image.asset(AppImages.logo),
                      Padding(
                        padding: const EdgeInsets.only(top: 70),
                        child: Text(
                          "Ramses Gym",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          "Somos la cadena de gimnasios Ramses Gym, ubicados en San Juan de Lurigancho y Provincia de Pisco, con más de 8 años de experiencia.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Brindamos a nuestros socios una salud física y mental, para ayudarles a alcanzar sus objetivos individuales; con nuestra amplia experiencia les proveemos binestar con base a un esmerado servicio, a un ambiente agradable y con un personal entrenado en los últimos conocimientos.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          "Contáctanos",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Lunes a Viernes de 6:00am a 10:00pm ",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Sábados de 6:00am a 9:00pm",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Domingos de 6:30am a 1:00pm",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SlideTransition(
              position: _offset3Animation,
              child: Container(
                width: 400,
                height: 800,
                margin: const EdgeInsets.only(left: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.amber),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Nuestras Sedes",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      MapsLocationWidget(
                        location:
                            '📍 Sede Santa Rosa: Av. Santa Rosa 410 – SJL',
                        image: AppImages.santarosa,
                        maps: AppImages.mapssantarosa,
                      ),
                      MapsLocationWidget(
                        location:
                            '📍 Sede Motupe: Paradero 4 Wiesse Me E Lt13 – SJL',
                        image: AppImages.fernandowisse,
                        maps: AppImages.mapsfernandowisse,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: MyCustomClipperBottom(),
              child: AnimatedBuilder(
                animation: _controller,
                child: CarouselSlider(
                  carouselController: carousel,
                  items: List.generate(
                    data.length,
                    (index) => GestureDetector(
                      onTap: () {
                        HoverOverlay.showinfomas(context, data[index]);
                      },
                      child: ItemImageHover(
                        data: data[index],
                        isindex: index == indexcarousel,
                      ),
                    ),
                  ),
                  options: CarouselOptions(
                    height: 300,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    viewportFraction: 0.6,
                    initialPage: indexcarousel,
                    onPageChanged: (index, reason) {
                      setState(() {
                        indexcarousel = index;
                      });
                    },
                  ),
                ),
                builder: (context, child) {
                  return Container(
                    width: 800,
                    height: _offsetAnimation.value.isNaN
                        ? 0
                        : _offsetAnimation.value,
                    decoration: const BoxDecoration(color: Colors.amber),
                    child: child,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomClipperBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final h = size.height;
    final w = size.width;
    path.moveTo(0, h);
    path.cubicTo(0, h, 15, h - 5, 20, h - 20);
    path.lineTo(20, h - 20);
    path.lineTo(80, 40);
    path.cubicTo(80, 40, 85, 20, 100, 20);
    path.lineTo(100, 20);
    path.lineTo(w - 100, 20);
    path.cubicTo(w - 100, 20, w - 85, 25, w - 80, 40);
    path.lineTo(w - 80, 40);
    path.lineTo(w - 20, h - 20);
    path.cubicTo(w - 20, h - 20, w - 15, h - 5, w, h);
    path.lineTo(w, h);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
// class MyCustomClipperBottom extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     final h = size.height;
//     final w = size.width;
//     path.moveTo(0, h);
//     path.cubicTo(0, h, 15, h - 5, 20, h - 20);
//     path.lineTo(20, h - 20);
//     path.lineTo(60, 40);
//     path.cubicTo(60, 40, 65, 20, 80, 20);
//     path.lineTo(80, 20);
//     path.lineTo(w - 80, 20);
//     path.cubicTo(w - 80, 20, w - 65, 25, w - 60, 40);
//     path.lineTo(w - 60, 40);
//     path.lineTo(w - 20, h - 20);
//     path.cubicTo(w - 20, h - 20, w - 15, h - 5, w, h);
//     path.lineTo(w, h);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }
