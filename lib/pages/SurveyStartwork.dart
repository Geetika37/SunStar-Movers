import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/SurveyPendingConfirm.dart';
import 'package:sunstarmovers/pages/TextField1.dart';

class SurveyStartWork extends StatelessWidget {
  const SurveyStartWork({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 530,
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Stack(
            children:[
              ListView(
                children: [
                  SizedBox(height: 10,),
                  Text3(name3: 'Complete Survey'),
                  SizedBox(height: 15,),

                  TextField1(hintName: 'Date', labelText: 'Date',image1: 'assets/Group 33192.png',),
                  SizedBox(height: 10,),
                  TextField1(hintName: 'Final Volume', labelText: 'Pending Box'),
                  SizedBox(height: 10,),
                  TextField1(hintName: 'Work Duration', labelText: 'Box Collected'),
                  SizedBox(height: 10,),
                  TextField1(hintName: 'Final Amount', labelText: 'Pending Box'),
                  SizedBox(height: 10,),
                  TextField1(hintName: 'Boxes to be collected', labelText: 'Box Collected'),
                  SizedBox(height: 10,),
                  Dropdown(hintText: 'Payment Status')
                ],
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(child: ButtonnElevated(buttonName: 'Done',onPressed: (){},)),
                        SizedBox(width: 10,),
                        Expanded(child: ButtonnOutlined(title: 'Close',onPressed: (){},))
                      ],
                    ),
                  )
              )
            ],
          )
      ),
    );
  }
}
