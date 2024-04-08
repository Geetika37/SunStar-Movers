import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/surveyconfirm_api.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/Survey.dart';
import 'package:sunstarmovers/pages/TextField1.dart';
import 'package:sunstarmovers/responses/AllSurveyResponse.dart';

class SurveyClosed extends StatefulWidget {
  final AllSurveyResponse? allSurveyResponse;
  final num? boxTobeCollected;
  const SurveyClosed({super.key, this.boxTobeCollected, this.allSurveyResponse});

  @override
  State<SurveyClosed> createState() => _SurveyClosedState();
}

class _SurveyClosedState extends State<SurveyClosed> {
  TextEditingController _dateController=TextEditingController();
  DateTime? _picked;
  TextEditingController _pendingController=TextEditingController();
  TextEditingController _boxCollectedController= TextEditingController();

  @override
  void initState() {

    if(widget.allSurveyResponse!=null)
      {
        _pendingController.text='${widget.allSurveyResponse!.boxToBeCollected! - widget.allSurveyResponse!.boxCollected!}';
      }
    super.initState();
  }
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

                TextField1(hintName: 'Date', labelText: 'Date',image1: 'assets/Group 33192.png',
                controller:_dateController ,
                isKey: true,
                onTap: ()
                  {
                    _selectDate();
                  },
                ),
                SizedBox(height: 10,),
                TextField1(hintName: 'Pending Box', labelText: 'Pending Box',controller:_pendingController ,),
                SizedBox(height: 10,),
                TextField1(hintName: 'Box Collected', labelText: 'Box Collected',controller: _boxCollectedController,),
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
                  Expanded(child: ButtonnElevated(buttonName: 'Done',onPressed: ()async{

                    var data={
                      "surveyID": widget.allSurveyResponse!.surveyID!=null ? widget.allSurveyResponse?.surveyID:0,
                      "collectDateTime": _picked!.toIso8601String(),
                      "boxCollected": _boxCollectedController.text
                    };

                    var isSuccess=await SurveyConfirmApi().collectBox(data);
                    if(isSuccess)
                      {
                        Get.back(result: true);
                        Get.back(result: true);
                      }

                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>Survey()));
                    },)),
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

