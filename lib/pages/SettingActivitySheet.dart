import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/TextField1.dart';

class SettingActivitySheet extends StatelessWidget {
  const SettingActivitySheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
            children:[
              ListView(
                children: [
                  SizedBox(height: 25,),
                  Row(
                    children: [
                      Text3(name3: 'Activity')
                    ],
                  ),
                  SizedBox(height: 15,),
                  TextField1(hintName: 'Activity Name', labelText: 'Activity Name'),

                ],
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
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
            ]
        ),
      ),
    );
  }
}
