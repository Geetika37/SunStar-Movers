import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/Complaint.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/SurveyPendingConfirm.dart';
import 'package:sunstarmovers/pages/TextField1.dart';

class ComplaintClose extends StatelessWidget {
  const ComplaintClose({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children:[
            ListView(
              children: [
                SizedBox(height: 15,),
                Text3(name3: 'Close Complaint'),
                TextField1(hintName: 'Date', labelText: 'Date',image1: 'assets/Group 33192.png',),
                SizedBox(height: 10,),
                Textformfield(hintName: 'Reason', labelText: 'Reason'),
              ],
            ),
            Positioned(
              left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  child: Row(
                    children: [
                      Expanded(child: ButtonnElevated(buttonName: 'Done',onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Complaint()));},)),
                      SizedBox(width: 10,),
                      Expanded(child: ButtonnOutlined(title: 'Close',onPressed: (){Navigator.pop(context);},))
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
