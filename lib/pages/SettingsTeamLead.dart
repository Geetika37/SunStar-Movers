import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/basicSettings_api.dart';
import 'package:sunstarmovers/pages/SettingBuildingSheet.dart';
import 'package:sunstarmovers/pages/SettingTeamLeadsheet.dart';
import 'package:sunstarmovers/pages/SettingsBuilding.dart';
import 'package:sunstarmovers/pages/searchBar.dart';
import 'package:sunstarmovers/pages/showDialog2.dart';
import 'package:sunstarmovers/responses/TeamLeaderSettingsResponse.dart';

class SettingTeamLead extends StatefulWidget {
  const SettingTeamLead({super.key});

  @override
  State<SettingTeamLead> createState() => _SettingTeamLeadState();
}

class _SettingTeamLeadState extends State<SettingTeamLead> {
  TeamLeaderSettingsResponse? teamLeaderSettingsResponse;
  bool screenLoad=true;

  @override
  void initState() {
    getTeamLeadDetails();
    super.initState();
  }

  @override

  getTeamLeadDetails()async
  {
    teamLeaderSettingsResponse=await BasicSettingApi().teamLeaderSettingsResponse();
    setState(() {
      screenLoad=false;
    });
  }

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
            "Team Lead",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context)
                    {
                      return SettingTeamLeadSheet();
                    }
                ).then((value)async
                {
                  if(value==true)
                  {
                    setState(() {
                      screenLoad=true;
                    });
                    await getTeamLeadDetails();
                  }
                }
                );
              },
              icon: ImageIcon(
                AssetImage(
                  'assets/plus-circle.png',
                ),
                size: 30,
                color: Colors.white,
              )
          ),
        ],
      ),


      body: screenLoad?  Center(
          child: CircularProgressIndicator(
            color: Colors.red,
          )):Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child:SearchBarr(title: 'Search for team leader', image: 'assets/3864_boolean_operation.png',),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: [

                    Row(
                      children: [
                        Text("Team Lead",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,fontFamily: 'Poppins'),),
                      ],
                    ),

                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: teamLeaderSettingsResponse!.data!.length,
                        itemBuilder: (context,index)
                            {
                              return Column(
                                children: [
                                  Rows1(text1: teamLeaderSettingsResponse!.data![index].teamLeaderName!,
                                    onTap: (){
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context)
                                        {
                                          return SettingTeamLeadSheet(teamLeadID: teamLeaderSettingsResponse!.data![index].teamLeaderID,teamLeadName: teamLeaderSettingsResponse!.data![index].teamLeaderName,);
                                        }
                                    ).then((value)async
                                    {
                                      if(value==true)
                                        {
                                          setState(() {
                                            screenLoad=true;
                                          });
                                          await getTeamLeadDetails();
                                        }
                                    }
                                    );
                                  },

                                     onTap1: (){
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context)
                                        {
                                          return showDialog2(
                                              title: 'Confirm',
                                              subtitle: 'Are you sure you want to delete Team lead.?',
                                              button1: 'Yes',
                                              button2: 'Cancel',
                                            onPressed: ()async
                                            {
                                              var isSuceess=await BasicSettingApi().deleteTeamLead(teamLeaderSettingsResponse!.data![index].teamLeaderID);
                                              Get.back(result: true);
                                              await getTeamLeadDetails();
                                            },
                                          );

                                          ;
                                        }

                                    );
                                     },

                                  ),
                                  new Divider(color: Colors.grey.shade300,),
                                ],
                              );
                            }
                    ),



                  ],
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
