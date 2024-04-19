import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/basicSettings_api.dart';
import 'package:sunstarmovers/pages/SettingEmiratessheet.dart';
import 'package:sunstarmovers/pages/SettingsBuilding.dart';
import 'package:sunstarmovers/pages/searchBar.dart';
import 'package:sunstarmovers/pages/showDialog2.dart';
import 'package:sunstarmovers/responses/EmirateSettingsResponse.dart';

class SettingEmirate extends StatefulWidget {
  const SettingEmirate({super.key});

  @override
  State<SettingEmirate> createState() => _SettingEmirateState();
}

class _SettingEmirateState extends State<SettingEmirate> {
  EmirateSettingsResponse? emirateSettingsResponse;
  bool screenLoad=true;


  @override
  void initState() {
    getEmirateSettings();
    super.initState();
  }

  @override

  getEmirateSettings()async
  {
    emirateSettingsResponse=await BasicSettingApi().emirateSettings();
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
            "Emirate",
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
                      return SettingEmiratesheet();
                    }
                ).then((value) async
                {
                  setState(() {
                    screenLoad=true;
                  });
                  await getEmirateSettings();
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
          )): Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child:SearchBarr(title: 'Search for Emirate', image: 'assets/3864_boolean_operation.png',),
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
                        Text("Building Types",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,fontFamily: 'Poppins'),),
                      ],
                    ),

                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: emirateSettingsResponse!.data!.length,
                        itemBuilder: (context,index)
                            {
                              return Column(
                                children: [
                                  Rows1(text1: emirateSettingsResponse!.data![index].emiratesName!,
                                    onTap: (){
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context)
                                        {
                                          return SettingEmiratesheet(emirateID: emirateSettingsResponse!.data![index].emiratesID,emirateTypeName: emirateSettingsResponse!.data![index].emiratesName,);
                                        }
                                    ).then((value)async
                                    {
                                      if(value==true)
                                      {
                                        setState(() {
                                          screenLoad=true;
                                        });
                                        await getEmirateSettings();
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
                                              subtitle: 'Are you sure you want to delete this emirate.?',
                                              button1: 'Yes',
                                              button2: 'Cancel',
                                            onPressed: ()async
                                            {
                                              var isSuccess=await BasicSettingApi().deleteEmirateType(emirateSettingsResponse!.data![index].emiratesID);
                                              Get.back(result: true);
                                              await getEmirateSettings();
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
