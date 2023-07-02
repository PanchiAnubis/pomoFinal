import 'package:flutter/material.dart';
import 'package:plantilla_ca/app/pages/example/example_logrosPom.dart';
import 'package:plantilla_ca/app/pages/example/example_inicio.dart';
import 'package:plantilla_ca/app/pages/example/pomodoroscreen.dart';
import 'package:plantilla_ca/app/router_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Pomodoro';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final RouterApp _router = RouterApp();
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        home: AchievementsView(), //vista de los logros,
        onGenerateRoute: _router.getRoute,
        navigatorObservers: [
          _router.routeObserver
        ],
        routes: {
          '/temporizador': (context) => MyHomePage(title: appTitle),
          '/logros': (context) => AchievementsView(),
          '/cronometro': (context) => Pomodoro(),
        });
  }
}
