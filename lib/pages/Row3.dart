import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/MarketingDetails.dart';

class Row3 extends StatelessWidget {
  final String name1;
  final String name2;
  final String name3;
  final String image1;
  final String image2;
  final String image3;

  const Row3({super.key, required this.name1, required this.name2, required this.name3, required this.image1, required this.image2, required this.image3});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MarketingDetails()));
      },
      child: Row(
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
                  Text2(name2: name2),
                  SizedBox(width: 20,),
                  Image(image: AssetImage(image2)),
                  SizedBox(width: 5,),
                  Text2(name2: name3,)
                ],
              ),

            ],
          ),
          SizedBox(width: 65,),

          Column(
            children: [
              Image.asset(image3)
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
