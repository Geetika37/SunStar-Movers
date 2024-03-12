import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/showDialog.dart';

class ButtonnElevated extends StatelessWidget {
  final Function()? onPressed;
  final String buttonName;
  const ButtonnElevated({super.key, this.onPressed, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(buttonName,style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Poppins',fontSize: 17)),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor:Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) ),
    );
  }
}
