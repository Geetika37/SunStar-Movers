import 'package:flutter/material.dart';

class TextField1 extends StatelessWidget {
  final String hintName;
  final String labelText;
  final String? image1;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const TextField1({super.key, required this.hintName, required this.labelText, this.image1, this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator: validator,

      controller: controller,
      decoration: InputDecoration(
          isDense: true,
          //contentPadding: EdgeInsets.all(),

          hintText: hintName,
          hintStyle: TextStyle(fontFamily: 'Poppins',fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey.withOpacity(.5)),

          labelText: labelText,
          labelStyle: TextStyle(fontFamily: 'Poppins',fontSize: 14,fontWeight: FontWeight.w500,),

          suffixIcon: image1==null?SizedBox():IconButton(
              onPressed: (){},
              icon: ImageIcon(AssetImage(image1!),)
          ),

          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey,),
              borderRadius: BorderRadius.circular(9)
          ),

      ),
    );
  }
}
