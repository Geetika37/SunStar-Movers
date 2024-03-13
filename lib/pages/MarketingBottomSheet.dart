import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/BottomSheet.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/TextField1.dart';

class MarketingBottomSheet extends StatelessWidget {
  const MarketingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 650,
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

                Text('By Activity',style: TextStyle(fontSize: 15, fontFamily: 'Poppins', fontWeight: FontWeight.w500,),),
                SizedBox(height: 10,),

                Row(
                  children: [
                    Container2(title: 'Visit'),
                    SizedBox(width: 5,),
                    Container2(title: 'Meeting'),
                    SizedBox(width: 5,),
                    Container2(title: 'Marketing'),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Container2(title: 'OfficeWork'),
                  ],
                ),
                SizedBox(height: 20,),

                Text('By Staff',style: TextStyle(fontSize: 15, fontFamily: 'Poppins', fontWeight: FontWeight.w500,),),
                SizedBox(height: 10,),

                Row(
                  children: [
                    Container2(title: 'Dinsha'),
                    SizedBox(width: 10,),
                    Container2(title: 'Geetika'),
                  ],
                ),
                SizedBox(height: 10,),

                Row(
                  children: [
                    Container2(title: 'Thomas'),
                    SizedBox(width: 10,),
                    Container2(title: 'Ajali test'),
                  ],
                ),
                SizedBox(height: 10,),

                Row(
                  children: [
                    Container2(title: 'Kavyasree test'),
                    SizedBox(width: 10,),
                    Container2(title: 'Aneer test'),
                  ],
                ),
                SizedBox(height: 10,),

                Row(
                  children: [
                    Container2(title: 'Sajesh'),
                    SizedBox(width: 10,),
                    Container2(title: 'Aswin'),
                    SizedBox(width: 10,),
                    Container2(title: 'Fayis'),
                  ],
                ),
                SizedBox(height: 10,),

                Row(
                  children: [
                    Container2(title: 'Sreelakshmi'),
                    SizedBox(width: 10,),
                    Container2(title: 'Vismaya'),
                  ],
                ),
                SizedBox(height: 10,),

                Row(
                  children: [
                    Container2(title: 'kavya'),
                    SizedBox(width: 10,),
                    Container2(title: 'Athirani'),
                  ],
                ),

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
            )
          ] ,
        ),
      ),
    );
  }
}
