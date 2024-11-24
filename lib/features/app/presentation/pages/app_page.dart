import 'package:google_fonts/google_fonts.dart';
import 'package:ramses_web/features/app/presentation/pages/main_table_page.dart';
import 'package:ramses_web/features/app/presentation/widgets/mainpagebloc.dart';
import 'package:flutter/material.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        debugPrint("El ancho es ${constraints.maxWidth}");
        if (constraints.maxWidth > 1700) {
          return const MainPageHome();
        } else if (constraints.maxWidth > 512 && constraints.maxWidth < 1700) {
          return const MainPageTablet();
        } else {
          return Container();
        }
      }),
    );
  }
}
