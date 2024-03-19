import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';

class showDialog2 extends StatelessWidget {
  final String title;
  final String subtitle;
  final String button1;
  final String button2;
  const showDialog2({super.key, required this.title, required this.subtitle, required this.button1, required this.button2});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        width: 300,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 220,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 75, 10, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(title,
                        style: TextStyle(fontWeight:FontWeight.w600,fontSize: 20, fontFamily: 'Poppins'),
                      ),
                      SizedBox(height: 5,),
                      Text(subtitle,
                        style: TextStyle(fontSize: 12,fontFamily: 'Poppins' ,fontWeight: FontWeight.w400,color: Colors.grey.shade500),
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Expanded(child: ButtonnElevated(buttonName: button1,onPressed: (){},)),
                          SizedBox(width: 10,),
                          Expanded(child: ButtonnOutlined(title: button2,onPressed: (){Navigator.pop(context);},))
                        ],
                      )
                    ],
                  ),
              ),
            ),
            Positioned(
                child: Image(
                    image: AssetImage('assets/close.png')
                ),
              top: -70,
            )
          ],
        ),
      ),
    );
  }
}
