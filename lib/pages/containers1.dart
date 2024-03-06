import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String title,title2,title3,image;
  const HomeCard({super.key,required this.title, required this.title2, required this.title3, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3)
            )
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,fontFamily: 'Poppins'),),
              SizedBox(height: 10,),
              Text(title3,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,fontFamily: 'Poppins'),),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title2,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,fontFamily: 'Poppins',color: Colors.green),),
              SizedBox(height: 10,),
              Image(image: AssetImage(image))
            ],
          ),
        ],
      ),
    );
  }
}
