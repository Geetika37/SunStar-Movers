import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/SurveyDetails.dart';
// import 'package:percent_indicator/percent_indicator.dart';

class Row2 extends StatelessWidget {
  final String name;
  final String image1;
  final String date;
  final String time;
  final String image2;
  final String image3;
  final String percentage;


  const Row2({super.key, required this.name, required this.image1, required this.date, required this.time, required this.image2, required this.image3, required this.percentage, });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SurveyDetails()));
      },
      child: Row(
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(name,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,fontFamily: 'Poppins'),),
                  SizedBox(width: 15,),
                  Image(image: AssetImage(image1)),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Image(image: AssetImage(image2)),
                  SizedBox(width: 5,),
                  Text(date,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,fontFamily: 'Poppins',color: Colors.grey.shade500),),
                  SizedBox(width: 20,),
                  Image(image: AssetImage(image3)),
                  SizedBox(width: 5,),
                  Text(time,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,fontFamily: 'Poppins',color: Colors.grey.shade500),)
                ],
              ),

            ],
          ),
          SizedBox(width: 75,),

          Column(
            children: [
              Stack(
                  alignment: Alignment.center,
                  children:[
                    CircularProgressIndicator(
                      color: Colors.yellow.shade800,
                      backgroundColor: Colors.yellow.withOpacity(0.1),
                      value: 0.5,
                      strokeWidth: 6,
                      strokeAlign: 2,
                      semanticsLabel: '50%',
                      strokeCap: StrokeCap.round,
                    ),
                    Text(percentage,style: TextStyle(color: Colors.yellow.shade800,fontWeight: FontWeight.bold),)
                  ]
              )
            ],
          ),

        ],
      ),
    );
  }
}
