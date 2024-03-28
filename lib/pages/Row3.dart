import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sunstarmovers/pages/MarketingDetails.dart';

class Row3 extends StatelessWidget {
  final int? MarketingId;
  final String name1;
  final String date;
  final String time;
  final String image1;
  final String image2;
  final String image3;
  final Function()? onTap;
  final Color color1;
  final Color color2;
  final String status;


  const Row3({super.key, required this.name1,  required this.image1, required this.image2, required this.image3, this.onTap, required this.color1, required this.color2, required this.status, required this.date, required this.time, this.MarketingId});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text1(name1: name1),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Image(image: AssetImage(image1)),
                  SizedBox(width: 5,),
                  Text(
                    DateFormat('dd-MM-yyyy').format(DateTime.parse(date)) ,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      color: Colors.grey.shade500,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Image(image: AssetImage(image2)),
                  SizedBox(width: 5,),
                  Text2(name2: time,)
                ],
              ),

            ],
          ),
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color:color1 ,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(status,style: TextStyle(fontSize: 13,color: color2,fontWeight: FontWeight.w500),)
                    ],
                  ),
                ),
              )
            ],
          ),


        ],
      ),
    );
  }
}


class Text1 extends StatelessWidget {
  final String name1;
  const Text1({super.key, required this.name1, });
  @override
  Widget build(BuildContext context) {
    return Text(name1,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,fontFamily: 'Poppins'),);
  }
}

class Text2 extends StatelessWidget {
  final String name2;
  const Text2({super.key,required this.name2});
  @override
  Widget build(BuildContext context) {
    return Text(name2,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,fontFamily: 'Poppins',color: Colors.grey.shade500),);
  }
}

class Text3 extends StatelessWidget {
  final String name3;
  const Text3({super.key, required this.name3});

  @override
  Widget build(BuildContext context) {
    return Text(name3,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,fontFamily: 'Poppins'),);
  }
}
