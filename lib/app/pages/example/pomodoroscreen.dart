import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:plantilla_ca/app/utils/font.dart';
import 'package:plantilla_ca/app/widgets/sesiones.dart';
import 'package:plantilla_ca/app/widgets/pomo.dart';
import 'package:plantilla_ca/app/widgets/appbar.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../widgets/coffee.dart';

class Pomodoro extends StatefulWidget {
  @override
  _PomodoroState createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> {
  double percent = 0;
  static int TimeInminut = 25;
  int TimeInSec = TimeInminut * 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Sesion(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: CircularPercentIndicator(
                  percent: percent,
                  animation: true,
                  animateFromLastPercent: true,
                  radius: 100.0,
                  lineWidth: 12.0,
                  progressColor: Colors.green,
                  center: Text(
                    "$TimeInminut",
                    style: TextStyle(color: Colors.black, fontSize: 40.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),

            //insert buttons
            Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(16.0),
                    ),
                    onPressed: () {},
                    child: Icon(Icons.refresh),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(24.0),
                    ),
                    onPressed: () {},
                    child: Icon(
                      Icons.play_arrow,
                      size: 32.0,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(16.0),
                    ),
                    onPressed: () {},
                    child: Icon(Icons.stop),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Historial",
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 10.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10),
                      child: PomodoroHistorial(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10),
                      child: Coffee(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
