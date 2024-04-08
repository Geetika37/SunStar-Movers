import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/survey_api.dart';
import 'package:sunstarmovers/controller/appController.dart';
import 'package:sunstarmovers/pages/AddSurvey.dart';
import 'package:sunstarmovers/pages/BottomNav.dart';
import 'package:sunstarmovers/pages/BottomSheet.dart';
import 'package:sunstarmovers/pages/HomePage.dart';
import 'package:sunstarmovers/pages/Row2.dart';
import 'package:sunstarmovers/pages/SurveyDetails.dart';
import 'package:sunstarmovers/pages/navBar.dart';
import 'package:sunstarmovers/pages/searchBar.dart';
import 'package:sunstarmovers/responses/SurveyDetailsResponse.dart';
import 'package:sunstarmovers/responses/navSurveyResponse.dart';

class Survey extends StatefulWidget {
  final int? Id;
  const Survey({super.key, this.Id});

  @override
  State<Survey> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  SurveyDetailsResponse? surveyDetailsResponse;
  NavSurveyResponse? navSurveyResponse;
  AppController appCt = Get.find();
  bool screenLoad = true;
  @override
  void initState() {

    switch (widget.Id) {
      case 1:
        getSurveyDetails();
        break;
      case 2:
        getPendingDetails();
        break;
      case 3:
        getConfirmedDetails();
        break;
      case 4:
        getCanceledDetails();
        break;
      case 5:
        getstartWorkDetails();
        break;
      case 6:
        getCollectionPendingDetails();
        break;
      case 7:
        getClosedDetails();
        break;
    }
    super.initState();
  }

  getClosedDetails() async {
    navSurveyResponse = await SurveyApi().closedDetails();
    setState(() {
      screenLoad = false;
    });
  }

  getCollectionPendingDetails() async {
    navSurveyResponse = await SurveyApi().collectionPendingDetails();
    setState(() {
      screenLoad = false;
    });
  }

  getstartWorkDetails() async {
    navSurveyResponse = await SurveyApi().startWorkDetails();
    setState(() {
      screenLoad = false;
    });
  }

  getCanceledDetails() async {
    navSurveyResponse = await SurveyApi().canceledDetails();
    setState(() {
      screenLoad = false;
    });
  }

  getConfirmedDetails() async {
    navSurveyResponse = await SurveyApi().confirmedDetails();
    setState(() {
      screenLoad = false;
    });
  }

  getPendingDetails() async {
    navSurveyResponse = await SurveyApi().pendingDetails();
    setState(() {
      screenLoad = false;
    });
  }

