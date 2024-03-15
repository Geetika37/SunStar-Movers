import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/TextField1.dart';
import 'package:sunstarmovers/pages/showDialog.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

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
            "Change Password",
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
                      TextField1(hintName: 'Old Password', labelText: 'Old Password'),
                      SizedBox(height: 20,),
                      TextField1(hintName: 'New Password', labelText: 'New Password'),
                      SizedBox(height: 20,),
                      TextField1(hintName: 'Confirm Password', labelText: 'Confirm Password')
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
                              return showDialog1(title: 'Password Changed', subtitle: 'The password has been updated successfully', image: 'assets/Group 427318220.png', buttonText1: 'Close');
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
