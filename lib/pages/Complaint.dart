import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/ComplaintAddBottomsheet.dart';
import 'package:sunstarmovers/pages/ComplaintBottomSheet.dart';
import 'package:sunstarmovers/pages/ComplaintDetails.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/searchBar.dart';

class Complaint extends StatelessWidget {
  const Complaint({super.key});

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
            "Complaints",
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
                showModalBottomSheet(
                  isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context)
                    {
                      return ComplaintAddBottomSheet();
                    }
                );
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

      body: ListView(
        children: [
          SizedBox(height: 5,),
          Row(
            children: [
              Expanded(
                  child:SearchBarr(title: 'Search for complaints', image: 'assets/3864_boolean_operation.png'),
              ),
              IconButton(
                  onPressed: (){
                    showModalBottomSheet(
                      isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context)
                        {
                          return ComplaintBottomSheet();
                        }
                    );
                  },
                  icon: ImageIcon(AssetImage('assets/3881_frame.png'),size: 35,)
              )
            ],
          ),
          
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text3(name3: 'Complaints'),
                      ],
                    ),
                    SizedBox(height: 30,),

                    Row3(status: 'Pending', color1:const Color(0xfffFFEFEF) ,color2:const Color(0xfffFC5A5A),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ComplaintDetails(status: 'Pending')));},name1: 'Zack Snyder', date: '12/12/2023', time: 'Steve', image1: 'assets/calendar.png', image2: 'assets/user-03.png', image3: 'assets/pending.png',),
                    SizedBox(height: 10,),

                    new Divider(
                      color: Colors.grey.shade300,
                    ),

                    SizedBox(height: 10,),
                    Row3(status: 'Closed', color1:const Color(0xfffE8F2FE) ,color2:const Color(0xfff157CF0),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ComplaintDetails(status: 'Closed',)));},name1: 'Zack Snyder', date: '12/12/2023', time: 'Steve', image1: 'assets/calendar.png', image2: 'assets/user-03.png', image3: 'assets/closed.png',),
                    SizedBox(height: 10,),

                    new Divider(
                      color: Colors.grey.shade300,
                    ),

                    SizedBox(height: 10,),
                    Row3(status: 'Pending', color1:const Color(0xfffFFEFEF) ,color2:const Color(0xfffFC5A5A),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ComplaintDetails(status: 'Pending',)));},name1: 'Zack Snyder', date: '12/12/2023', time: 'Steve', image1: 'assets/calendar.png', image2: 'assets/user-03.png', image3: 'assets/pending.png',),
                    SizedBox(height: 10,),

                    new Divider(
                      color: Colors.grey.shade300,
                    ),

                    SizedBox(height: 10,),
                    Row3(status: 'Closed', color1:const Color(0xfffE8F2FE) ,color2:const Color(0xfff157CF0),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ComplaintDetails(status:'Closed' ,)));},name1: 'Zack Snyder', date: '12/12/2023', time: 'Steve', image1: 'assets/calendar.png', image2: 'assets/user-03.png', image3: 'assets/closed.png',),
                    SizedBox(height: 10,),

                  ],
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
