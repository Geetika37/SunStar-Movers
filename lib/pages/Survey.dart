import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/AddSurvey.dart';
import 'package:sunstarmovers/pages/BottomNav.dart';
import 'package:sunstarmovers/pages/Row2.dart';
import 'package:sunstarmovers/pages/navBar.dart';
import 'package:sunstarmovers/pages/searchBar.dart';

class Survey extends StatefulWidget {
  const Survey({super.key});

  @override
  State<Survey> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 3.0,
        shadowColor: Colors.red,
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10))),
        backgroundColor: Colors.red,
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "Survey",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, fontFamily: 'Poppins',color: Colors.white),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddSurvey()));
                },
                icon: ImageIcon(
                  AssetImage("assets/plus-circle.png"),
                  size: 30,
                  color: Colors.white,
                ),
            ),
          ),
        ],
      ),

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

              Row(
                children: [
                  Expanded(
                    child: SearchBarr(),
                  ),
                  IconButton(onPressed: (){}, icon: ImageIcon(AssetImage("assets/3881_frame.png"),size: 35,))
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    children: [

                      Row(
                        children: [

                          Text("All Surveys",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,fontFamily: 'Poppins'),),
                          SizedBox(width: 90,),
                          Text("Show:",style: TextStyle(fontSize: 14,color: Colors.grey,fontFamily: 'Poppins',fontWeight: FontWeight.w400),),
                          Text("This Year",style: TextStyle(fontSize: 14,fontFamily: 'Poppins',fontWeight: FontWeight.w400),),
                          Image(image: AssetImage("assets/ic_Dropdown.png"))
                        ],
                      ),

                      SizedBox(height: 30,),

                      Row2(name: "Zack Snyder", image1: "assets/Group 162509.png", date: "12/12/2023", time: "12:45 PM", image2: 'assets/calendar.png', image3: 'assets/clock.png', percentage: '100%',),

                      SizedBox(height: 10,),
                      new Divider(
                        color: Colors.grey.shade300,
                      ),
                      SizedBox(height: 10,),

                      Row2(name: "James Wan", image1: "assets/Group 162507.png", date: "12/12/2023", time: "12:45 PM", image2: 'assets/calendar.png', image3: 'assets/clock.png', percentage: '75%',),

                      SizedBox(height: 10,),
                      new Divider(
                        color: Colors.grey.shade300,
                      ),
                      SizedBox(height: 10,),

                      Row2(name: "Peter Parker", image1: "assets/Group 162508.png", date: "12/12/2023", time: "12:45 PM", image2: 'assets/calendar.png', image3: 'assets/clock.png', percentage: '10%',),

                      SizedBox(height: 10,),
                      new Divider(
                        color: Colors.grey.shade300,
                      ),
                      SizedBox(height: 10,),


                      Row2(name: "James And", image1: "assets/startwork.png", date: "12/12/2023", time: "12:45 PM", image2: 'assets/calendar.png', image3: 'assets/clock.png', percentage: '10%',),

                      SizedBox(height: 10,),
                      new Divider(
                        color: Colors.grey.shade300,
                      ),
                      SizedBox(height: 10,),

                      Row2(name: "Finn Balor", image1: "assets/complete.png", date: "12/12/2023", time: "12:45 PM", image2: 'assets/calendar.png', image3: 'assets/clock.png', percentage: '10%',),

                    ],
                  ),
                ),
              )

            ],
          ),
        ),


      bottomNavigationBar: BottomNav(),
    );
  }
}