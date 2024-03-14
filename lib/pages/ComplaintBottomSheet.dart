import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/BottomSheet.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/TextField1.dart';

class ComplaintBottomSheet extends StatelessWidget {
  const ComplaintBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Stack(
          children:[
            ListView(
              children: [
                SizedBox(height: 5,),
                Row(
                  children: [
                    IconButton(
                        onPressed: (){Navigator.pop(context);},
                        icon: Icon(Icons.arrow_back_ios_new_outlined,size: 20,)
                    ),
                    Text('Filter',style: TextStyle(fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w400,),),
                  ],
                ),

                SizedBox(height: 10,),
                TextField1(hintName: 'Start Date', labelText: 'Start Date'),
                SizedBox(height: 10,),
                TextField1(hintName: 'End Date', labelText: 'End Date'),
                SizedBox(height: 20,),


                Text('By Complaint status',style: TextStyle(fontSize: 15, fontFamily: 'Poppins', fontWeight: FontWeight.w500,),),
                SizedBox(height: 10,),

                Row(
                  children: [
                    Container2(title: 'Pending'),
                    SizedBox(width: 5,),
                    Container2(title: 'Closed'),
                  ],
                )

              ],
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 60,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(child: ButtonnElevated(buttonName: 'Save',onPressed: (){Navigator.pop(context);},)),
                      SizedBox(width: 5,),
                      Expanded(child: ButtonnOutlined(title: 'Clear',onPressed: (){Navigator.pop(context);},))
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
