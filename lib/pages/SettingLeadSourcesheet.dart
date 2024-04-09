import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/basicSettings_api.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/TextField1.dart';

class SettingLeadSourceSheet extends StatefulWidget {
  final int? leadSourceID;
  final String? leadSourceName;
  const SettingLeadSourceSheet({super.key, this.leadSourceID, this.leadSourceName});

  @override
  State<SettingLeadSourceSheet> createState() => _SettingLeadSourceSheetState();
}

class _SettingLeadSourceSheetState extends State<SettingLeadSourceSheet> {
  TextEditingController _leadSourceController=TextEditingController();


  @override

  void initState() {
    _leadSourceController.text=widget.leadSourceName??'';
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
                  Text3(name3: 'Lead Source')
                ],
              ),
              SizedBox(height: 15,),
              TextField1(
                  hintName: 'Lead Source Name',
                  labelText: 'Lead Source Name',
                controller: _leadSourceController,
              ),
              SizedBox(height: 30,),

              Row(
                children: [
                  Expanded(child: ButtonnElevated(
                    buttonName: 'Done',
                    onPressed: ()async{
                      var data={
                          "leadSourceID": widget.leadSourceID??0,
                          "leadSourceName": _leadSourceController.text,
                          "branchID": 0
                      };
                      var isSuccess=await BasicSettingApi().LeadSourceSettingAdd(data);
                      if(isSuccess)
                        {
                          Get.back(result: true);
                        }
                    },
                  ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(child: ButtonnOutlined(title: 'Close',onPressed: (){},))
                ],
              ),

            ]
        ),
      ),
    );
  }
}
