import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/MarketingAdd.dart';
import 'package:sunstarmovers/pages/MarketingBottomSheet.dart';
import 'package:sunstarmovers/pages/MarketingDetails.dart';
import 'package:sunstarmovers/pages/Row2.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/searchBar.dart';

class Marketing extends StatelessWidget {
  const Marketing({super.key});

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
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: ImageIcon(
              AssetImage('assets/chevron-left.png'),
              color: Colors.white,
            )),
        title: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "Marketing",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MarketingAdd()));
              },
              icon: ImageIcon(
                AssetImage(
                  'assets/plus-circle.png',
                ),
                size: 30,
                color: Colors.white,
              )
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [

            Row(
              children: [
                Expanded(
                    child:SearchBarr(title: 'Search for Marketing', image: 'assets/3864_boolean_operation.png',),
                ),
                IconButton(
                    onPressed: (){
                      showModalBottomSheet(
                        isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context)
                          {
                            return  MarketingBottomSheet();
                          }
                      );
                    },
                    icon: ImageIcon(AssetImage("assets/3881_frame.png"),size: 35,))
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Marketing",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,fontFamily: 'Poppins'),),
                      ],
                    ),
                    SizedBox(height: 30,),
                    
                    Row3( status: 'Marketing', color1:const Color(0xfffFFEFEF) ,color2:const Color(0xfffFC5A5A),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>MarketingDetails()));},name1: 'Zack Snyder', name2: '12/12/2023', name3: '12:45 PM', image1: 'assets/calendar.png', image2: 'assets/clock.png', image3: 'assets/offcework.png', ),
                    SizedBox(height: 10,),
                    
                    new Divider(
                      color: Colors.grey.shade300,
                    ),
                    
                    SizedBox(height: 10,),
                    Row3(status: 'visit', color1:const Color(0xfffFFEFEF) ,color2:const Color(0xfffFC5A5A),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>MarketingDetails()));},name1: 'James Wan', name2: '12/12/2023', name3: '12:45 PM', image1: 'assets/calendar.png', image2: 'assets/clock.png', image3: 'assets/visit.png'),
                    SizedBox(height: 10,),
                    
                    new Divider(
                      color: Colors.grey.shade300,
                    ),
                    
                    SizedBox(height: 10,),
                    Row3(status: 'Marketing', color1:const Color(0xfffFFEFEF) ,color2:const Color(0xfffFC5A5A),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>MarketingDetails()));},name1: 'Peter Parker', name2: '12/12/2023', name3: '12:45 PM', image1: 'assets/calendar.png', image2: 'assets/clock.png', image3: 'assets/marketnng.png'),
                    SizedBox(height: 10,),

                    new Divider(
                      color: Colors.grey.shade300,
                    ),
                    
                    SizedBox(height: 10,),
                    Row3(status: 'Marketing', color1:const Color(0xfffFFEFEF) ,color2:const Color(0xfffFC5A5A),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>MarketingDetails()));},name1: 'James Anderson', name2: '12/12/2023', name3: '12:45 PM', image1: 'assets/calendar.png', image2: 'assets/clock.png', image3: 'assets/meetng.png'),
                    SizedBox(height: 10,),

                    new Divider(
                      color: Colors.grey.shade300,
                    ),
                    
                    SizedBox(height: 10,),
                    Row3(status: 'visit', color1:const Color(0xfffFFEFEF) ,color2:const Color(0xfffFC5A5A),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>MarketingDetails()));},name1: 'Finn Balor', name2: '12/12/2023', name3: '12:45 PM', image1: 'assets/calendar.png', image2: 'assets/clock.png', image3: 'assets/complete.png')

                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
