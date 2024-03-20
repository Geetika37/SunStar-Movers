import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sunstarmovers/pages/SurveyDetails.dart';
// import 'package:percent_indicator/percent_indicator.dart';

class Row2 extends StatelessWidget {
  final String name;
  final String date;
  final String time;
  final String image2;
  final String image3;
  final String percentage;
  final Color color1;
  final Color color2;
  final String status;
  final Color bgcolor;
  final Color? fgcolor;
  final Color textColor;


  const Row2({super.key, required this.name, required this.date, required this.time, required this.image2, required this.image3, required this.percentage, required this.color1, required this.color2, required this.status, required this.bgcolor, this.fgcolor, required this.textColor, });

  @override
  Widget build(BuildContext context) {
    double progress = double.tryParse(percentage.replaceAll('%', '')) ?? 0.0;
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SurveyDetails(
          status: status,
        )));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(name,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,fontFamily: 'Poppins'),),
                  SizedBox(width: 15,),
                  Container(
                    decoration: BoxDecoration(
                      color: color1,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          Text(status,style: TextStyle(fontSize: 13,color: color2,fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Image(image: AssetImage(image2)),
                  SizedBox(width: 5,),
                  Text(DateFormat('dd/MM/yyyy').format(DateTime.parse(date)),style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,fontFamily: 'Poppins',color: Colors.grey.shade500),),
                  SizedBox(width: 20,),
                  Image(image: AssetImage(image3)),
                  SizedBox(width: 5,),
                  Text(time,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,fontFamily: 'Poppins',color: Colors.grey.shade500),)
                ],
              ),

            ],
          ),

          Stack(
              alignment: Alignment.center,
              children:[
                CircularProgressIndicator(
                  color: bgcolor ,
                  backgroundColor: fgcolor,
                  value:  progress / 100,
                  strokeWidth: 5,
                  strokeAlign: 2,
                  semanticsLabel: '50%',
                  strokeCap: StrokeCap.round,
                ),
                Text(percentage,style: TextStyle(color: textColor,fontWeight: FontWeight.bold),)
              ]
          ),

        ],
      ),
    );
  }
}
