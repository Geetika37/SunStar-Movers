import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/ProfileBottonsheet.dart';
import 'package:sunstarmovers/pages/TextField1.dart';
import 'package:sunstarmovers/pages/showDialog.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3.0,
        shadowColor: Colors.red,
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10))),
        backgroundColor: Colors.red,
        toolbarHeight: 80,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: ImageIcon(
              AssetImage('assets/chevron-left.png'),
              color: Colors.white,
            )),
        title: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "Profile Update",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: Colors.white),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            ListView(
                children: [
                  SizedBox(height: 30,),

                  Column(
                    children: [
                      InkWell(
                        onTap: ()=>showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context)
                            {
                              return ProfileBottom();
                            }
                        ),
                        child: Stack(
                            children:[
                              CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage('assets/ProfilePic.png'),
                              ),

                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Image.asset('assets/cameraicon.png')
                              )
                            ]

                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  TextField1(hintName: 'Name', labelText: 'Name'),
                  SizedBox(height: 20,),
                  TextField1(hintName: 'Email', labelText: 'Email'),
                  SizedBox(height: 20,),
                  TextField1(hintName: 'Phone', labelText: 'Phone')

                ]
            ),
            Positioned(
              bottom: 0,
                left: 0,
                right: 0,
                child: ButtonnElevated(buttonName: 'Update',onPressed: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context)
                      {
                        return showDialog1(title: 'Profile Updated', subtitle: 'The profile has been updated successfully', image: 'assets/Group 427318220.png', buttonText1: 'Close');
                      }
                  );
                },)
            )
          ]
        ),
      )



    );
  }
}
