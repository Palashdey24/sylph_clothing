import 'package:flutter/material.dart';

class AppNavigator {
  const AppNavigator();
  static void navigatorPush(BuildContext context, Widget page) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ));
  }

  static void navigatorPushAndRemove(BuildContext context, Widget page) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (route) => false,
    );
  }

  static void navigatorReplace(BuildContext context, Widget page) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ));
  }

  static void navigatorPushWithTransition(
      BuildContext context, Widget widget, Offset begins, Curve curves) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 800),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          Offset begin = begins;
          const end = Offset.zero;
          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curves));
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) => widget,
      ),
    );
  }
}
