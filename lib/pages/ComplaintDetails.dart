import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/BottomSheetCommon.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/ComplaintClose.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/SurveyDetails.dart';

class ComplaintDetails extends StatelessWidget {
  final String status;
  const ComplaintDetails({super.key, required this.status});

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
                    return BottomShet1(title: 'Remark', hintName: 'Remark', labelName: 'Remark', buttonName1: 'Done', buttonName2: 'Close',);
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
                        CustomerDetail(title: 'Company Name : ', title1: 'Progbiz'),
                        CustomerDetail(title: 'Phone : ', title1: '+971 5436 78645'),
                        CustomerDetail(title: 'Whatsapp No : ', title1: '+971 5436 78645'),
                        CustomerDetail(title: 'Salesman : ', title1: 'ssmovers ss'),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10,),
                new Divider(
                  color: Colors.grey.shade300,
                ),

                SizedBox(height: 15,),

                Text3(name3: 'Survey Details'),
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
                      SurveyRow(title3: 'Date ', title4: '14/03/2024 '),
                      SurveyRow(title3: 'Ouoted Price', title4: '4500.0'),
                      SurveyRow(title3: 'Requirement', title4: 'Rajeev team'),
                      SurveyRow(title3: 'Closed Date', title4: '23/01/2024'),
                      SurveyRow(title3: 'Place From', title4: 'Kannur'),
                      SurveyRow(title3: 'Emirate From', title4: 'chalod'),
                      SurveyRow(title3: 'Place To', title4: 'chakkarakkal'),
                      SurveyRow(title3: 'Emirate To', title4: 'Ajman'),
                      SurveyRow(title3: 'Building Type', title4: 'Flat'),
                      SurveyRow(title3: 'Moving type', title4: 'Local Move'),
                      SurveyRow(title3: 'Final Volume', title4: '3 truck'),
                      SurveyRow(title3: 'Final Amount', title4: '4000.0'),
                      SurveyRow(title3: 'Collected box', title4: '20'),

                    ],
                  ),
                ),

                SizedBox(height: 15,),

                Text3(name3: 'Complaint Details'),
                SizedBox(height: 10,),


                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.grey.shade500),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Column(
                    children: [
                      SurveyRow(title3: 'Complaint Date ', title4: '14/03/2024'),
                      SurveyRow(title3: 'Complaint Date ', title4: 'test'),
                      SurveyRow(title3: 'Complaint Status', title4: 'Pending'),
                      SurveyRow(title3: 'Comment', title4: 'test comment'),
                    ],
                  ),
                ),

                SizedBox(height: 70,),

              ],
            ),
            Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                child: Container(
                  height: 55,
                  color: Colors.white,
                  child:status == 'Pending'? ButtonnElevated(
                    buttonName: 'Close Complaint',
                    onPressed: (){
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context)
                          {
                            return ComplaintClose();
                          }
                      );
                    },
                  ):SizedBox(),
                )
            ),
          ]
        ),
      ),

    );
  }
}
