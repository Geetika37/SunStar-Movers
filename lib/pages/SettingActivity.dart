import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/basicSettings_api.dart';
import 'package:sunstarmovers/pages/SettingActivitySheet.dart';
import 'package:sunstarmovers/pages/SettingsBuilding.dart';
import 'package:sunstarmovers/pages/searchBar.dart';
import 'package:sunstarmovers/pages/showDialog2.dart';
import 'package:sunstarmovers/responses/ActivitySettingsResponse.dart';

class SettingActivity extends StatefulWidget {
  const SettingActivity({super.key});

  @override
  State<SettingActivity> createState() => _SettingActivityState();
}

class _SettingActivityState extends State<SettingActivity> {
  ActivitySettingsResponse? activitySettingsResponse;
  bool screenLoad=true;

  @override
  void initState() {
    getActivitySetting();
    super.initState();
  }

  @override

  getActivitySetting()async
  {
    activitySettingsResponse=await BasicSettingApi().activitySettings();
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
            "Activity",
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
                      return SettingActivitySheet();
                    }
                ).then((value) async
                {
                  if(value==true)
                    {
                      setState(() {
                        screenLoad=true;
                      });
                      await getActivitySetting();
                    }
                });
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
                  child:SearchBarr(title: 'Search for Activity', image: 'assets/3864_boolean_operation.png',),
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
                        Text("Activity",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,fontFamily: 'Poppins'),),
                      ],
                    ),

                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: activitySettingsResponse!.data!.length,
                        itemBuilder: (context,index)
                            {
                              return Column(
                                children: [
                                  Rows1(text1: activitySettingsResponse!.data![index].marketingTypeName!,
                                    onTap: (){
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context)
                                        {
                                          return SettingActivitySheet(activityID: activitySettingsResponse!.data![index].marketingTypeID,activityName: activitySettingsResponse!.data![index].marketingTypeName,);
                                        }
                                    ).then((value) async
                                    {
                                      if(value==true)
                                        {
                                          setState(() {
                                            screenLoad=true;
                                          });
                                          await getActivitySetting();
                                        }
                                    }
                                    );
                                  },

                                    onTap1: ()
                                    {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context)
                                          {
                                            return showDialog2(
                                                title: 'Confirm',
                                                subtitle: 'Are you sure you want to delete this activity type.?',
                                                button1: 'Yes',
                                                button2: 'Cancel',
                                                onPressed: ()async{
                                                  var isSuccess=await BasicSettingApi().deleteActivityType(activitySettingsResponse!.data![index].marketingTypeID);
                                                  Get.back(result: true);
                                                  await getActivitySetting();
                                                },
                                            );
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
