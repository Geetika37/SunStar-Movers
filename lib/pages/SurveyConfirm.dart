import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/Survey.dart';
import 'package:sunstarmovers/pages/SurveyPendingConfirm.dart';
import 'package:sunstarmovers/pages/TextField1.dart';

class SurveyConfirm extends StatelessWidget {
  const SurveyConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            SizedBox(height: 10,),
            Text3(name3: 'Start Work'),
            SizedBox(height: 15,),
            Row(
              children: [
                Expanded(child: TextField1(hintName: 'Date', labelText: 'Date',image1: 'assets/Group 33192.png',)),
                SizedBox(width: 10,),
                Expanded(child: Dropdown(hintText: 'Time'),)
              ],
            ),
            SizedBox(height: 10,),
            Dropdown(hintText: 'Choose Team Leader'),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(child: ButtonnElevated(buttonName: 'Done',onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Survey()));},),),
                SizedBox(width: 10,),
                Expanded(child: ButtonnOutlined(title: 'Close',onPressed: (){Navigator.pop(context);},))
              ],
            )
          ],
        ),
      ),
    );
  }
}
