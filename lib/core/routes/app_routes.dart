import 'package:ramses_web/features/app/presentation/pages/app_page.dart';
import 'package:ramses_web/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum TypeTransition {
  rightToLeft,
  leftToRight,
  topToBottom,
  bottomToTop,
}

class AppRoutes {
  static const app = '/';
  static const home = '/home';
  static const auth = '/auth';

  static GoRouter routerConfig() => GoRouter(
        initialLocation: app,
        navigatorKey: observerNavigator,
        routes: [
          GoRoute(
            path: app,
            pageBuilder: (context, state) => _materialView(
              state.pageKey,
              const AppPage(),
              TypeTransition.bottomToTop,
            ),
          )
        ],
      );

  static CustomTransitionPage _materialView(
    dynamic pageKey,
    Widget view,
    TypeTransition typeTransition,
  ) {
    return CustomTransitionPage(
      child: view,
      key: pageKey,
      transitionsBuilder: (context, animation, seconanimation, child) {
        return switch (typeTransition) {
          TypeTransition.rightToLeft => SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          TypeTransition.leftToRight => SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          TypeTransition.topToBottom => SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, -1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          TypeTransition.bottomToTop => SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            )
        };
      },
    );
  }
}
