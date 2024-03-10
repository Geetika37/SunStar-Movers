import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/HomePage.dart';
import 'package:sunstarmovers/pages/Survey.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [

        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/home.png"),
            size: 20,
            color: Colors.red,
          ),
          label: 'Home',
        ),

        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/file-02.png"),
            size: 20,
          ),
          label: 'Survey',
        ),

        BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/Icon.png"),
              size: 24,
            ),
            label: 'Notification'),

      ],

      selectedItemColor: Colors.red,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      unselectedLabelStyle:
          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),

      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
            break;
          case 1:
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Survey()));
            break;

        }
      },
    );
  }
}
