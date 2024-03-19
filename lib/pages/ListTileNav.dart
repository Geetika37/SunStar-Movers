import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final String image;
  final String label;
  final Function()? onTap;
  const DrawerWidget({super.key,required this.image,required this.label,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(label,style: TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight: FontWeight.w500,color: Colors.grey.shade700),),
      leading: ImageIcon(AssetImage(image)),
    );
  }
}