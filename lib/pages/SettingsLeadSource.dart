import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/basicSettings_api.dart';
import 'package:sunstarmovers/pages/SettingLeadSourcesheet.dart';
import 'package:sunstarmovers/pages/SettingsBuilding.dart';
import 'package:sunstarmovers/pages/searchBar.dart';
import 'package:sunstarmovers/pages/showDialog2.dart';
import 'package:sunstarmovers/responses/LeadSourceSettingsResponse.dart';

class SettingLeadSource extends StatefulWidget {
  const SettingLeadSource({super.key});

  @override
  State<SettingLeadSource> createState() => _SettingLeadSourceState();
}

class _SettingLeadSourceState extends State<SettingLeadSource> {
  LeadSourceSettingsResponse? leadSourceSettingsResponse;
  bool screenLoad=true;

  @override
  void initState() {
    getLeadSourceDetails();
    super.initState();
  }
  @override

  getLeadSourceDetails()async
  {
    leadSourceSettingsResponse=await BasicSettingApi().leadSourceSettings();
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
            "Lead Source",
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
                      return SettingLeadSourceSheet();
                    }
                ).then((value) async
                    {
                      if(value==true)
                        {
                          setState(() {
                            screenLoad=true;
                          });
                          await getLeadSourceDetails();
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


      body:screenLoad?  Center(
          child: CircularProgressIndicator(
            color: Colors.red,
          )): Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child:SearchBarr(title: 'Search for Building Types', image: 'assets/3864_boolean_operation.png',),
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
                        Text("Lead Source",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,fontFamily: 'Poppins'),),
                      ],
                    ),

                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: leadSourceSettingsResponse!.data!.length,
                        itemBuilder: (context,index)
                            {
                              return Column(
                                children: [
                                  Rows1(
                                    text1: leadSourceSettingsResponse!.data![index].leadSourseName!,
                                    onTap: (){
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context)
                                        {
                                          return SettingLeadSourceSheet(leadSourceID: leadSourceSettingsResponse!.data![index].leadSourceID,leadSourceName: leadSourceSettingsResponse!.data![index].leadSourseName,);
                                        }
                                    ).then((value)async
                                    {
                                      if(value==true)
                                        {
                                          setState(() {
                                            screenLoad=true;
                                          });
                                          await getLeadSourceDetails();
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
                                                subtitle: 'Are you sure you want to delete Lead Source.?',
                                                button1: 'Yes',
                                                button2: 'Cancel',
                                              onPressed: ()async{
                                                  var isSuccess=await BasicSettingApi().deleteLeadSourceType(leadSourceSettingsResponse!.data![index].leadSourceID);
                                                  Get.back(result: true);
                                                  await getLeadSourceDetails();
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
