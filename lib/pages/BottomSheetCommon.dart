import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/TextField1.dart';

class BottomShet1 extends StatelessWidget {
  final String title;
  final String hintName;
  final String labelName;
  final String buttonName1;
  final String buttonName2;

  const BottomShet1(
      {super.key,
      required this.title,
      required this.hintName,
      required this.labelName, required this.buttonName1, required this.buttonName2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Stack(children: [
          ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                    hintText: hintName,
                    hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.withOpacity(.5)),
                    labelText: labelName,
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(9))),
              ),

            ],
          ),
          Positioned(
            left: 0,
              right: 0,
              bottom: 0,
              child: Row(
            children: [
              Expanded(
                  child: ButtonnElevated(
                buttonName: buttonName1,
                onPressed: () {

                },
              )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: ButtonnOutlined(
                title: buttonName2,
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
            ],
          ))
        ]),
      ),
    );
  }
}
