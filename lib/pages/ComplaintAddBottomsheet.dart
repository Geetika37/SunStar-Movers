import 'package:flutter/material.dart';
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
                      value: 'RefNo', // Different value for the first Radio
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value!;
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
                TextField1(hintName: 'Ref No', labelText: 'Ref No')

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






