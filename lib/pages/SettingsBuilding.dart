import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/SettingBuildingSheet.dart';
import 'package:sunstarmovers/pages/searchBar.dart';

class SettingsBuilding extends StatelessWidget {
  const SettingsBuilding({super.key});

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
            "Building Types",
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
                      return SettingBuildingSheet();
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
                        Text("Building Types",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,fontFamily: 'Poppins'),),
                      ],
                    ),

                    Rows1(text1: 'Flat',onTap: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context)
                          {
                            return SettingBuildingSheet();
                          }
                      );
                    },),
                    new Divider(color: Colors.grey.shade300,),
                    Rows1(text1: 'Villa',onTap: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context)
                          {
                            return SettingBuildingSheet();
                          }
                      );
                    }),
                    new Divider(color: Colors.grey.shade300,),
                    Rows1(text1: 'Office',onTap: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context)
                          {
                            return SettingBuildingSheet();
                          }
                      );
                    }),
                    new Divider(color: Colors.grey.shade300,),
                    Rows1(text1: 'Ware House',onTap: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context)
                          {
                            return SettingBuildingSheet();
                          }
                      );
                    }),
                    new Divider(color: Colors.grey.shade300,),
                    Rows1(text1: 'Office 2',onTap: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context)
                          {
                            return SettingBuildingSheet();
                          }
                      );
                    }),
                    new Divider(color: Colors.grey.shade300,),
                    Rows1(text1: 'home',onTap: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context)
                          {
                            return SettingBuildingSheet();
                          }
                      );
                    }),
                    new Divider(color: Colors.grey.shade300,),
                    Rows1(text1: 'apartments',onTap: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context)
                          {
                            return SettingBuildingSheet();
                          }
                      );
                    }),
                    new Divider(color: Colors.grey.shade300,),
                    Rows1(text1: 'ddd',onTap: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context)
                          {
                            return SettingBuildingSheet();
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



class Rows1 extends StatelessWidget {
  final String text1;
  final Function() onTap;
  const Rows1({super.key, required this.text1, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(text1,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,fontFamily: 'Poppins'),),
      trailing: SizedBox(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(onPressed: (){}, icon: Image.asset('assets/trash-04.png')),
            IconButton(onPressed: onTap
            , icon: Image.asset('assets/edit-05.png')),
          ],
        ),
      ),
    );
  }
}
