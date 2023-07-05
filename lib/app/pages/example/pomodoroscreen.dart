import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:plantilla_ca/app/utils/font.dart';
import 'package:plantilla_ca/app/widgets/sesiones.dart';
import 'package:plantilla_ca/app/widgets/pomo.dart';
import 'package:plantilla_ca/app/widgets/appbar.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:async';

import '../../widgets/coffee.dart';

class Pomodoro extends StatefulWidget {
  @override
  _PomodoroState createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> {
  int _seconds = 10; // Valor inicial del temporizador
  int _currentInterval = 0; // Indicador del intervalo actual
  List<int> _intervals = [10, 5, 10]; // Duraciones de los intervalos
  bool _isRunning = false;
  Timer? _timer;
  List<String> _intervalHistory = [];

  void _startTimer() {
    if (!_isRunning) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if (_seconds > 0) {
            _seconds--;
          } else {
            _timer?.cancel();
            _isRunning = false;

            // Almacenar el intervalo en el historial
            String intervalName = _getIntervalLabel();
            String intervalDuration = _intervals[_currentInterval].toString();
            _intervalHistory.add('$intervalName\n$intervalDuration segundos');

            // Cambiar al siguiente intervalo
            _currentInterval++;
            if (_currentInterval < _intervals.length) {
              _seconds = _intervals[_currentInterval];
              // Iniciar automáticamente el siguiente intervalo
              _startTimer();
            } else {
              // Detener el programa después del último intervalo
              _resetTimer();
            }
          }
        });
      });
      _isRunning = true;
    }
  }

  void _pauseTimer() {
    if (_isRunning) {
      _timer?.cancel();
      _isRunning = false;
    }
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _seconds = _intervals[0]; // Reiniciar al primer intervalo
      _currentInterval = 0;
      _isRunning = false;
    });
  }

  String _getIntervalLabel() {
    return (_currentInterval % 2 == 0) ? 'Pomodoro' : 'Descanso';
  }

  IconData _getIntervalIcon() {
    return (_getIntervalLabel() == 'Pomodoro') ? Icons.book : Icons.coffee;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
            Padding(
                padding: EdgeInsets.only(
                    top:
                        20.0), // Agrega un espacio de 16.0 en la parte superior
                child:
                    Text(_getIntervalLabel(), style: TextStyle(fontSize: 30))),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: CircularPercentIndicator(
                  animation: true,
                  animateFromLastPercent: true,
                  radius: 100.0,
                  lineWidth: 12.0,
                  progressColor: Colors.green,
                  center: Text(
                    '$_seconds',
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
                    onPressed: _pauseTimer,
                    child: Icon(Icons.pause),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(24.0),
                    ),
                    onPressed: _startTimer,
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
                    onPressed: _resetTimer,
                    child: Icon(Icons.stop),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            Text(
              'Historial de intervalos:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _intervalHistory.length,
                itemBuilder: (context, index) {
                  String interval = _intervalHistory[index];
                  String intervalName = interval.split('\n')[0];
                  String intervalDuration = interval.split('\n')[1];
                  IconData intervalIcon =
                      (intervalName == 'Pomodoro') ? Icons.book : Icons.coffee;

                  return Container(
                    padding: EdgeInsets.all(8.0),
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
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: [
                        Icon(intervalIcon),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              intervalName,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(intervalDuration),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
