import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/basicSettings_api.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/TextField1.dart';

class SettingEmiratesheet extends StatefulWidget {
  final int? emirateID;
  final String? emirateTypeName;
  const SettingEmiratesheet({super.key, this.emirateID, this.emirateTypeName});

  @override
  State<SettingEmiratesheet> createState() => _SettingEmiratesheetState();
}

class _SettingEmiratesheetState extends State<SettingEmiratesheet> {
  TextEditingController _emirateController=TextEditingController();


  @override

  void initState() {
    _emirateController.text=widget.emirateTypeName??'';
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
                  Text3(name3: 'Emirate')
                ],
              ),
              SizedBox(height: 15,),
              TextField1(
                  hintName: 'Emirate Name',
                  labelText: 'Emirate Name',
                  controller: _emirateController,
              ),

              SizedBox(height: 30,),

              Row(
                children: [
                  Expanded(
                      child: ButtonnElevated(
                        buttonName: 'Done',
                        onPressed: ()async{
                          var data={
                            "emiratesID": widget.emirateID??0,
                            "emiratesName": _emirateController.text,
                            "branchID": 0
                          };
                          
                          var isSuccess=await BasicSettingApi().EmirateSettingAdd(data);
                          if(isSuccess)
                            {
                              Get.back(result: true);
                            }
                        },
                      )),
                  SizedBox(width: 10,),
                  Expanded(child: ButtonnOutlined(title: 'Close',onPressed: (){},))
                ],
              ),

            ]
        ),
      ),
    );;
  }
}
