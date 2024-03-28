import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/marketing_api.dart';
import 'package:sunstarmovers/controller/appController.dart';
import 'package:sunstarmovers/pages/MarketingAdd.dart';
import 'package:sunstarmovers/pages/MarketingBottomSheet.dart';
import 'package:sunstarmovers/pages/MarketingDetails.dart';
import 'package:sunstarmovers/pages/Row2.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/searchBar.dart';

class Marketing extends StatefulWidget {
  const Marketing({super.key});

  @override
  State<Marketing> createState() => _MarketingState();
}

class _MarketingState extends State<Marketing> {
  AppController appCt=Get.find();
  bool screenLoad=true;

  @override
  void initState() {
    getMarketingDetails();
    super.initState();
  }

  getMarketingDetails()async
  {
    appCt.marketingDetailResponse=await MarketingApi().marketingDetails();
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
            "Marketing",
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MarketingAdd()));
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
    ))
        : GetBuilder<AppController>(
          builder: (ct) {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),

              children: [

                Row(
                  children: [
                    Expanded(
                        child:SearchBarr(title: 'Search for Marketing', image: 'assets/3864_boolean_operation.png',),
                    ),
                    IconButton(
                        onPressed: (){
                          showModalBottomSheet(
                            isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context)
                              {
                                return  MarketingBottomSheet();
                              }
                          );
                        },
                        icon: ImageIcon(AssetImage("assets/3881_frame.png"),size: 35,))
                  ],
                ),

                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Marketing",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,fontFamily: 'Poppins'),),
                        ],
                      ),
                      SizedBox(height: 30,),

                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: appCt.marketingDetailResponse!.data!.length,
                          itemBuilder: (context,index)
                              {
                                return Column(
                                  children: [
                                    Row3(
                                      MarketingId: appCt.marketingDetailResponse!.data![index].marketingID,
                                      status: '${appCt.marketingDetailResponse!.data![index].marketingTypeName}',
                                      color1:const Color(0xfffFFEFEF) ,
                                      color2:const Color(0xfffFC5A5A),
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MarketingDetails(
                                          MarketingId: ct.marketingDetailResponse!.data![index].marketingID,

                                        ))).
                                        then((value)async
                                        {
                                          if(value=true)
                                            {
                                              setState(() {
                                                screenLoad=true;
                                              });
                                              await getMarketingDetails();
                                            }
                                        }
                                        );
                                        },
                                      name1: '${appCt.marketingDetailResponse!.data![index].customerName!}',
                                      date: '${appCt.marketingDetailResponse!.data![index].date}',
                                      time: '${appCt.marketingDetailResponse!.data![index].time}',
                                      image1: 'assets/calendar.png',
                                      image2: 'assets/clock.png',
                                      image3: 'assets/offcework.png', ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    new Divider(
                                      color: Colors.grey.shade300,
                                    ),

                                  ],
                                );

                              }
                      ),
                      // Row3( status: 'Marketing', color1:const Color(0xfffFFEFEF) ,color2:const Color(0xfffFC5A5A),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>MarketingDetails()));},name1: 'Zack Snyder', name2: '12/12/2023', name3: '12:45 PM', image1: 'assets/calendar.png', image2: 'assets/clock.png', image3: 'assets/offcework.png', ),
                      // SizedBox(height: 10,),
                      //
                      // new Divider(
                      //   color: Colors.grey.shade300,
                      // ),
                      //
                      // SizedBox(height: 10,),
                      // Row3(status: 'visit', color1:const Color(0xfffFFEFEF) ,color2:const Color(0xfffFC5A5A),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>MarketingDetails()));},name1: 'James Wan', name2: '12/12/2023', name3: '12:45 PM', image1: 'assets/calendar.png', image2: 'assets/clock.png', image3: 'assets/visit.png'),
                      // SizedBox(height: 10,),
                      //
                      // new Divider(
                      //   color: Colors.grey.shade300,
                      // ),
                      //
                      // SizedBox(height: 10,),
                      // Row3(status: 'Marketing', color1:const Color(0xfffFFEFEF) ,color2:const Color(0xfffFC5A5A),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>MarketingDetails()));},name1: 'Peter Parker', name2: '12/12/2023', name3: '12:45 PM', image1: 'assets/calendar.png', image2: 'assets/clock.png', image3: 'assets/marketnng.png'),
                      // SizedBox(height: 10,),
                      //
                      // new Divider(
                      //   color: Colors.grey.shade300,
                      // ),
                      //
                      // SizedBox(height: 10,),
                      // Row3(status: 'Marketing', color1:const Color(0xfffFFEFEF) ,color2:const Color(0xfffFC5A5A),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>MarketingDetails()));},name1: 'James Anderson', name2: '12/12/2023', name3: '12:45 PM', image1: 'assets/calendar.png', image2: 'assets/clock.png', image3: 'assets/meetng.png'),
                      // SizedBox(height: 10,),
                      //
                      // new Divider(
                      //   color: Colors.grey.shade300,
                      // ),
                      //
                      // SizedBox(height: 10,),
                      // Row3(status: 'visit', color1:const Color(0xfffFFEFEF) ,color2:const Color(0xfffFC5A5A),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>MarketingDetails()));},name1: 'Finn Balor', name2: '12/12/2023', name3: '12:45 PM', image1: 'assets/calendar.png', image2: 'assets/clock.png', image3: 'assets/complete.png')

                    ],
                  ),
                )

              ],
            );
          }
        ),

    );
  }
}
