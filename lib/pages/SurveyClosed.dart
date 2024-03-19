import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/Survey.dart';
import 'package:sunstarmovers/pages/TextField1.dart';

class SurveyClosed extends StatelessWidget {
  const SurveyClosed({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 335,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children:[
            ListView(
              children: [
                SizedBox(height: 10,),
                Text3(name3: 'Collect'),
                SizedBox(height: 15,),

                TextField1(hintName: 'Date', labelText: 'Date',image1: 'assets/Group 33192.png',),
                SizedBox(height: 10,),
                TextField1(hintName: 'Pending Box', labelText: 'Pending Box'),
                SizedBox(height: 10,),
                TextField1(hintName: 'Box Collected', labelText: 'Box Collected'),
                SizedBox(height: 10,),

              ],
            ),
            Positioned(
              right: 0,
                bottom: 0,
                left: 0,
                child:Container(
                  child: Row(
                children: [
                  Expanded(child: ButtonnElevated(buttonName: 'Done',onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Survey()));},)),
                  SizedBox(width: 20,),
                  Expanded(child: ButtonnOutlined(title: 'Close',onPressed: (){Navigator.pop(context);},))
                ],
              ),
            ) )
          ],




        )
        ),
    );
  }
}
