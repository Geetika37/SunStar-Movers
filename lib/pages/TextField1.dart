import 'package:flutter/material.dart';

class TextField1 extends StatelessWidget {
  final String hintName;
  final String labelText;
  final String? image1;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isKey;
  final Function()? onTap;
  final double? right;
  final double? left;
  final double? top;
  final double? bottom;
  final TextInputType? keyBoardType;


  const TextField1({super.key, required this.hintName, required this.labelText, this.image1, this.controller, this.validator, this.isKey = false, this.onTap, this.right =9, this.left =9, this.top = 9, this.bottom = 9, this.keyBoardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      onTap: onTap,
      validator: validator,
      readOnly: isKey,
      controller: controller,
      keyboardType: keyBoardType,
      decoration: InputDecoration(
          isDense: true,
          //contentPadding: EdgeInsets.all(),


          hintText: hintName,
          hintStyle: TextStyle(fontFamily: 'Poppins',fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey.withOpacity(.5)),

          labelText: labelText,
          labelStyle: TextStyle(fontFamily: 'Poppins',fontSize: 13,fontWeight: FontWeight.w500,),

          suffixIcon: image1==null?SizedBox():IconButton(
              onPressed: (){},
              icon: ImageIcon(AssetImage(image1!),)
          ),

          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey,),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(top!), topRight: Radius.circular(bottom!), bottomRight: Radius.circular(left!), bottomLeft: Radius.circular(right!),
              ),

          ),

      ),
    );
  }
}
