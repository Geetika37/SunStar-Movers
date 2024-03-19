import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/BottomSheetCommon.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/SurveyClosed.dart';
import 'package:sunstarmovers/pages/SurveyConfirm.dart';
import 'package:sunstarmovers/pages/SurveyPendingConfirm.dart';
import 'package:sunstarmovers/pages/SurveyStartwork.dart';
import 'package:sunstarmovers/pages/showDialog.dart';
import 'package:sunstarmovers/pages/showDialog2.dart';

class SurveyDetails extends StatelessWidget {
  final String status;
  const SurveyDetails({super.key, required this.status});

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
            "Survey",
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
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return showDialog2(
                      title: 'Confirm',
                      subtitle: 'Are you sure you want to delete this survey?',
                      button1: 'Yes',
                      button2: 'Cancel',
                    );
                  },
                );
              },
              icon: ImageIcon(
                AssetImage(
                  'assets/Delete.png',
                ),
                color: Colors.white,
              )),

          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context)
                    {
                      return BottomShet1(title: 'Add Comment', hintName: 'comment', labelName: 'comment', buttonName1: 'Confirm', buttonName2: 'Cancel',);
                    }
                );
              },
              icon: ImageIcon(
                AssetImage('assets/comment.png'),
                color: Colors.white,
              )),

          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: ImageIcon(
                AssetImage('assets/back.png'),
                color: Colors.white,
              )),
        ],
      ),


      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(children: [
          ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Customer Details',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              new Divider(
                color: Colors.grey.shade300,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image(image: (AssetImage('assets/Group 427318252.png'))),
                  Image.asset('assets/Group 427318252.png'),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Zack Snyder',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600),
                      ),
                      CustomerDetail(
                        title: 'Company Name : ',
                        title1: 'Progbiz',
                      ),
                      CustomerDetail(
                        title: 'Email : ',
                        title1: 'Zack@gmail.com',
                      ),
                      CustomerDetail(
                        title: 'Phone : ',
                        title1: '+971 5436 78645',
                      ),
                      CustomerDetail(
                        title: 'Whatsapp No : ',
                        title1: '+971 5436 78645',
                      ),
                      CustomerDetail(
                        title: 'Nationality : ',
                        title1: 'India',
                      ),
                      CustomerDetail(
                        title: 'Salesman : ',
                        title1: 'ssmovers ss',
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              new Divider(
                color: Colors.grey.shade300,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Survey Details',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey.shade500),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    SurveyRow(title3: 'Ref No', title4: '67'),
                    SurveyRow(title3: 'Survey Type', title4: 'PhysicalSurvey'),
                    SurveyRow(title3: 'Survey No', title4: '8000'),
                    SurveyRow(
                        title3: 'Total price',
                        title4: '1000.0 + 50.0 = 1050.0'),
                    SurveyRow(title3: 'Volume', title4: '1 load'),
                    SurveyRow(title3: 'Work Duration', title4: '1 days'),
                    SurveyRow(
                        title3: 'Date & Time', title4: '12/03/2024 | 2 PM'),
                    SurveyRow(title3: 'Order Status', title4: 'Pending'),
                    SurveyRow(title3: 'Team Leader', title4: ''),
                    SurveyRow(title3: 'Instructions', title4: 'test'),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey.shade500),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    SurveyRow(title3: 'Place From', title4: 'Kannur'),
                    SurveyRow(title3: 'Emirate', title4: 'chalod'),
                    SurveyRow(title3: 'Place to', title4: 'chakkarakkal'),
                    SurveyRow(title3: 'Emirate', title4: 'Ajman'),
                    SurveyRow(title3: 'Lead quality', title4: '10%'),
                    SurveyRow(title3: 'Lead Source', title4: 'fayis'),
                    SurveyRow(title3: 'Building Type', title4: 'Flat'),
                    SurveyRow(title3: 'Moving type', title4: 'Local Move'),
                    SurveyRow(
                        title3: 'Moving date & Time', title4: '12/03/2024'),
                    SurveyRow(title3: 'Confirmed Moving Dates', title4: ''),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey.shade500),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    SurveyRow(
                        title3: 'Agreed Amount', title4: '0.0 + 0.0 = 0.0'),
                    SurveyRow(title3: 'Work start date & Time', title4: ''),
                    SurveyRow(title3: 'Final Volume', title4: ''),
                    SurveyRow(
                        title3: 'Final Amount', title4: '0.0 + 0.0 - 0 = 0.0'),
                    SurveyRow(title3: 'Boxes to be collected', title4: '0'),
                    SurveyRow(title3: 'Payment status', title4: '0'),
                    SurveyRow(title3: 'Collected box', title4: '0'),
                    SurveyRow(title3: 'Cancel Reason', title4: ''),
                    SurveyRow(title3: 'Closed Date & Time', title4: ''),
                  ],
                ),
              ),
              SizedBox(
                height: 90,
              ),
            ],
          ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              height: 70,
              color: Colors.white,
              child: status == 'Pending'? Row(
                children: [
                  Expanded(
                    child: ButtonnElevated(
                      buttonName: 'Confirm',
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context)
                            {
                              return SurveyPendingConfirm();
                            }
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(child: ButtonnOutlined(title: 'Cancel',onPressed: (){Navigator.pop(context);},))
                ],
              ):
              status== 'Confirm'? ButtonnElevated(buttonName: 'Start Work',onPressed: (){
                      showModalBottomSheet(context: context, builder: (BuildContext context)
                            {
                              return SurveyConfirm();
                            }
                      );
                },):
              status=='Closed' ? ButtonnElevated(buttonName: 'Collect',onPressed: (){
                      showModalBottomSheet(context: context, builder: (BuildContext context)
                            {
                              return SurveyClosed();
                            }
                      );
              },):
                  status == 'Start Work' ? ButtonnElevated(buttonName: 'Complete work',onPressed: (){
                    showModalBottomSheet(context: context,isScrollControlled: true, builder: (BuildContext context)
                      {
                        return SurveyStartWork();
                      }
                    );
                  },):
                      SizedBox()
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: Image.asset('assets/whatspp.png'),
      ),
    );
  }
}

class CustomerDetail extends StatelessWidget {
  final String title;
  final String title1;
  const CustomerDetail({super.key, required this.title, required this.title1});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w400, fontFamily: 'Poppins', fontSize: 14),
        ),
        Text(
          title1,
          style: TextStyle(
              fontWeight: FontWeight.w400, fontFamily: 'Poppins', fontSize: 14),
        )
      ],
    );
  }
}

class SurveyRow extends StatelessWidget {
  final String title3;
  final String title4;
  const SurveyRow({super.key, required this.title3, required this.title4});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title3,
          style: TextStyle(
              fontWeight: FontWeight.w500, fontFamily: 'Poppins', fontSize: 14),
        ),
        Text(
          title4,
          style: TextStyle(
              fontWeight: FontWeight.w500, fontFamily: 'Poppins', fontSize: 14),
        )
      ],
    );
  }
}
