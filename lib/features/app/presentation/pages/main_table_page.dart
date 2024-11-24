import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramses_web/core/helper/app_images.dart';
import 'package:ramses_web/features/app/data/models/info_model.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MainPageTablet extends StatefulWidget {
  const MainPageTablet({super.key});

  @override
  State<MainPageTablet> createState() => _MainPageTabletState();
}

class _MainPageTabletState extends State<MainPageTablet>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    Future.delayed(const Duration(milliseconds: 500), () {
      _controller.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.amber,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, animated) {
                return Opacity(
                  opacity: _animation.value,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "RAMSES GYM",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          ClipPath(
            clipper: MainTabletCustom(),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              // height: 700,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: ItemsAnimationScroll(),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemsAnimationScroll extends StatefulWidget {
  const ItemsAnimationScroll({
    super.key,
  });

  @override
  State<ItemsAnimationScroll> createState() => _ItemsAnimationScrollState();
}

class _ItemsAnimationScrollState extends State<ItemsAnimationScroll> {
  final _scrollController = ScrollController();

  List<int> visibleItems = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InfoPageRamses(),
          ImagenCaruoselData(),
        ],
      ),
    );
  }
}

class ImagenCaruoselData extends StatefulWidget {
  const ImagenCaruoselData({super.key});

  @override
  State<ImagenCaruoselData> createState() => _ImagenCaruoselDataState();
}

class _ImagenCaruoselDataState extends State<ImagenCaruoselData>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

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
        vsync: this, duration: const Duration(milliseconds: 800));
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("ImagenCaruoselData"),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.5) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, animation) {
            return Opacity(
              opacity: _animation.value,
              child: CarouselSlider(
                items: List.generate(
                  data.length,
                  (index) => Container(
                    width: 700,
                    height: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(data[index].imagen!),
                      ),
                    ),
                  ),
                ),
                options: CarouselOptions(
                  height: 400,
                  autoPlay: true,
                  viewportFraction: 0.8,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class InfoPageRamses extends StatefulWidget {
  const InfoPageRamses({
    super.key,
  });

  @override
  State<InfoPageRamses> createState() => _InfoPageRamsesState();
}

class _InfoPageRamsesState extends State<InfoPageRamses>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late Animation<Offset> _animation2;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation =
        Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );
    _animation2 =
        Tween<Offset>(begin: const Offset(2, 0), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.5) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
      key: Key("InfoPageRamses"),
      child: Container(
        height: MediaQuery.sizeOf(context).height,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(),
        child: Row(
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, animation) {
                return SlideTransition(
                  position: _animation,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(AppImages.logo),
                    ),
                  ),
                );
              },
            ),
            Expanded(
              child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, animation) {
                    return SlideTransition(
                      position: _animation2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
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
                            padding: const EdgeInsets.symmetric(vertical: 20),
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
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class MainTabletCustom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final h = size.height;
    final w = size.width;

    path.moveTo(0, h);
    path.lineTo(0, 60);

    // Lado izquierdo
    path.cubicTo(0, 60, 5, 15, 40, 5); // Punto 4
    path.cubicTo(40, 5, 60, 0, 80, 10); // Punto 3
    path.cubicTo(80, 10, 100, 20, 150, 55); // Punto 2
    path.cubicTo(150, 55, 160, 60, 180, 60); // Punto 1

    // Punto medio
    path.lineTo(w / 2, 60);

    // Lado derecho (reflejo del lado izquierdo)
    path.cubicTo(w - 180, 60, w - 160, 60, w - 150, 55); // Punto 1
    path.cubicTo(w - 150, 55, w - 100, 20, w - 80, 10); // Punto 2
    path.cubicTo(w - 80, 10, w - 60, 0, w - 40, 5); // Punto 3
    path.cubicTo(w - 40, 5, w - 5, 15, w, 60); // Punto 4

    path.lineTo(w, 60);
    path.lineTo(w, h - 40);
    path.lineTo(w, h);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
