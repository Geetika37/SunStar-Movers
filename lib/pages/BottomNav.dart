import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/Account.dart';
import 'package:sunstarmovers/pages/Calender.dart';
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
      showSelectedLabels: true,
      type:BottomNavigationBarType.fixed ,
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
              AssetImage("assets/Group 33192.png"),
              size: 24,
            ),
            label: 'Calender'),

        BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/user-01.png"),
              size: 24,
            ),
            label: 'Account'),
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
          case 2:
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
            break;
          case 3:
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Account()));

        }
      },
    );
  }
}
