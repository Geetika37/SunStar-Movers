import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/complaint_Api.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/Complaint.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/SurveyPendingConfirm.dart';
import 'package:sunstarmovers/pages/TextField1.dart';

class ComplaintClose extends StatefulWidget {
  final int? complaintID;
  const ComplaintClose({super.key, this.complaintID});

  @override
  State<ComplaintClose> createState() => _ComplaintCloseState();
}

class _ComplaintCloseState extends State<ComplaintClose> {
  DateTime? _picked2;
  TextEditingController _dataController=TextEditingController();
  TextEditingController _reasonController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children:[
            ListView(
              children: [
                SizedBox(height: 15,),
                Text3(name3: 'Close Complaint'),
                TextField1(
                  hintName: 'Date',
                  labelText: 'Date',
                  image1: 'assets/Group 33192.png',
                  controller: _dataController,
                  isKey: true,
                  onTap: ()
                  {
                    _selectDate2();
                  },
                ),
                SizedBox(height: 10,),
                Textformfield(hintName: 'Reason', labelText: 'Reason',controller: _reasonController,),
              ],
            ),
            Positioned(
              left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  child: Row(
                    children: [
                      Expanded(child: ButtonnElevated(
                        buttonName: 'Done',
                        onPressed: ()async{
                          var data={
                              "complaintID": widget.complaintID,
                              "complaintDetails": "",
                              "complaintStatus": 0,
                              "complaintDate": "2024-04-08T07:10:21.400Z",
                              "complaintCloseDate": _picked2!.toIso8601String(),
                              "complaintCloseDetails": _reasonController.text,
                              "addedBy": 0
                          };
                          var isSuccess=await ComplaintApi().CloseComplaint(data);
                          if(isSuccess)
                            {
                              Get.back(result: true);
                              Get.back(result: true);
                            }
                        },
                      )
                      ),
                      SizedBox(width: 10,),
                      Expanded(child: ButtonnOutlined(title: 'Close',onPressed: (){Navigator.pop(context);},))
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate2() async {
    _picked2 = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (_picked2 != null) {
      setState(() {
        _dataController.text = _picked2.toString().split(" ")[0];
      });
    }
  }


}
