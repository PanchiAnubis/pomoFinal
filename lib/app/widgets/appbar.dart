import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, '/logros');
        },
      ),
      elevation: 0,
      backgroundColor: Colors.red,
      title: Center(
        child: Text(
          "Temporizador",
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          iconSize: 40,
          onPressed: () {
            Navigator.pushNamed(context, '/logros');
          },
        ),
      ],
    );
  }
}
