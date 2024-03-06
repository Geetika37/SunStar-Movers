import 'package:flutter/material.dart';

class navBar extends StatelessWidget {
  const navBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //width: MediaQuery.of(context).size.width*.3,
      child: ListView(
        children: [
          Image(image: AssetImage("assets/logo.png"))
        ],
      ),
    );
  }
}
