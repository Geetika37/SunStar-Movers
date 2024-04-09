import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/basicSettings_api.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/TextField1.dart';

class SettingsMovingSheet extends StatefulWidget {
  final int? movingTypeID;
  final String? movingTypeName;
  const SettingsMovingSheet({super.key, this.movingTypeID, this.movingTypeName});

  @override
  State<SettingsMovingSheet> createState() => _SettingsMovingSheetState();
}

class _SettingsMovingSheetState extends State<SettingsMovingSheet> {
  TextEditingController _movingTypeController=TextEditingController();

  @override
  void initState() {
    _movingTypeController.text=widget.movingTypeName??'';
    super.initState();
  }
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
            children:[
              SizedBox(height: 25),
              Row(
                children: [
                  Text3(name3: 'Moving Type')
                ],
              ),
              SizedBox(height: 15,),
              TextField1(
                  hintName: 'Moving Type Name',
                  labelText: 'Moving Type Name',
                  controller: _movingTypeController,
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Expanded(child:
                  ButtonnElevated(
                    buttonName: 'Done',
                    onPressed: ()async{
                      var data={
                        "movingTypeID": widget.movingTypeID ?? 0,
                        "movingTypeName": _movingTypeController.text,
                        "branchID": 0
                      };

                      var isSuccess=await BasicSettingApi().MovingTypeSettingAdd(data);
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
              ),

            ]
        ),
      ),
    );
  }
}
