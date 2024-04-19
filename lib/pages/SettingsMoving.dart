import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/basicSettings_api.dart';
import 'package:sunstarmovers/pages/SettingsBuilding.dart';
import 'package:sunstarmovers/pages/SettingsMovingSheet.dart';
import 'package:sunstarmovers/pages/searchBar.dart';
import 'package:sunstarmovers/pages/showDialog2.dart';
import 'package:sunstarmovers/responses/MovingTypeSettingsResponse.dart';

class SettingsMoving extends StatefulWidget {
  const SettingsMoving({super.key});

  @override
  State<SettingsMoving> createState() => _SettingsMovingState();
}

class _SettingsMovingState extends State<SettingsMoving> {
  MovingTypeSettingsResponse? movingTypeSettingsResponse;
  bool screenLoad=true;

  @override
  void initState() {
    getMovingTypeSettings();
    super.initState();
  }
  @override

  getMovingTypeSettings()async
  {
    movingTypeSettingsResponse=await BasicSettingApi().movingTypeSettings();
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
            "Moving Types",
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
                      return SettingsMovingSheet();
                    }
                ).then((value)async
                {
                  if(value==true)
                    {
                      setState(() {
                        screenLoad=true;
                      });
                      await getMovingTypeSettings();
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

      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child:SearchBarr(title: 'Search for Moving Types', image: 'assets/3864_boolean_operation.png',),
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
                        Text("Moving Types",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,fontFamily: 'Poppins'),),
                      ],
                    ),

                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: movingTypeSettingsResponse!.data!.length,
                      itemBuilder: (context ,index)
                      {
                        return Column(
                          children: [
                            Rows1(

                              text1: movingTypeSettingsResponse!.data![index].movingTypeName!,
                              onTap: (){
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context)
                                  {
                                    return SettingsMovingSheet(movingTypeID: movingTypeSettingsResponse!.data![index].movingTypeID,movingTypeName: movingTypeSettingsResponse!.data![index].movingTypeName,);
                                  }
                              ).then((value)async
                                  {
                                    if(value==true)
                                      {
                                        setState(() {
                                          screenLoad=true;
                                        });
                                        await getMovingTypeSettings();
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
                                          subtitle: 'Are you sure you want to delete this moving type.?',
                                          button1: 'Yes',
                                          button2: 'Cancel',
                                        onPressed: ()async{
                                            var isSuccess=await BasicSettingApi().deleteMovingType(movingTypeSettingsResponse!.data![index].movingTypeID);
                                            Get.back(result: true);
                                            await getMovingTypeSettings();
                                        },
                                      );
                                    }

                                );
                              },
                            ),
                            new Divider(color: Colors.grey.shade300,),
                          ],
                        );

                      },
                    ),

                    // Rows1(text1: 'Local Move',onTap: (){
                    //   showModalBottomSheet(
                    //     context: context,
                    //     builder: (BuildContext context)
                    //     {
                    //       return SettingsMovingSheet();
                    //     }
                    // );
                    //   },),
                    // new Divider(color: Colors.grey.shade300,),
                    // Rows1(text1: 'International Move',onTap: (){
                    //   showModalBottomSheet(
                    //       context: context,
                    //       builder: (BuildContext context)
                    //       {
                    //         return SettingsMovingSheet();
                    //       }
                    //   );
                    // },),
                    // new Divider(color: Colors.grey.shade300,),
                    // Rows1(text1: 'Export Packing',onTap: (){
                    //   showModalBottomSheet(
                    //       context: context,
                    //       builder: (BuildContext context)
                    //       {
                    //         return SettingsMovingSheet();
                    //       }
                    //   );
                    // },),
                    // new Divider(color: Colors.grey.shade300,),
                    // Rows1(text1: 'Storage Packing',onTap: (){
                    //   showModalBottomSheet(
                    //       context: context,
                    //       builder: (BuildContext context)
                    //       {
                    //         return SettingsMovingSheet();
                    //       }
                    //   );
                    // },),
                    // new Divider(color: Colors.grey.shade300,),
                    // Rows1(text1: 'Local Move',onTap: (){
                    //   showModalBottomSheet(
                    //       context: context,
                    //       builder: (BuildContext context)
                    //       {
                    //         return SettingsMovingSheet();
                    //       }
                    //   );
                    // },),
                    // new Divider(color: Colors.grey.shade300,),
                    // Rows1(text1: 'test',onTap: (){
                    //   showModalBottomSheet(
                    //       context: context,
                    //       builder: (BuildContext context)
                    //       {
                    //         return SettingsMovingSheet();
                    //       }
                    //   );
                    // },),
                    // new Divider(color: Colors.grey.shade300,),

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
