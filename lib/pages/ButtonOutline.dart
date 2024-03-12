import 'package:flutter/material.dart';

class ButtonnOutlined extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  const ButtonnOutlined({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed ,
      child: Text(title,style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Poppins',fontSize: 17)),
      style: ElevatedButton.styleFrom(
          foregroundColor:Colors.red,
          side:BorderSide(color: Colors.red,width: 1) ,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)
          )
      ),
    );
  }
}
