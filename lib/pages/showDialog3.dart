import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';

class showDialog3 extends StatefulWidget {
  final String title1;
  final String subtitle1;
  final String button11;
  final Function()? onPressedd;
  const showDialog3({super.key, required this.title1, required this.subtitle1, required this.button11, this.onPressedd, });

  @override
  State<showDialog3> createState() => _showDialog3State();
}

class _showDialog3State extends State<showDialog3> {
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
                    Text(widget.title1,
                      style: TextStyle(fontWeight:FontWeight.w600,fontSize: 20, fontFamily: 'Poppins'),
                    ),
                    SizedBox(height: 5,),
                    Text(widget.button11,
                      style: TextStyle(fontSize: 12,fontFamily: 'Poppins' ,fontWeight: FontWeight.w400,color: Colors.grey.shade500),
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Expanded(child: ButtonnElevated(buttonName: widget.button11,onPressed: widget.onPressedd,)),
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
