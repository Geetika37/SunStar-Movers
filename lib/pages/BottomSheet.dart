import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/TextField1.dart';

class BottomSheets extends StatelessWidget {
  const BottomSheets({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 680,
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Stack(
            children: [
          ListView(
            // shrinkWrap: true,
            children: [
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 20,
                      )),
                  Text(
                    'Filter',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextField1(hintName: 'Start Date', labelText: 'Start Date'),
              SizedBox(
                height: 10,
              ),
              TextField1(hintName: 'End Date', labelText: 'End Date'),
              SizedBox(
                height: 20,
              ),
              Text(
                'By Order Status',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container2(
                    title: 'Pending',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container2(
                    title: 'Cancelled',
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container2(title: 'Confirmed'),
                  SizedBox(
                    width: 10,
                  ),
                  Container2(title: 'StartWork')
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container2(title: 'Closed'),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'By Payment Status',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container2(title: 'Pending'),
                  SizedBox(
                    width: 10,
                  ),
                  Container2(title: 'Bank'),
                  SizedBox(
                    width: 10,
                  ),
                  Container2(title: 'Cash')
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'By Staff',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container2(title: 'Dinsha'),
                  SizedBox(
                    width: 10,
                  ),
                  Container2(title: 'Geetika'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container2(title: 'Thomas'),
                  SizedBox(
                    width: 10,
                  ),
                  Container2(title: 'Ajali test'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container2(title: 'Kavyasree test'),
                  SizedBox(
                    width: 10,
                  ),
                  Container2(title: 'Aneer test'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container2(title: 'Sreelakshmi'),
                  SizedBox(
                    width: 10,
                  ),
                  Container2(title: 'Vismaya'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container2(title: 'Sajesh'),
                  SizedBox(
                    width: 10,
                  ),
                  Container2(title: 'Aswin'),
                  SizedBox(
                    width: 10,
                  ),
                  Container2(title: 'Fayis'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container2(title: 'kavya'),
                  SizedBox(
                    width: 10,
                  ),
                  Container2(title: 'Athirani'),
                ],
              ),
            ],
          ),

          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              height: 60,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: ButtonnElevated(
                      buttonName: 'Save',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: ButtonnOutlined(
                          title: 'Clear',
                          onPressed: (){

                          },
                      ),
                  )
                ],
              ),
            ),
          ),

        ]),
      ),
    );
  }
}

class Container2 extends StatelessWidget {
  final String title;
  const Container2({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade400,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add),
          SizedBox(
            width: 4,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
