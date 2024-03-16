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
  int myIndex=0;



  Widget callPage(currentIndex) {
    switch (currentIndex) {
      case 0:
        return
          HomePage();

    // return MyHomePage();

      case 1:
        return Survey();
      case 2:
        return  CalanderScreen();
      case 3:
        return Account();

      default:
        return HomePage();
    }
  }




  @override
  Widget build(BuildContext context) {
    void onTabTapped(int index){
      setState(() {
        myIndex = index;
      });
    }
    BottomNavigationBarItem bottomNavigationBarItem({
      String? label,
      int? index,
      Widget? icon,
      Widget? activeIcon,
    }) =>
        BottomNavigationBarItem(
            icon: Padding(padding: const EdgeInsets.all(10.0), child: icon),
            label: label,
            activeIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: activeIcon,
            ));
    return Scaffold(
      body: callPage(myIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap:onTabTapped,
        currentIndex: myIndex,
        showSelectedLabels: true,
        type:BottomNavigationBarType.fixed ,
        items: <BottomNavigationBarItem> [

          bottomNavigationBarItem(
            activeIcon: Image.asset('assets/homeColor.png'),
index: 0,
            icon: ImageIcon(
              AssetImage("assets/home-line.png"),
              size: 20,
            ),
            label: 'Home',

          ),

          bottomNavigationBarItem(
            activeIcon: Image.asset('assets/surveyColor.png'),
            index: 1,
            icon: ImageIcon(
              AssetImage("assets/file-02.png"),
              size: 20,
            ),
            label: 'Survey',
          ),


          bottomNavigationBarItem(
            activeIcon: Image.asset('assets/calenderColor.png'),
              index: 2,
              icon: ImageIcon(
                AssetImage("assets/Group 33192.png"),
                size: 24,
              ),
              label: 'Calender'),

          bottomNavigationBarItem(
            activeIcon: Image.asset('assets/accountcolor.png'),
            index: 3,
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


      ),
    );
  }
}