  getSurveyDetails() async {
    surveyDetailsResponse = await SurveyApi().surevyDetails();
    setState(() {
      screenLoad = false;
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
        title: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "Survey",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: Colors.white),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddSurvey()));
              },
              icon: ImageIcon(
                AssetImage("assets/plus-circle.png"),
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),

      body: screenLoad
          ? Center(
              child: CircularProgressIndicator(
              color: Colors.red,
            ))
          :  ListView(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SearchBarr(
                          title: 'Search for Survey',
                          image: "assets/3864_boolean_operation.png",
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return BottomSheets();
                                });
                          },
                          icon: ImageIcon(
                            AssetImage("assets/3881_frame.png"),
                            size: 35,
                          ))
                    ],
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "All Surveys",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  fontFamily: 'Poppins'),
                            ),
                            SizedBox(
                              width: 90,
                            ),
                            Text(
                              "Show:",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "This Year",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400),
                            ),
                            Image(image: AssetImage("assets/ic_Dropdown.png"))
                          ],
                        ),

                        SizedBox(
                          height: 30,
                        ),

                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: widget.Id == 1 ? surveyDetailsResponse!.data!.length
                                                      : navSurveyResponse!.data!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Row2(
                                    status: widget.Id == 1 ? orderStatusList.firstWhere((element) => element.id == surveyDetailsResponse!.data![index].orderStatus,).value!
                                          : orderStatusList.firstWhere((element) => element.id == navSurveyResponse!.data![index].orderStatus).value!,

                                    color1: widget.Id == 1 ? orderStatusList.firstWhere((element) => element.id == surveyDetailsResponse!.data![index].orderStatus).backgroundColor!
                                          : orderStatusList.firstWhere((element) => element.id == navSurveyResponse!.data![index].orderStatus).backgroundColor!,

                                    color2: widget.Id == 1 ? orderStatusList.firstWhere((element) => element.id == surveyDetailsResponse!.data![index].orderStatus).textColor!
                                          : orderStatusList.firstWhere((element) => element.id == navSurveyResponse!.data![index].orderStatus).textColor!,

                                    name: widget.Id == 1 ? '${surveyDetailsResponse!.data![index].customerName}'
                                                         : navSurveyResponse!.data![index].customerName!,

                                    surveyId: widget.Id == 1 ? surveyDetailsResponse!.data![index].surveyID
                                                             : navSurveyResponse!.data![index].surveyID,

                                    date: widget.Id == 1 ? '${surveyDetailsResponse!.data![index].date}'
                                                         : navSurveyResponse!.data![index].date ?? 'null',

                                    time: widget.Id == 1 ? "${surveyDetailsResponse!.data![index].time}"
                                                         : navSurveyResponse!.data![index].time ?? 'null',

                                    image2: 'assets/calendar.png',
                                    image3: 'assets/clock.png',

                                    percentage: widget.Id == 1 ? '${surveyDetailsResponse!.data![index].leadQuality}'
                                                               : navSurveyResponse!.data![index].leadQuality!,

                                    bgcolor: widget.Id == 1 ? circularProg.firstWhere((element) => element.value == surveyDetailsResponse!.data![index].leadQuality).backgroundColor!
                                                    : circularProg.firstWhere((element) => element.value == navSurveyResponse!.data![index].leadQuality).backgroundColor!,

                                    fgcolor: widget.Id == 1 ? circularProg.firstWhere((element) => element.value == surveyDetailsResponse!.data![index].leadQuality).foregroundColor!
                                                    : circularProg.firstWhere((element) => element.value == navSurveyResponse!.data![index]!.leadQuality).foregroundColor!,

                                    textColor: widget.Id == 1 ? circularProg.firstWhere((element) => element.value == surveyDetailsResponse!.data![index].leadQuality).backgroundColor!
                                                    : circularProg.firstWhere((element) => element.value == navSurveyResponse!.data![index].leadQuality).backgroundColor!,

                                    onTap: () {
                                      // print(
                                      //     '------------------------------- ${ct.surveyDetailsResponse!.data![index].surveyID}');
                                      Get.to(() =>
                                          SurveyDetails(


                                            surveyId: widget.Id == 1 ? surveyDetailsResponse!.data![index].surveyID
                                                : navSurveyResponse!.data![index].surveyID!,
                                          )
                                      )!.then((value) async {
                                        if (value == true) {
                                          print(
                                              '---------------------------------------${widget.Id}');
                                          setState(() {
                                            screenLoad = true;
                                          });
                                          switch (widget.Id) {
                                            case 1:
                                              getSurveyDetails();
                                              break;
                                            case 2:
                                              getPendingDetails();
                                              break;
                                            case 3:
                                              getConfirmedDetails();
                                              break;
                                            case 4:
                                              getCanceledDetails();
                                              break;
                                            case 5:
                                              getstartWorkDetails();
                                              break;
                                            case 6:
                                              getCollectionPendingDetails();
                                              break;
                                            case 7:
                                              getClosedDetails();
                                              break;
                                          }
                                        }
                                      });
                                    }                               // Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                      //
                                      // )
                                    //   .then((value) async {
                                    //     if (value == true) {
                                    //       print('---------------------------------------${value}');
                                    //       setState(() {
                                    //         screenLoad = true;
                                    //       });
                                    //       await getSurveyDetails();
                                    //     }
                                    //   });
                                    // },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  new Divider(
                                    color: Colors.grey.shade300,
                                  ),
                                ],
                              );
                            })

                        //
                        // Row2(status: 'Pending',color1:const Color(0xffFFF6DF) ,color2:const Color(0xffFFB100) ,name: "${appCt.surveyDetailsResponse.data.}", date: "12/12/2023", time: "12:45 PM", image2: 'assets/calendar.png', image3: 'assets/clock.png', percentage: '100%',),
                        //
                        // SizedBox(height: 10,),
                        // new Divider(
                        //   color: Colors.grey.shade300,
                        // ),
                        // SizedBox(height: 10,),
                        //
                        // Row2(status: 'Confirm',color1:const Color(0xffDCFFF1) ,color2:const Color(0xff3DD598) ,name: "James Wan", date: "12/12/2023", time: "12:45 PM", image2: 'assets/calendar.png', image3: 'assets/clock.png', percentage: '75%',),
                        //
                        // SizedBox(height: 10,),
                        // new Divider(
                        //   color: Colors.grey.shade300,
                        // ),
                        // SizedBox(height: 10,),
                        //
                        // Row2(status: 'Closed',color1:const Color(0xffFFEFEF) ,color2:const Color(0xffFC5A5A) ,name: "Peter Parker",  date: "12/12/2023", time: "12:45 PM", image2: 'assets/calendar.png', image3: 'assets/clock.png', percentage: '10%',),
                        //
                        // SizedBox(height: 10,),
                        // new Divider(
                        //   color: Colors.grey.shade300,
                        // ),
                        // SizedBox(height: 10,),
                        //
                        //
                        // Row2(status: 'Start Work',color1:const Color(0xffE8F2FE) ,color2:const Color(0xff157CF0) ,name: "James And", date: "12/12/2023", time: "12:45 PM", image2: 'assets/calendar.png', image3: 'assets/clock.png', percentage: '10%',),
                        //
                        // SizedBox(height: 10,),
                        // new Divider(
                        //   color: Colors.grey.shade300,
                        // ),
                        // SizedBox(height: 10,),
                        //
                        // Row2(status: 'Canceled',color1:const Color(0xffE2FEEA) ,color2:const Color(0xff0B6623) ,name: "Finn Balor",  date: "12/12/2023", time: "12:45 PM", image2: 'assets/calendar.png', image3: 'assets/clock.png', percentage: '10%', ),
                      ],
                    ),
                  )
                ],
              )


      // bottomNavigationBar: BottomNav(),
    );
  }
}

class circularProgress {
  String? value;
  Color? backgroundColor;
  Color? foregroundColor;
  circularProgress({this.value, this.backgroundColor, this.foregroundColor});
}

List<circularProgress> circularProg = [
  circularProgress(
      value: '10%',
      backgroundColor: Color(0xfffFC5A5A),
      foregroundColor: Color(0xfffFFEFEF)),
  circularProgress(
      value: '50%',
      backgroundColor: Color(0xfff157CF0),
      foregroundColor: Color(0xfffE8F2FE)),
  circularProgress(
      value: '75%',
      backgroundColor: Color(0xfffFFB100),
      foregroundColor: Color(0xfffFFF6DF)),
  circularProgress(
    value: '100%',
    foregroundColor: Color(0xfff3DD598),
    backgroundColor: Color(0xfff3DD598),
  ),
];
