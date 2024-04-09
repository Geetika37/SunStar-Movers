import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/basicSettings_api.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/TextField1.dart';

class SettingTeamLeadSheet extends StatefulWidget {
  const SettingTeamLeadSheet({super.key});

  @override
  State<SettingTeamLeadSheet> createState() => _SettingTeamLeadSheetState();
}

class _SettingTeamLeadSheetState extends State<SettingTeamLeadSheet> {
  TextEditingController _teamLeadController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
            children:[

              SizedBox(height: 25,),
              Row(
                children: [
                  Text3(name3: 'Team Leader')
                ],
              ),
              SizedBox(height: 15,),
              TextField1(
                  hintName: 'Team Leader Name',
                  labelText: 'Team Leader Name',
                  controller: _teamLeadController,
              ),
              SizedBox(height: 30,),

              Row(
                children: [
                  Expanded(child: ButtonnElevated(
                    buttonName: 'Done',
                    onPressed: ()async{
                      var data={
                        "isDeleted": true,
                        "teamLeaderID": 0,
                        "teamLeaderName": _teamLeadController.text,
                        "branchID": 0
                      };

                      var isSuccess=await BasicSettingApi().TeamLeadTypeSettingAdd(data);
                      if(isSuccess)
                        {
                          Get.back(result: true);
                        }
                    },
                  )
                  ),
                  SizedBox(width: 10,),
                  Expanded(child: ButtonnOutlined(title: 'Close',onPressed: (){},))
                ],
              )
            ]
        ),
      ),
    );;
  }
}
