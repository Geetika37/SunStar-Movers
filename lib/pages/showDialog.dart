import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';

class showDialog1 extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final String buttonText1;

  const showDialog1({super.key, required this.title, required this.subtitle, required this.image, required this.buttonText1, });

  @override
  Widget build(BuildContext context) {
    return  Dialog(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      // clipBehavior: Clip.none,
      child:SizedBox(
        width: 300,
        child: Stack(
          //overflow:Overflow.visible,
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [

            Container(

              height: 220,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 75, 10, 10),
                child: Column(

                  children: [

                    Text(title,
                      style: TextStyle(fontWeight:FontWeight.w600,fontSize: 20, fontFamily: 'Poppins'),
                    ),
                    SizedBox(height: 5,),
                    Text(subtitle,
                      style: TextStyle(fontSize: 12,fontFamily: 'Poppins' ,fontWeight: FontWeight.w400,color: Colors.grey.shade500),
                    ),
                    SizedBox(height: 15,),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                          onPressed: ()
                          {
                           Navigator.pop(context);
                          }, child: Text(buttonText1,style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'Poppins',fontSize: 17),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor:  Colors.green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            Positioned(child: Image(image: AssetImage(image),
            ),
            top: -80,
            ),

          ],
        ),
      ) ,
    );
  }
}
