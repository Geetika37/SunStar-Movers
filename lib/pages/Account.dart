import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/profile_Api.dart';
import 'package:sunstarmovers/controller/appController.dart';
import 'package:sunstarmovers/pages/BottomNav.dart';
import 'package:sunstarmovers/pages/Notifications.dart';
import 'package:sunstarmovers/pages/Profile.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/changePassword.dart';
import 'package:sunstarmovers/pages/loginPage.dart';
import 'package:sunstarmovers/responses/ProfileDetailsResponse.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
AppController appCt = Get.find();
  bool screenLoad = true;

  @override
  void initState() {
     getProfile();
    super.initState();
  }

  getProfile()
  {
    appCt.getProfile();
    setState(() {
      screenLoad = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
        title: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "Account",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: Colors.white),
          ),
        ),
      ),


      body: screenLoad? Center(child: CircularProgressIndicator()): GetBuilder<AppController>(
        builder: (ct) {
          return ListView(
            children: [
              SizedBox(height: 40,),
              Column(
                children: [
                  CircleAvatar(
                        radius: (30),
                    backgroundImage: AssetImage('assets/ProfilePic.png'),
                  ),
                ],
              ),


              SizedBox(height: 10,),
              Align(
                alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text1(name1: '${ct.profileDetailResponse?.firstName} ${ct.profileDetailResponse?.middleName} ${ct.profileDetailResponse?.lastName}'),
                      Text('${ct.profileDetailResponse?.phone}',style: TextStyle(fontSize: 16),)
                    ],
                  )
              ),
              SizedBox(height: 40,),

              AccountRow(onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile())), image: 'assets/fi-rr-user.png', text: 'Profile'),
              SizedBox(height: 20,),
              AccountRow(onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Notifications())), image: 'assets/notification.png', text: 'Notifications'),
              SizedBox(height: 20,),
              AccountRow(onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePassword())), image: 'assets/fi-rr-settings.png', text: 'Change Password'),
              SizedBox(height: 20,),
              AccountRow(onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage())), image: 'assets/fi-rr-sign-out.png', text: 'Logout'),
              SizedBox(height: 30,),
              Align(
                alignment: Alignment.center,
                child:Text('Delete Account',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500,fontFamily: 'Poppins',fontSize: 16),) ,
              )

            ],
          );
        }
      ),
      // bottomNavigationBar: BottomNav(),
    );
  }
}

class Text4 extends StatelessWidget {
  final String text;
  const Text4({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize: 17,fontFamily: 'Poppins',fontWeight: FontWeight.w500),);
  }
}

class AccountRow extends StatelessWidget {
  final Function() onTap;
  final String image;
  final String text;
  const AccountRow({super.key, required this.onTap, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 20,),
              CircleAvatar(
                radius: 25,
                backgroundColor: Color(0xfffFDE4E5),
                child: Image.asset(image),
              ),
              SizedBox(width: 30,),
              Text4(text:text ,),
              // Icon(Icons.arrow_forward_ios_outlined,size: 15,)
            ],
          ),

        ],
      ),
    );
  }
}
