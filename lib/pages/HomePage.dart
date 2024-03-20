import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/dashboard_Api.dart';
import 'package:sunstarmovers/controller/appController.dart';
import 'package:sunstarmovers/enums/enum.dart';

import 'package:sunstarmovers/pages/BottomNav.dart';
import 'package:sunstarmovers/pages/Row1.dart';
import 'package:sunstarmovers/pages/Row2.dart';
import 'package:sunstarmovers/pages/Survey.dart';
import 'package:sunstarmovers/pages/chart.dart';
import 'package:sunstarmovers/pages/container2.dart';
import 'package:sunstarmovers/pages/navBar.dart';
import 'package:sunstarmovers/responses/LatestSurveyResponse.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppController appCt=Get.find();

  @override
  void initState() {
    appCt.getProfile();
    getCount();
    getDetails();
    super.initState();
  }

  getCount() async
  {
    appCt. dashboardCountResponse=await DashboardApi().dashboardCountResponse();
  }

  getDetails() async
  {
    appCt.lastestSurvey=await DashboardApi().LastestSurvey();
    setState(() {

    });
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3.0,
        shadowColor: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))),
        backgroundColor: Colors.red,
        toolbarHeight: 80,
        leading: Builder(
            builder: (context) {
              return IconButton(onPressed: (){
                Scaffold.of(context).openDrawer();
              }, icon: Icon(Icons.menu,color: Colors.white,),);
            }
        ),
        title: Text("Hello ${appCt.profileDetailResponse?.firstName}${appCt.profileDetailResponse?.middleName}",style: TextStyle(color: Colors.white,fontSize:16,fontWeight: FontWeight.w500,fontFamily: 'Poppins'),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image(image: AssetImage("assets/Group.png")),
          )
        ],
      ),
      drawer: navBar(),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [

              Row(
                children: [
                  Text("Overview",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,fontFamily: 'Poppins'),),
                  SizedBox(width: 120,),
                  Text("Show:",style: TextStyle(fontSize: 14,color: Colors.grey,fontFamily: 'Poppins',fontWeight: FontWeight.w400),),
                  Text("This Year",style: TextStyle(fontSize: 14,fontFamily: 'Poppins',fontWeight: FontWeight.w400),),
                  Image(image: AssetImage("assets/ic_Dropdown.png"))
                ],
              ),
              SizedBox(height: 20,),

              Row(
                children: [

                  Flexible(child: HomeCard(title: 'Total Surveys',title2: '${appCt.dashboardCountResponse!.surveyCount!.currentYearSurvey!- appCt.dashboardCountResponse!.surveyCount!.lastYearSurvey!}',title3: '${appCt.dashboardCountResponse!.surveyCount!.currentYearSurvey!}',image: 'assets/Group 28.png',)),
                  SizedBox(width: 15,),
                  Flexible(child: HomeCard(title: 'Total activities',title2: '${appCt.dashboardCountResponse!.marketingCount!.currentYearActivity!- appCt.dashboardCountResponse!.marketingCount!.lastYearActivity!}',title3: '${appCt.dashboardCountResponse!.marketingCount!.currentYearActivity!}',image: 'assets/Group 427318358.png',),)
                ],
              ),
              SizedBox(height: 15,),

              Container(
                padding: EdgeInsets.all(10),
                height: 360,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3)
                    )
                  ]
                ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Text("Survey Report",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,fontFamily: 'Poppins',),),
                          SizedBox(width: 110,),
                          Text("2017-2018",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,fontFamily: 'Poppins',color: Colors.grey),),

                        ],
                      ),
                      SizedBox(height: 15,),
                      Chart(),

                      Divider(
                        height: 10,
                        color: Colors.grey.shade300,
                        thickness: 1,
                        indent : 10,
                        endIndent : 10,
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(width: 50,),
                            Row1(image: 'assets/Oval.png',title1: ' Last year',title2: '989',),
                            SizedBox(width: 40,),
                            Row1(image: 'assets/Oval_pic.png',title1: ' This Year ',image1: 'assets/up.png',title2: '1223',title3: " 1.2%",)
                        ],
                      )
                    ],
                  )
              ),

              SizedBox(height: 20,),

              Container(
                 padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3)
                    )
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text("Surveys",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,fontFamily: 'Poppins'),),

                        Text("View all",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13,fontFamily: 'Poppins',color: Colors.red),)
                      ],
                    ),

                    ListView.builder(
                      shrinkWrap: true,
                        itemCount: appCt.lastestSurvey!.length,
                        itemBuilder: (context, index){

                      return Column(
                        children: [
                          new Divider(
                            color: Colors.grey.shade300,
                          ),
                          Row2(status: orderStatusList.firstWhere((element) =>  element.id == appCt.lastestSurvey![index].orderStatus).value !  ,
                            color1: orderStatusList.firstWhere((element) => element.id == appCt.lastestSurvey![index].orderStatus).backgroundColor! ,
                            color2:orderStatusList.firstWhere((element) => element.id == appCt.lastestSurvey![index].orderStatus).textColor! ,
                            name: '${appCt.lastestSurvey![index].customerName}',
                            date: "${appCt.lastestSurvey![index].date}",
                            time: "${appCt.lastestSurvey![index].time}",
                            image2: 'assets/calendar.png',
                            image3: 'assets/clock.png',
                            percentage: '${appCt.lastestSurvey![index].leadQuality}',
                            bgcolor: circularProg.firstWhere((element) => element.value==appCt.surveyDetailsResponse!.data![index].leadQuality).backgroundColor!,
                            fgcolor: circularProg.firstWhere((element) => element.value==appCt.surveyDetailsResponse!.data![index].leadQuality).foregroundColor!,
                            textColor: circularProg.firstWhere((element) => element.value==appCt.surveyDetailsResponse!.data![index].leadQuality).backgroundColor!,
                          ),
                        ],
                      );
                    })

                    // new Divider(
                    //   color: Colors.grey.shade300,
                    // ),
                    // SizedBox(height: 10,),
                    //
                    // Column(
                    //   children: [
                    //     Row(
                    //       children: [
                    //         SizedBox(width: 20,),
                    //         Row2(status: '${appCt.LastestSurvey?.orderStatus}',color1:Colors.yellow.withOpacity(0.1) ,color2:Colors.yellow.shade800 ,name: '${appCt.LastestSurvey!.customerName}', date: "12/12/2023", time: "12:45 PM", image2: 'assets/calendar.png', image3: 'assets/clock.png', percentage: '75%',),
                    //       ],
                    //     ),
                    //     SizedBox(height: 10,),
                    //
                    //     new Divider(
                    //       color: Colors.grey.shade300,
                    //     ),
                    //     SizedBox(height: 10,),
                    //
                    //
                    //     Row(
                    //       children: [
                    //         SizedBox(width: 20,),
                    //         Row2(status: 'Pending',color1:Colors.yellow.withOpacity(0.1) ,color2:Colors.yellow.shade800 ,name: "Peter Parker", date: "12/12/2023", time: "12:45 PM", image2: 'assets/calendar.png', image3: 'assets/clock.png', percentage: '10%',),
                    //       ],
                    //     ),
                    //     SizedBox(height: 10,),
                    //
                    //     new Divider(
                    //       color: Colors.grey.shade300,
                    //     ),
                    //     SizedBox(height: 10,),
                    //
                    //     Row(
                    //       children: [
                    //         SizedBox(width: 20,),
                    //         Row2(status: 'Pending',color1:Colors.yellow.withOpacity(0.1) ,color2:Colors.yellow.shade800 ,name: "Zack Snyder",  date: "12/12/2023", time: "12:45 PM", image2: 'assets/calendar.png', image3: 'assets/clock.png', percentage: '100%',),
                    //       ],
                    //     ),


                      // ],
                    // )


                  ],
                ),
              ),

            ],
          ),
        ),
      ),

      // bottomNavigationBar:  BottomNav(),

    );
  }
}


class IdValue{
  int? id;
  String? value;
  Color? backgroundColor;
  Color? textColor;
  IdValue({this.value,this.id,this.backgroundColor,this.textColor});
}


List<IdValue> orderStatusList = [
  IdValue(id: OrderStatus.Pending.index,value: OrderStatus.Pending.name,backgroundColor: Color(0xfffFFF6DF),textColor: Color(0xfffFFB100)),
  IdValue(id: OrderStatus.Canceled.index,value: OrderStatus.Canceled.name,backgroundColor: Color(0xfffE2FEEA),textColor: Color(0xfff0B6623)),
  IdValue(id: OrderStatus.Confirmed.index,value: OrderStatus.Confirmed.name,backgroundColor: Color(0xfffDCFFF1),textColor: Color(0xfff3DD598)),
  IdValue(id: OrderStatus.StartWork.index,value: OrderStatus.StartWork.name,backgroundColor: Color(0xfffE8F2FE),textColor: Color(0xfff157CF0)),
  IdValue(id: OrderStatus.Closed.index,value: OrderStatus.Closed.name,backgroundColor: Color(0xfffFFEFEF),textColor: Color(0xfffFC5A5A)),

];