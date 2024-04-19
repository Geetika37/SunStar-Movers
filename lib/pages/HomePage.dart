import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/auth_api.dart';
import 'package:sunstarmovers/Apis/dashboard_Api.dart';
import 'package:sunstarmovers/controller/appController.dart';
import 'package:sunstarmovers/enums/enum.dart';
import 'package:sunstarmovers/pages/BottomNav.dart';
import 'package:sunstarmovers/pages/ChartRow.dart';
import 'package:sunstarmovers/pages/Row1.dart';
import 'package:sunstarmovers/pages/Row2.dart';
import 'package:sunstarmovers/pages/Survey.dart';
import 'package:sunstarmovers/pages/chart.dart';
import 'package:sunstarmovers/pages/container2.dart';
import 'package:sunstarmovers/pages/navBar.dart';
import 'package:sunstarmovers/responses/LatestSurveyResponse.dart';
import 'package:sunstarmovers/responses/SurveyGraph.dart';
import 'package:skeleton_text/skeleton_text.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SurveyGraph>? surveyGraph;
  AppController appCt = Get.find();
  bool screenLoad = true;
  bool graphScreenLoad = true;
  bool countScreenLoad = true;
  String title = 'Week';
  int Id = Periods.Week.index;

  @override
  void initState() {
    appCt.getProfile();
    getCount();
    getDetails();
    getSurveyGraph();
    super.initState();
  }

  getSurveyGraph()async
  {
    surveyGraph = await AuthApi().graph(Id);
    setState(() {
      graphScreenLoad = false;
    });
  }

  getCount() async {
    appCt.dashboardCountResponse =
        await DashboardApi().dashboardCountResponse();
    setState(() {
      countScreenLoad = false;
    });
  }

  getDetails() async {
    appCt.lastestSurvey = await DashboardApi().LastestSurvey();
    setState(() {
      screenLoad = false;
    });
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3.0,
        shadowColor: Colors.red,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10))),
        backgroundColor: Colors.red,
        toolbarHeight: 80,
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          );
        }),
        title: Text(
          "Hello ${appCt.profileDetailResponse?.firstName}${appCt.profileDetailResponse?.middleName}",
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image(image: AssetImage("assets/Group.png")),
          )
        ],
      ),
      drawer: navBar(),

      body: GetBuilder<AppController>(builder: (ct) {
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Overview",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Flexible(
                              child: countScreenLoad?
                              HomeCardLoad():
                              HomeCard(
                                title: 'Total Surveys',
                                                          title2:
                                '${ct.dashboardCountResponse!.surveyCount!.currentYearSurvey! - ct.dashboardCountResponse!.surveyCount!.lastYearSurvey!}',
                                                          title3:
                                '${ct.dashboardCountResponse!.surveyCount!.currentYearSurvey!}',
                                                          image: 'assets/Group 28.png',
                                                        ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Flexible(
                            child:countScreenLoad?
                            HomeCardLoad(): HomeCard(
                              title: 'Total activities',
                              title2:
                                  '${ct.dashboardCountResponse!.marketingCount!.currentYearActivity! - ct.dashboardCountResponse!.marketingCount!.lastYearActivity!}',
                              title3:
                                  '${appCt.dashboardCountResponse!.marketingCount!.currentYearActivity!}',
                              image: 'assets/Group 427318358.png',
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          padding: EdgeInsets.all(10),
                          height: 460,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3))
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Survey Report",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 75,
                                  ),
                                  PopupMenuButton(
                                      onSelected: (newValue) {
                                        setState(() {
                                          title = newValue;
                                          print(
                                              '----------------------------------${title}');
                                          if (title == Periods.Week.name) {
                                            Id = Periods.Week.index;
                                          } else if (title ==
                                              Periods.Month.name) {
                                            Id = Periods.Month.index;
                                          } else {
                                            Id = Periods.Year.index;
                                          }
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            "Show: This ${title}",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      itemBuilder: (context) => [
                                            PopupMenuItem(
                                                value: Periods.Week.name,
                                                child: Text(Periods.Week.name)),
                                            PopupMenuItem(
                                                value: Periods.Month.name,
                                                child:
                                                    Text(Periods.Month.name)),
                                            PopupMenuItem(
                                                value: Periods.Year.name,
                                                child: Text(Periods.Year.name)),
                                          ]),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              graphScreenLoad?
                                  SkeletonAnimation(child: Skelton(height: 230,))
                                  :     Chart(surveyGraph: surveyGraph),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Status',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: const Color.fromARGB(
                                                  255, 167, 166, 166)),
                                        ),
                                        Text(
                                          'Surveys',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: const Color.fromARGB(
                                                  255, 167, 166, 166)),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 10,
                                      color: Colors.grey.shade300,
                                      thickness: 1,
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                    RowChart(
                                      text: 'Pending Survey',
                                      count: '${surveyGraph?.first.pendingSurvey}',
                                      color: const Color(0xff909090),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    RowChart(
                                      text: 'Confirmed Survey',
                                      count: '${surveyGraph?.first.confirmSurvey}',
                                      color: Colors.blue,
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    RowChart(
                                      text: 'Start Work ',
                                      count: '${surveyGraph?.first.startWorkSurvey}',
                                      color: Color.fromARGB(255, 59, 156, 52),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    RowChart(
                                      text: 'Closed Survey',
                                      count: '${surveyGraph?.first.closedSurvey}',
                                      color: Color(0xffD45B04),
                                    ),
                                    RowChart(
                                      text: 'Cancelled Survey',
                                      count: '${surveyGraph?.first.canceledSurvey}',
                                      color: Color(0xffFFB100),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      screenLoad?SkeletonAnimation(child: Skelton(height: 40,)):Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3))
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Surveys",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      fontFamily: 'Poppins'),
                                ),
                                Text(
                                  "View all",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      fontFamily: 'Poppins',
                                      color: Colors.red),
                                )
                              ],
                            ),

                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: appCt.lastestSurvey!.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      new Divider(
                                        color: Colors.grey.shade300,
                                      ),
                                      Row2(
                                        status: orderStatusList
                                            .firstWhere((element) =>
                                                element.id ==
                                                ct.lastestSurvey![index]
                                                    .orderStatus)
                                            .value!,
                                        color1: orderStatusList
                                            .firstWhere((element) =>
                                                element.id ==
                                                ct.lastestSurvey![index]
                                                    .orderStatus)
                                            .backgroundColor!,
                                        color2: orderStatusList
                                            .firstWhere((element) =>
                                                element.id ==
                                                ct.lastestSurvey![index]
                                                    .orderStatus)
                                            .textColor!,
                                        name:
                                            '${ct.lastestSurvey![index].customerName}',
                                        surveyId:
                                            ct.lastestSurvey![index].surveyID,
                                        date:
                                            "${ct.lastestSurvey![index].date}",
                                        time:
                                            "${ct.lastestSurvey![index].time}",
                                        image2: 'assets/calendar.png',
                                        image3: 'assets/clock.png',
                                        percentage:
                                            '${ct.lastestSurvey![index].leadQuality}',
                                        bgcolor: circularProg
                                            .firstWhere((element) =>
                                                element.value ==
                                                ct.lastestSurvey![index]
                                                    .leadQuality)
                                            .backgroundColor!,
                                        fgcolor: circularProg
                                            .firstWhere((element) =>
                                                element.value ==
                                                ct.lastestSurvey![index]
                                                    .leadQuality)
                                            .foregroundColor!,
                                        textColor: circularProg
                                            .firstWhere((element) =>
                                                element.value ==
                                                ct.lastestSurvey![index]
                                                    .leadQuality)
                                            .backgroundColor!,
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
              );
            }),

      // bottomNavigationBar:  BottomNav(),
    );
  }
}

