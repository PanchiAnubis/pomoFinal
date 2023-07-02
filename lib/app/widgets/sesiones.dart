import 'package:flutter/material.dart';

class Sesion extends StatelessWidget {
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
      child: Card(
        child: ListTile(
          leading: Icon(Icons.code),
          title: Row(
            children: [
              Expanded(child: Text('Programar')),
              Align(
                alignment: Alignment.centerRight,
                child: Text('2/2'),
              ),
            ],
          ),
          subtitle: Text('50 Minutos'),
        ),
      ),
    );
  }
}
