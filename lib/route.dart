import 'package:flutter/material.dart';
import 'package:to_do/screens/splash/splash_page.dart';
import 'package:to_do/screens/tab/tab.dart';
import 'package:to_do/utils/constants.dart';
class MyRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case tabBox:
        return navigateTo( TabBox());
      case splashPage:
        return navigateTo( SplashScreen());
      default:
        return navigateTo(
          Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

MaterialPageRoute navigateTo(Widget widget) => MaterialPageRoute(
  builder: (context) => widget,
);
