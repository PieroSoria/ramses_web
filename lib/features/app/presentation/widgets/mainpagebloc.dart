import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rances_web/core/helper/app_images.dart';
import 'package:rances_web/features/app/presentation/widgets/main_page.dart';
import 'package:rances_web/features/app/presentation/widgets/menu_options.dart';
import 'package:rances_web/features/app/presentation/widgets/menu_options_down.dart';
import 'package:flutter/material.dart';

class MainPageHome extends StatelessWidget {
  const MainPageHome({
    super.key,
  });
  static final data = <String>[
    AppImages.salamusc,
    AppImages.clasegrupales,
    AppImages.spinning,
    AppImages.zonafuncional,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const MainPage(),
        Align(
          alignment: Alignment.center,
          child: Opacity(
            opacity: 0.3,
            child: Image.asset(
              'assets/icons/rances_icon.png',
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
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
          child: Container(
            width: 400,
            height: 800,
            margin: EdgeInsets.only(right: 40),
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
                  )
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 400,
            height: 800,
            margin: EdgeInsets.only(left: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.amber),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [],
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 3 - 100,
            child: CarouselSlider(
              items: List.generate(
                data.length,
                (index) => Container(
                  width: MediaQuery.of(context).size.width / 3 - 100,
                  height: 250,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(
                        data[index],
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              options: CarouselOptions(
                height: 250,
                autoPlay: true,
                enlargeCenterPage: true,
                autoPlayInterval: Duration(seconds: 3),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
