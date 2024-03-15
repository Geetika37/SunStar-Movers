import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/Account.dart';
import 'package:sunstarmovers/pages/Row3.dart';

class ProfileBottom extends StatelessWidget {
  const ProfileBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: ListView(
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text4(text: 'Profile Photo'),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete))
              ],
            ),

            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: Image.asset('assets/camera_svgrepo.com.png'),
                ),
                SizedBox(width: 20,),
                CircleAvatar(
                  radius: 25,
                  backgroundColor:Colors.white,
                  child: Image.asset('assets/gallery_svgrepo.com.png'),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
