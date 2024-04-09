import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/surveyconfirm_api.dart';
import 'package:sunstarmovers/controller/appController.dart';
import 'package:sunstarmovers/enums/enum.dart';
import 'package:sunstarmovers/pages/AddSurvey.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/Survey.dart';
import 'package:sunstarmovers/pages/SurveyPendingConfirm.dart';
import 'package:sunstarmovers/pages/TextField1.dart';
import 'package:sunstarmovers/responses/AllSurveyResponse.dart';
import 'package:sunstarmovers/responses/TeamLeaderResponse.dart';

class SurveyConfirm extends StatefulWidget {
  final AllSurveyResponse? allSurveyResponse;
  const SurveyConfirm({super.key, this.allSurveyResponse});

  @override
  State<SurveyConfirm> createState() => _SurveyConfirmState();
}

class _SurveyConfirmState extends State<SurveyConfirm> {
  TextEditingController _dateController=TextEditingController();
  DateTime? _picked;
  String? _time;
  TeamLeaderResponse? _teamLeaderController;
  bool screenLoad=true;

  AppController appCt=Get.find();

  @override

  void initState() {
    getTeamLeader();
    super.initState();
  }

  getTeamLeader()async
  {
    appCt.teamLeaderResponse=await SurveyConfirmApi().teamLeader();
    _teamLeaderController=appCt.teamLeaderResponse!.firstWhere((element) => element.id==appCt.allSurveyResponse?.taxCategoryID);
    setState(() {
      screenLoad=true;
    });
  }

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
                Expanded(child: TextField1(
                  hintName: 'Date', labelText: 'Date',image1: 'assets/Group 33192.png',
                  controller: _dateController,
                  isKey: true,
                  onTap: ()
                  {
                    _selectDate();
                  },
                )),
                SizedBox(width: 10,),
                Expanded(child: AppDropdownInput(
                  hintText: 'Time',
                  value: _time,
                  options: timeList,
                  getLabel: (String val)
                  {
                    return val;
                  },
                  onChanged: (val)
                  {
                    setState(() {
                      _time=val;
                    });
                  },
                ),)
              ],
            ),
            SizedBox(height: 10,),

            AppDropdownInput(
              hintText: 'Team Leader',
              value: _teamLeaderController,
              options: appCt.teamLeaderResponse!,
              getLabel: (val)
              {
                return val.value!;
              },
              onChanged: (val)
              {
                setState(() {
                  _teamLeaderController=val;
                });
              },
            ),

            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(child: ButtonnElevated(buttonName: 'Done',onPressed: ()async{

                  var data={
                    "surveyID": widget.allSurveyResponse!.surveyID!=null ? widget.allSurveyResponse?.surveyID :0,
                    "teamLeaderID": _teamLeaderController?.id,
                    "teamLeaderName": _teamLeaderController?.value,
                    "workStartDate": _picked!.toIso8601String(),
                    "workStartTime": _time,
                    "orderStatus": OrderStatus.StartWork.index,
                    "canceledReason": null
                  };

                  var isSuccess=await SurveyConfirmApi().StartWorkSurvey(data);
                  if(isSuccess)
                    {
                      Get.back(result: true);
                      Get.back(result: true);
                    }



                  },),),
                SizedBox(width: 10,),
                Expanded(child: ButtonnOutlined(title: 'Close',onPressed: (){Navigator.pop(context);},))
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }
}