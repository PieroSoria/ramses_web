import 'package:ramses_web/features/app/presentation/pages/app_page.dart';
import 'package:ramses_web/features/maps/presentation/pages/maps_pages.dart';
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
  static const maps = 'maps';
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
            routes: [
              GoRoute(
                path: maps,
                name: maps,
                pageBuilder: (context, state) => _materialView(
                  state.pageKey,
                  MapsPages(
                    imagen: (state.extra as Map<String,dynamic>)['imagen'],
                    maps: (state.extra as Map<String,dynamic>)['maps'],
                  ),
                  TypeTransition.bottomToTop,
                ),
              ),
            ],
          ),
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
      transitionDuration: const Duration(milliseconds: 800),
      reverseTransitionDuration: const Duration(milliseconds: 800),
      transitionsBuilder: (context, animationinit, seconanimation, child) {
        final animation = CurvedAnimation(
          parent: animationinit,
          curve: Curves.elasticOut,
        );
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

// static const app = '/';
//   static const maps = 'maps';
//   static const auth = '/auth';

//   static GoRouter routerConfig() => GoRouter(
//         initialLocation: app,
//         navigatorKey: observerNavigator,
//         routes: [
//           GoRoute(
//             path: app,
//             pageBuilder: (context, state) => _materialView(
//               state.pageKey,
//               const AppPage(),
//               TypeTransition.bottomToTop,
//             ),
//             routes: [
//               GoRoute(
//                 path: maps,
//                 name: maps,
//                 pageBuilder: (context, state) => _materialView(
//                   state.pageKey,
//                   const MapsPages(),
//                   TypeTransition.bottomToTop,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       );

//   static CustomTransitionPage _materialView(
//     dynamic pageKey,
//     Widget view,
//     TypeTransition typeTransition,
//   ) {
//     return CustomTransitionPage(
//       child: view,
//       key: pageKey,
//       transitionDuration: const Duration(milliseconds: 800),
//       reverseTransitionDuration: const Duration(milliseconds: 800),
//       transitionsBuilder: (context, animationInit, seconanimation, child) {
//         final isReverse = animationInit.status == AnimationStatus.reverse;
//         Offset beginOffset;

//         switch (typeTransition) {
//           case TypeTransition.rightToLeft:
//             beginOffset = isReverse ? const Offset(-1, 0) : const Offset(1, 0);
//             break;
//           case TypeTransition.leftToRight:
//             beginOffset = isReverse ? const Offset(1, 0) : const Offset(-1, 0);
//             break;
//           case TypeTransition.topToBottom:
//             beginOffset = isReverse ? const Offset(0, 1) : const Offset(0, -1);
//             break;
//           case TypeTransition.bottomToTop:
//             beginOffset = isReverse ? const Offset(0, -1) : const Offset(0, 1);
//             break;
//         }
//         final animation =
//             CurvedAnimation(parent: animationInit, curve: Curves.elasticOut);
//         return SlideTransition(
//           position: Tween<Offset>(begin: beginOffset, end: Offset.zero)
//               .animate(animation),
//           child: child,
//         );
//       },
//     );
//   }
