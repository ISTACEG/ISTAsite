import 'package:flutter/material.dart';
import 'package:istasite/Homepage/Homepage.dart';
import 'package:istasite/login.dart';

class RoutesName {
  static const String ADMIN_PAGE = '/admin';
  static const String ACTUAL_PAGE = '';
}

class _GeneratePageRoute extends PageRouteBuilder {
  final Widget widget;
  final String routeName;
  _GeneratePageRoute({required this.widget, required this.routeName})
      : super(
            settings: RouteSettings(name: routeName),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return SlideTransition(
                textDirection: TextDirection.rtl,
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            });
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.ADMIN_PAGE:
        return _GeneratePageRoute(
            widget: LoginPage(), routeName: settings.name!);
      default:
        return _GeneratePageRoute(
            widget: Homepage(), routeName: settings.name!);
    }
  }
}
