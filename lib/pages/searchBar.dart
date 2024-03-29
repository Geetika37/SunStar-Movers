import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBarr extends StatelessWidget {
  final String title;
  final String image;
  const SearchBarr({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        //constraints: BoxConstraints(maxWidth: 300),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),

        child: TextField(
          decoration: InputDecoration(
            hintText: title,
            hintStyle: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w400,fontSize: 14,color: Colors.grey.shade500
            ),
            prefixIcon: Icon(Icons.search_outlined),
            suffixIcon: ImageIcon(AssetImage(image),size: 30,),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          ),
        ),

      ),
    );

  }
}

