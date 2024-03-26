import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/profile_Api.dart';
import 'package:sunstarmovers/controller/appController.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/ProfileBottonsheet.dart';
import 'package:sunstarmovers/pages/TextField1.dart';
import 'package:sunstarmovers/pages/showDialog.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  TextEditingController firstNameCt=TextEditingController();
  TextEditingController middleNameCt=TextEditingController();
  TextEditingController lastNameCt=TextEditingController();
  TextEditingController phoneNumCt=TextEditingController();
  TextEditingController emailAddressCt=TextEditingController();


  AppController appCt=Get.find();
  @override

  void initState() {
    firstNameCt.text=appCt.profileDetailResponse?.firstName ?? "";
    middleNameCt.text=appCt.profileDetailResponse?.middleName ?? "";
    lastNameCt.text=appCt.profileDetailResponse?.lastName ?? "";
    phoneNumCt.text=appCt.profileDetailResponse?.phone ?? "";
    emailAddressCt.text=appCt.profileDetailResponse?.emailAddress ?? "";
    super.initState();
  }

  final _formKey=GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    final isKeyboard=MediaQuery.of(context).viewInsets.bottom!=0;
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
            Form(
              key:_formKey ,
              child: ListView(
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
                    TextField1(hintName: 'First Name', labelText: 'First Name',controller: firstNameCt,
                      validator:(value)
                      {
                        if(value!.isEmpty)
                          {
                            return 'Please Enter FirstName';
                          }
                        return null;
                      },
                    ),
                    SizedBox(height: 20,),
                    TextField1(hintName: 'Middle Name', labelText: 'Middle Name',controller: middleNameCt,
                      validator:(value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'Please Enter MiddleName';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20,),
                    TextField1(hintName: 'Last Name', labelText: 'Last Name',controller: lastNameCt,
                      validator:(value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'Please Enter LastName';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20,),
                    TextField1(hintName: 'Email', labelText: 'Email',controller: emailAddressCt,
                      validator:(value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'Please Enter EmailAddress';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20,),
                    TextField1(hintName: 'Phone', labelText: 'Phone',controller: phoneNumCt,
                      validator:(value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'Please Enter PhoneNumber';
                        }
                        return null;
                      },
                    )
              
                  ]
              ),
            ),
            if(isKeyboard!=true)
            Positioned(
              bottom: 0,
                left: 0,
                right: 0,
                child: ButtonnElevated(buttonName: 'Update',onPressed: ()async{
                  if(_formKey.currentState!.validate())
                    {
                      var isSuccess=await ProfileApi().updateProfile(firstNameCt.text, middleNameCt.text, lastNameCt.text, phoneNumCt.text, emailAddressCt.text);
                      if(isSuccess)
                      {
                        appCt.getProfile();
                        showDialog(
                            context: context,
                            builder: (BuildContext context)
                            {
                              return showDialog1(onTap:(){

                                Get.back();
                                Get.back();

                              },title: 'Profile Updated', subtitle: 'The profile has been updated successfully', image: 'assets/Group 427318220.png', buttonText1: 'Close');
                            }
                        );
                      }
                    }
                },
                )
            )
          ]
        ),
      )



    );
  }
}
