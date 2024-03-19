import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/BottomSheetCommon.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/SurveyDetails.dart';

class MarketingDetails extends StatelessWidget {
  const MarketingDetails({super.key});

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
            "Details",
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
                    context: context,
                    builder: (BuildContext context)
                    {
                      return BottomShet1(title: 'Activity Remark', hintName: 'Feedback', labelName: 'Feedback', buttonName1: 'Done', buttonName2: 'Close',);
                    }
                );
              },
              icon: ImageIcon(
                AssetImage('assets/comment.png'),
                color: Colors.white,
              ),
          ),

          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: ImageIcon(
                AssetImage('assets/back.png'),
                color: Colors.white,
              ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Stack(
          children:[
            ListView(
              children: [
                Text3(name3: 'Customer Details'),
                SizedBox(height: 10,),
                new Divider(color: Colors.grey.shade300,),
                SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Image.asset('assets/Group 427318252.png'),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text3(name3: 'Zack Snyder'),
                        CustomerDetail(title: 'Designation : ', title1: 'kannur'),
                        CustomerDetail(title: 'Company Name : ', title1: 'Progbiz'),
                        CustomerDetail(title: 'Email : ', title1: 'marketing@gmail.com'),
                        CustomerDetail(title: 'Phone : ', title1: '+971 5436 78645'),
                        CustomerDetail(title: 'Whatsapp No : ', title1: '+971 5436 78645'),
                        CustomerDetail(title: 'Nationality : ', title1: 'India'),
                        CustomerDetail(title: 'Salesman : ', title1: 'ssmovers ss'),
                        CustomerDetail(title: 'Address : ', title1: 'kannur 1'),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10,),
                new Divider(
                  color: Colors.grey.shade300,
                ),

                SizedBox(height: 15,),

                Text('Marketing Details',style: TextStyle(fontSize: 20,fontFamily: 'Poppins',fontWeight: FontWeight.w600),),
                SizedBox(height: 10,),

                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.grey.shade500),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Column(
                    children: [
                      SurveyRow(title3: 'Ref No', title4: '24'),
                      SurveyRow(title3: 'Date & Time', title4: '14/03/2024 | 8 PM'),
                      SurveyRow(title3: 'Activity', title4: 'Marketing'),
                      SurveyRow(title3: 'Activity Details', title4: 'Details'),
                    ],
                  ),
                )

              ],
            ),
            Positioned(
              left: 0,
                bottom: 0,
                right: 0,
                child: Container(
                  height: 55,
                  color: Colors.white,
                  child: ButtonnElevated(
                      buttonName: 'Delete',
                    onPressed: (){
                        Navigator.pop(context);
                    },
                  ),
                ),
            ),

          ]
        ),
      ),
    );
  }
}
