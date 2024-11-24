import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramses_web/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ramses_web/features/app/presentation/bloc/app_bloc.dart';

final GlobalKey<NavigatorState> observerNavigator = GlobalKey<NavigatorState>();

Future main() async {
  final widgetbinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetbinding);

  runApp(const MyProviders());
}

class MyProviders extends StatelessWidget {
  const MyProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppBloc(),
        ),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp.router(
      title: 'GYM RAMSES',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutes.routerConfig(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
