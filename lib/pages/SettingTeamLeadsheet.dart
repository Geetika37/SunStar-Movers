import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/TextField1.dart';

class SettingTeamLeadSheet extends StatelessWidget {
  const SettingTeamLeadSheet({super.key});

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
                      Text3(name3: 'Team Leader')
                    ],
                  ),
                  SizedBox(height: 15,),
                  TextField1(hintName: 'Team Leader Name', labelText: 'Team Leader Name'),

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
    );;
  }
}
