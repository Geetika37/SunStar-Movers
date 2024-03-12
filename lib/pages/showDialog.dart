import 'package:flutter/material.dart';

class showDialog1 extends StatelessWidget {
  final Color? backGroundColor;
  const showDialog1({super.key,this.backGroundColor});

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

              height: 210,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 75, 10, 10),
                child: Column(
                  children: [

                    Text('Survey Added',
                      style: TextStyle(fontWeight:FontWeight.w600,fontSize: 20, fontFamily: 'Poppins'),
                    ),
                    SizedBox(height: 5,),
                    Text('The survey has been added successfully.',
                      style: TextStyle(fontSize: 12,fontFamily: 'Poppins' ,fontWeight: FontWeight.w400,color: Colors.grey.shade500),
                    ),
                    SizedBox(height: 15,),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                          onPressed: ()
                          {
                           Navigator.pop(context);
                          }, child: Text('Close',style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'Poppins',fontSize: 17),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: backGroundColor ?? Colors.green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      ),
                    )

                  ],
                ),
              ),
            ),

            Positioned(child: Image(image: AssetImage('assets/Group 427318220.png'),
            ),
            top: -80,
            ),

          ],
        ),
      ) ,
    );
  }
}
