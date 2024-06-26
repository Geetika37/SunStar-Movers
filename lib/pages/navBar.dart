import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/survey_api.dart';
import 'package:sunstarmovers/controller/appController.dart';
import 'package:sunstarmovers/pages/Complaint.dart';
import 'package:sunstarmovers/pages/ListTileNav.dart';
import 'package:sunstarmovers/pages/Marketing.dart';
import 'package:sunstarmovers/pages/SettingActivity.dart';
import 'package:sunstarmovers/pages/SettingEmirate.dart';
import 'package:sunstarmovers/pages/SettingsBuilding.dart';
import 'package:sunstarmovers/pages/SettingsLeadSource.dart';
import 'package:sunstarmovers/pages/SettingsMoving.dart';
import 'package:sunstarmovers/pages/SettingsTeamLead.dart';
import 'package:sunstarmovers/pages/Survey.dart';
import 'package:sunstarmovers/pages/loginPage.dart';

class navBar extends StatefulWidget {

  const navBar({super.key});

  @override
  State<navBar> createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  AppController appCt=Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image(image: AssetImage("assets/logo.png")),
                SizedBox(
                  height: 70,
                ),

                ExpansionTile(
                  title: Text('Survey',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700)),
                  leading: ImageIcon(AssetImage('assets/file-02.png')),
                  children: [
                    DrawerWidget(
                      onTap: () async{
                        Get.to(()=>Survey(Id: 2,));
                      },
                      label: "Pending Survey",
                      image: 'assets/pendingsurvey.png',
                    ),
                    DrawerWidget(
                      onTap: () {
                        Get.to(()=>Survey(Id: 3,));
                      },
                      label: 'Confirmed Survey ',
                      image: 'assets/confirmedsurvey.png',
                    ),
                    DrawerWidget(
                      onTap: () {
                        Get.to(()=>Survey(Id: 4,));
                      },
                      label: 'Cancelled Survey',
                      image: 'assets/cancelledsurvey.png',
                    ),
                    DrawerWidget(
                      onTap: () {
                        Get.to(()=>Survey(Id: 5,));
                      },
                      label: 'Start Work',
                      image: 'assets/Startworkk.png',
                    ),
                    DrawerWidget(
                      onTap: () {
                        Get.to(()=>Survey(Id: 6,));
                      },
                      label: 'Collection Pending',
                      image: 'assets/collectonpending.png',
                    ),
                    DrawerWidget(
                      onTap: () {
                        Get.to(()=>Survey(Id: 7,));
                      },
                      label: 'Closed Work',
                      image: 'assets/closedwork.png',
                    ),
                  ],
                ),

                //  Marketing
                DrawerWidget(
                    image: 'assets/marketing.png',
                    label: 'Marketing',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Marketing()));
                    }),

                // Complaints
                ExpansionTile(
                  title: Text('Complaints',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700)),
                  leading: ImageIcon(AssetImage('assets/Complaints.png')),
                  children: [
                    DrawerWidget(
                        image: 'assets/Complaints.png',
                        label: 'Complaints',
                        onTap: () {
                          Get.to(()=>Complaint(Id: 1,));
                        }),
                    DrawerWidget(
                        image: 'assets/pendingsurvey.png',
                        label: 'Pending Complaints',
                        onTap: () {
                          Get.to(()=>Complaint(Id: 2,));
                        }),
                    DrawerWidget(
                        image: 'assets/closedwork.png',
                        label: 'Closed Complaints',
                        onTap: () {
                          Get.to(()=>Complaint(Id: 3,));
                        })
                  ],
                ),

                ExpansionTile(
                    title:Text('Basic Settings',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700)),
                    leading: ImageIcon(AssetImage('assets/settings-01.png')),
                  children: [
                    DrawerWidget(
                        image: 'assets/building-06.png',
                        label: 'Building Type',
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsBuilding()));
                        }
                    ),
                    DrawerWidget(
                        image: 'assets/truck-02.png',
                        label: 'Moving Type',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsMoving()));
                        }
                    ),
                    DrawerWidget(
                        image: 'assets/Global search.png',
                        label: 'Lead Source',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingLeadSource()));
                        }
                    ),
                    DrawerWidget(
                        image: 'assets/teamlead.png',
                        label: 'Team Lead',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingTeamLead()));
                        }
                    ),
                    DrawerWidget(
                        image: 'assets/Emirates.png',
                        label: 'Emirates',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingEmirate()));
                        }
                    ),
                    DrawerWidget(
                        image: 'assets/activity.png',
                        label: 'Acitivity',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingActivity()));
                        }
                    )
                  ],
                ),

                DrawerWidget(
                    image: 'assets/logout.png',
                    label: 'Logout',
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                    }
                )



              ],
            ),
          ),
        ),
      ),
    );
  }
}
