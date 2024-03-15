import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/SettingLeadSourcesheet.dart';
import 'package:sunstarmovers/pages/SettingsBuilding.dart';
import 'package:sunstarmovers/pages/searchBar.dart';

class SettingLeadSource extends StatelessWidget {
  const SettingLeadSource({super.key});

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


      body: Padding(
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

                    Rows1(text1: 'Whatsapp',onTap: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context)
                          {
                            return SettingLeadSourceSheet();
                          }
                      );
                    },),
                    new Divider(color: Colors.grey.shade300,),
                    Rows1(text1: 'Office',onTap: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context)
                          {
                            return SettingLeadSourceSheet();
                          }
                      );
                    }),
                    new Divider(color: Colors.grey.shade300,),
                    Rows1(text1: 'Thomas',onTap: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context)
                          {
                            return SettingLeadSourceSheet();
                          }
                      );
                    }),
                    new Divider(color: Colors.grey.shade300,),
                    Rows1(text1: 'Geetika',onTap: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context)
                          {
                            return SettingLeadSourceSheet();
                          }
                      );
                    }),
                    new Divider(color: Colors.grey.shade300,),
                    Rows1(text1: 'Office 2',onTap: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context)
                          {
                            return SettingLeadSourceSheet();
                          }
                      );
                    }),
                    new Divider(color: Colors.grey.shade300,),
                    Rows1(text1: 'Thomas davaid',onTap: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context)
                          {
                            return SettingLeadSourceSheet();
                          }
                      );
                    }),
                    new Divider(color: Colors.grey.shade300,),
                    Rows1(text1: 'Test',onTap: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context)
                          {
                            return SettingLeadSourceSheet();
                          }
                      );
                    }),
                    new Divider(color: Colors.grey.shade300,),
                    Rows1(text1: 'ddd',onTap: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context)
                          {
                            return SettingLeadSourceSheet();
                          }
                      );
                    }),
                    new Divider(color: Colors.grey.shade300,),
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
