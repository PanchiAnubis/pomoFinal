import 'package:flutter/material.dart';

class PomodoroHistorial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24.0, right: 24.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white, // changes the position of the shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Icon(Icons.book),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Pomodoro',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text(
                    '20 Minutos',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 8.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
