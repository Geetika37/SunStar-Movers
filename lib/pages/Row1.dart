import 'package:flutter/cupertino.dart';

class Row1 extends StatelessWidget {
  final String image;
  final String title1;
  final String title2;
  final String? title3;
  final String? image1;
  const Row1({super.key, required this.image, required this.title1, required this.title2, this.title3,this.image1});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Column(
          children: [
            Row(
              children: [
                Image(image: AssetImage(image)),
                Text(title1,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,fontFamily: 'Poppins'),),
                image1==null? SizedBox():Image(image: AssetImage(image1!)),
                Text(title3??'',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,fontFamily: 'Poppins'),),
              ],
            ),
            Text(title2,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,fontFamily: 'Poppins'),),
          ],
        ),

      ],
    );
  }
}
