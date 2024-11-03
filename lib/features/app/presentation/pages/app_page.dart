import 'package:rances_web/features/app/presentation/widgets/main_page.dart';
import 'package:rances_web/features/app/presentation/widgets/mainpagebloc.dart';
import 'package:rances_web/features/app/presentation/widgets/menu_options.dart';
import 'package:rances_web/features/app/presentation/widgets/menu_options_down.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:video_player/video_player.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(color: Colors.amber),
        child: const MainPageHome(),
      ),
    );
  }
}

class ContactoPage extends StatefulWidget {
  const ContactoPage({super.key});

  @override
  State<ContactoPage> createState() => _ContactoPageState();
}

class _ContactoPageState extends State<ContactoPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
