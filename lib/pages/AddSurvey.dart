import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/SurveyPendingConfirm.dart';
import 'package:sunstarmovers/pages/TextField1.dart';
import 'package:sunstarmovers/pages/showDialog.dart';

class AddSurvey extends StatefulWidget {
  const AddSurvey({super.key});

  @override
  State<AddSurvey> createState() => _AddSurveyState();
}

class _AddSurveyState extends State<AddSurvey> {
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
            "Add Survey",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: Colors.white),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
        
              TextField1(
                hintName: 'Survey No',
                labelText: 'Survey No',
              ),
              SizedBox(height: 10),
        
              Row(
                children: [
                  Expanded(
                      child: TextField1(
                    hintName: 'Date',
                    labelText: 'Date',
                          image1: 'assets/Group 33192.png'
                  )),
                  SizedBox(width: 10,),
                  Expanded(
                      child: TextField1(
                    hintName: 'Time',
                    labelText: 'Time',
                          image1: 'assets/Icon1.png'
                  ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              
              TextField1(hintName: 'Customer Name', labelText: 'Customer Name'),
              SizedBox(height: 10),
              
              TextField1(hintName: 'Customer Phone', labelText: 'Customer Phone'),
              SizedBox(height: 10,),
        
              TextField1(hintName: 'Email Address', labelText: 'Email Address'),
              SizedBox(height: 10,),
        
              TextField1(hintName: 'Company Name', labelText: 'Company Name'),
              SizedBox(height: 10,),
        
              Dropdown(hintText: 'Building Type'),
              SizedBox(height: 10,),
        
              Dropdown(hintText: 'Moving Type'),
              SizedBox(height: 10,),
        
              TextField1(hintName: 'Volume', labelText: 'Volume'),
              SizedBox(height: 10,),

              Dropdown(hintText: 'Place From'),
              SizedBox(height: 10,),

              Dropdown(hintText: 'Place To'),
              SizedBox(height: 10,),

              TextField1(hintName: 'Quoted Price', labelText: 'Quoted Price'),
              SizedBox(height: 10,),

              Dropdown(hintText: 'Lead Source'),
              SizedBox(height: 10,),

              TextField1(hintName: 'Moving Date', labelText: 'Moving Date',image1: 'assets/Group 33192.png'),
              SizedBox(height: 10,),

              Dropdown(hintText: 'Lead Quality'),
              SizedBox(height: 10,),

              TextField1(hintName: 'Requirement', labelText: 'Requirement'),
              SizedBox(height: 10,),
              
              Row(
                children: [
                  Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ButtonnElevated(
                          onPressed: (){
                          showDialog(context: context,
                              builder:(BuildContext context)
                              {
                                return showDialog1(title: 'Survey Added',subtitle: 'This Survey has been added successfully',image: 'assets/Group 427318220.png',buttonText1: 'Close',);
                              }
                          );
                        }, buttonName: 'Save' ,

                        ),
                      )
                  ),
                  SizedBox(width: 10,),


                  Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ButtonnOutlined(
                            title: 'Cancel',
                            onPressed: ()
                            {

                            }
                            ),
                      )
                  ),


                ],
              )
        
            ],
          ),
        ),
      ),
    );
  }
}
