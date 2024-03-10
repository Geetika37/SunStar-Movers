import 'package:flutter/material.dart';
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
        
              TextField1(hintName: 'Building Type', labelText: 'Building Type',image1: 'assets/Vector.png'),
              SizedBox(height: 10,),
        
              TextField1(hintName: 'Moving Type', labelText: 'Moving Type',image1: 'assets/Vector.png'),
              SizedBox(height: 10,),
        
              TextField1(hintName: 'Volume', labelText: 'Volume'),
              SizedBox(height: 10,),

              TextField1(hintName: 'Place From', labelText: 'Place From',image1: 'assets/Vector.png'),
              SizedBox(height: 10,),

              TextField1(hintName: 'Place To', labelText: 'Place To',image1: 'assets/Vector.png'),
              SizedBox(height: 10,),

              TextField1(hintName: 'Quoted Price', labelText: 'Quoted Price'),
              SizedBox(height: 10,),

              TextField1(hintName: 'Lead Source', labelText: 'Lead Source',image1: 'assets/Vector.png'),
              SizedBox(height: 10,),

              TextField1(hintName: 'Moving Date', labelText: 'Moving Date',image1: 'assets/Group 33192.png'),
              SizedBox(height: 10,),

              TextField1(hintName: 'Lead Quality', labelText: 'Lead Quality',image1: 'assets/Vector.png'),
              SizedBox(height: 10,),

              TextField1(hintName: 'Requirement', labelText: 'Requirement'),
              SizedBox(height: 10,),
              
              Row(
                children: [

                  Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            onPressed: (){
                              showDialog(context: context,
                                  builder:(BuildContext context)
                                  {
                                    return showDialog1();
                                  }
                              );
                            } ,
                            child: Text('save',style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Poppins',fontSize: 17)),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor:Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) ),
                        ),
                      )
                  ),
                  SizedBox(width: 10,),


                  Expanded(
                      child: SizedBox(
                        height: 50,
                        child: OutlinedButton(
                          onPressed: (){

                          } ,
                          child: Text('Cancel',style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Poppins',fontSize: 17)),
                          style: ElevatedButton.styleFrom(
                              foregroundColor:Colors.red,
                              side:BorderSide(color: Colors.red,width: 1) ,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) ),),
                      )
                  ),

                  ElevatedButton(onPressed: (){}, child: Text(''))

                ],
              )
        
            ],
          ),
        ),
      ),
    );
  }
}