class IdValue {
  int? id;
  String? value;
  Color? backgroundColor;
  Color? textColor;
  IdValue({this.value, this.id, this.backgroundColor, this.textColor});
}

List<IdValue> orderStatusList = [
  IdValue(
      id: OrderStatus.Pending.index,
      value: OrderStatus.Pending.name,
      backgroundColor: Color(0xfffFFF6DF),
      textColor: Color(0xfffFFB100)),
  IdValue(
      id: OrderStatus.Canceled.index,
      value: OrderStatus.Canceled.name,
      backgroundColor: Color(0xfffE2FEEA),
      textColor: Color(0xfff0B6623)),
  IdValue(
      id: OrderStatus.Confirmed.index,
      value: OrderStatus.Confirmed.name,
      backgroundColor: Color(0xfffDCFFF1),
      textColor: Color(0xfff3DD598)),
  IdValue(
      id: OrderStatus.StartWork.index,
      value: OrderStatus.StartWork.name,
      backgroundColor: Color(0xfffE8F2FE),
      textColor: Color(0xfff157CF0)),
  IdValue(
      id: OrderStatus.Closed.index,
      value: OrderStatus.Closed.name,
      backgroundColor: Color(0xfffFFEFEF),
      textColor: Color(0xfffFC5A5A)),
];

class PeriodsChart {
  int? id;
  String? value;
  PeriodsChart({this.id, this.value});
}

List<PeriodsChart> PeriodsChartList = [
  PeriodsChart(id: Periods.Week.index, value: Periods.Week.name),
  PeriodsChart(id: Periods.Month.index, value: Periods.Month.name),
  PeriodsChart(id: Periods.Year.index, value: Periods.Year.name),
];
