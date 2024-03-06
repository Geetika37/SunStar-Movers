import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/chart.dart';
import 'package:sunstarmovers/pages/container2.dart';
import 'package:sunstarmovers/pages/navBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))),
        backgroundColor: Colors.red,
        toolbarHeight: 80,
        leading: Builder(
            builder: (context) {
              return IconButton(onPressed: (){
                Scaffold.of(context).openDrawer();
              }, icon: Icon(Icons.menu,color: Colors.white,),);
            }
        ),
        title: Text("Hello Steve ,",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontFamily: 'Poppins'),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image(image: AssetImage("assets/Group.png")),
          )
        ],
      ),
      drawer: navBar(),

      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Text("Overview",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,fontFamily: 'Poppins'),),
                SizedBox(width: 120,),
                Text("Show:",style: TextStyle(fontSize: 14,color: Colors.grey,fontFamily: 'Poppins',fontWeight: FontWeight.w400),),
                Text("This Year",style: TextStyle(fontSize: 14,fontFamily: 'Poppins',fontWeight: FontWeight.w400),),
                Image(image: AssetImage("assets/ic_Dropdown.png"))
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [

                Flexible(child: HomeCard(title: 'Total Surveys',title2: '+2.5%',title3: '456',image: 'assets/Group 28.png',)),
                SizedBox(width: 15,),
                Flexible(child: HomeCard(title: 'Total activities',title2: '+2.5%',title3: '378',image: 'assets/Group 427318358.png',),)
              ],
            ),
            Container(
                child: Column(
                  children: [
                    Chart()
                  ],
                )
            ),

          ],
        ),
      ),
    );
  }
}
