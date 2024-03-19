import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/SurveyPendingConfirm.dart';
import 'package:sunstarmovers/pages/TextField1.dart';
import 'package:sunstarmovers/pages/showDialog.dart';

class MarketingAdd extends StatelessWidget {
  const MarketingAdd({super.key});

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
            "Add Marketing",
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
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField1(hintName: 'Ref No', labelText: 'Ref No'),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(child: TextField1(hintName: 'Date', labelText: 'Date',image1: 'assets/Group 33192.png',)),
                  SizedBox(width: 10,),
                  Expanded(child: TextField1(hintName: 'Time', labelText: 'Time',image1: 'assets/Icon1.png',))
                ],
              ),
              SizedBox(height: 10,),
              Dropdown(hintText: 'Acitivity'),
              SizedBox(height: 10,),
              TextField1(hintName: 'Phone Number', labelText: 'Phone Number'),
              SizedBox(height: 10,),
              TextField1(hintName: 'Whatsapp Number', labelText: 'Whatsapp Number'),
              SizedBox(height: 10,),
              TextField1(hintName: 'Customer Name', labelText: 'Customer Name'),
              SizedBox(height: 10,),
              TextField1(hintName: 'Email Address', labelText: 'Email Address'),
              SizedBox(height: 10,),
              TextField1(hintName: 'Company Name', labelText: 'Company Name'),
              SizedBox(height: 10,),
              TextField1(hintName: 'Designation', labelText: 'Designation'),
              SizedBox(height: 10,),
              TextField1(hintName: 'Address', labelText: 'Address'),
              SizedBox(height: 10,),
              TextField1(hintName: 'Nationality', labelText: 'Nationality'),
              SizedBox(height: 10,),
              TextField1(hintName: 'Place', labelText: 'Place'),
              SizedBox(height: 10,),
              Dropdown(hintText: 'Emirate'),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ButtonnElevated(
                            buttonName: 'Save',
                            onPressed: (){
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context)
                                  {
                                    return showDialog1(title: 'Marketing Added', subtitle: 'The marketing has been added successfully', image: 'assets/Group 427318220.png', buttonText1: 'Close');
                                  }
                              );
                            }),
                      )
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ButtonnOutlined(
                            title:'Cancel',
                            onPressed: (){},
                        ),
                      ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
