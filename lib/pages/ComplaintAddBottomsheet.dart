import 'package:flutter/material.dart';
import 'package:sunstarmovers/Apis/complaint_Api.dart';
import 'package:sunstarmovers/pages/Account.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/TextField1.dart';

class ComplaintAddBottomSheet extends StatefulWidget {
  const ComplaintAddBottomSheet({super.key});

  @override
  State<ComplaintAddBottomSheet> createState() => _ComplaintAddBottomSheetState();
}

class _ComplaintAddBottomSheetState extends State<ComplaintAddBottomSheet> {
  String groupValue='Yes';
  TextEditingController _refController=TextEditingController();
  TextEditingController _phoneNumController=TextEditingController();
  @override


  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Stack(
          children:[
            ListView(
              children: [
                SizedBox(height: 15,),
                Text3(name3: 'Add Complaint'),
                Row(
                  children: [
                    Radio(
                      value: '1', // Different value for the first Radio
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value!;
                          print(groupValue);
                        });
                      },
                      activeColor: Colors.red,
                    ),
                    const Text4(text: 'Ref No'),
                    SizedBox(width: 10,),
                    Radio(
                      value: 'CustomerPhone', // Different value for the second Radio
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value!;
                        });
                      },
                      activeColor: Colors.red,
                    ),
                    const Text4(text:'Customer Phone'),
                    SizedBox(height: 20,),
                  ],
                ),
                groupValue=='1'? TextField1(
                    hintName: 'Ref No',
                    labelText: 'Ref No',
                    controller: _refController,

                ):
                Row(
                  children: [
                    SizedBox(
                      width: 95,
                        child: TextField1
                          (
                            hintName: 'ISD',
                            labelText: 'ISD',
                          keyBoardType:TextInputType.number ,
                          bottom: 0,
                          left: 0,
                        )
                    ),
                    Expanded(child: TextField1(hintName: 'Phone Number', labelText: 'Phone Number',top: 0,right: 0,controller: _phoneNumController,))
                  ],
                )

              ],
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  child: Row(
                    children: [
                      Expanded(child: ButtonnElevated(buttonName: 'Done',
                        onPressed: ()async{
                        if(groupValue=='1')
                          {
                            var isSuccess=await ComplaintApi().validSurveyNumber(_refController.text);
                            print(isSuccess);
                          }
                        else
                          {
                            var isSuccess=await ComplaintApi().validPhoneNumber(_phoneNumController.text);
                          }
                      },
                      )),
                      SizedBox(width: 10,),
                      Expanded(child: ButtonnOutlined(title: 'Close',onPressed: (){Navigator.pop(context);},))
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






