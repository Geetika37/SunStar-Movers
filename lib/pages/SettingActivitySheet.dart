import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/basicSettings_api.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/TextField1.dart';

class SettingActivitySheet extends StatefulWidget {
  final int? activityID;
  final String? activityName;
  const SettingActivitySheet({super.key, this.activityID, this.activityName});

  @override
  State<SettingActivitySheet> createState() => _SettingActivitySheetState();
}

class _SettingActivitySheetState extends State<SettingActivitySheet> {
  TextEditingController _activityController=TextEditingController();


  @override

  void initState() {
    _activityController.text=widget.activityName??'';
    super.initState();
  }

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
                  Text3(name3: 'Activity')
                ],
              ),
              SizedBox(height: 15,),
              TextField1(
                  hintName: 'Activity Name',
                  labelText: 'Activity Name',
                  controller: _activityController,
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Expanded(child: ButtonnElevated(
                    buttonName: 'Done',
                    onPressed: ()async{
                      var data={
                        "marketingTypeID": widget.activityID??0,
                        "marketingTypeName": _activityController.text,
                        "branchID": 0
                      };

                      var isSuccess=await BasicSettingApi().ActivitySettingAdd(data);
                      if(isSuccess)
                        {
                          Get.back(result: true);
                        }
                    },
                  )),
                  SizedBox(width: 10,),
                  Expanded(child: ButtonnOutlined(title: 'Close',onPressed: (){},))
                ],
              )
            ]
        ),
      ),
    );
  }
}
