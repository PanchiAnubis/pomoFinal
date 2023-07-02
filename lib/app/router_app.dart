import 'package:flutter/material.dart';
import 'package:plantilla_ca/app/pages.dart';
import 'package:plantilla_ca/app/pages/example/example_logrosPom.dart';

class RouterApp {
  final RouteObserver<PageRoute> routeObserver;

  RouterApp() : routeObserver = RouteObserver<PageRoute>();

  Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Pages.examplePage:
        return _buildRoute(settings, AchievementsView());
      case Pages.heroesPage:
        return _buildRoute(settings, AchievementsView());
      default:
        return _buildRoute(settings, AchievementsView());
    }
  }

  MaterialPageRoute<dynamic> _buildRoute(
      RouteSettings settings, Widget builder) {
    return MaterialPageRoute<dynamic>(
      settings: settings,
      builder: (BuildContext ctx) => builder,
    );
  }
}
