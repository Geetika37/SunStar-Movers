import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/survey_api.dart';
import 'package:sunstarmovers/controller/appController.dart';
import 'package:sunstarmovers/enums/enum.dart';
import 'package:sunstarmovers/pages/AddSurvey.dart';
import 'package:sunstarmovers/pages/BottomSheetCancel.dart';
import 'package:sunstarmovers/pages/BottomSheetCommon.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/HomePage.dart';
import 'package:sunstarmovers/pages/SurveyClosed.dart';
import 'package:sunstarmovers/pages/SurveyConfirm.dart';
import 'package:sunstarmovers/pages/SurveyPendingConfirm.dart';
import 'package:sunstarmovers/pages/SurveyStartwork.dart';
import 'package:sunstarmovers/pages/showDialog.dart';
import 'package:sunstarmovers/pages/showDialog2.dart';

class SurveyDetails extends StatefulWidget {
  final String status;
  final int? surveyId;
  const SurveyDetails({super.key, required this.status,  this.surveyId});

  @override
  State<SurveyDetails> createState() => _SurveyDetailsState();
}

class _SurveyDetailsState extends State<SurveyDetails> {
  AppController appCt=Get.find();
  bool screenLoad =true;
  @override
  void initState() {
    getDetails();
    super.initState();
  }

  getDetails()async
  {
    print('----------------${widget.surveyId}');
    appCt.allSurveyResponse=await SurveyApi().allSurvey(surveyID: widget.surveyId);
    setState(() {
      screenLoad=false;
    });
  }

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
            "Survey",
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
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return showDialog2(
                      onPressed: ()async{
                        var isSuccess=await SurveyApi().deleteSurvey(widget.surveyId);
                        Get.back(result: true);
                        Get.back(result: true);
                        await getDetails();
                      },
                      title: 'Confirm',
                      subtitle: 'Are you sure you want to delete this survey?',
                      button1: 'Yes',
                      button2: 'Cancel',
                    );
                  },
                );
              },
              icon: ImageIcon(
                AssetImage(
                  'assets/Delete.png',
                ),
                color: Colors.white,
              )),

          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context)
                    {
                      return BottomShet1(SurveyId: widget.surveyId,title: 'Add Comment', hintName: 'comment', labelName: 'comment', buttonName1: 'Confirm', buttonName2: 'Cancel',);
                    }
                ).then((value)async
                {
                  if(value==true)
                    {
                      setState(() {
                        screenLoad=true;
                      });
                      await getDetails();
                    }
                });

              },
              icon: ImageIcon(
                AssetImage('assets/comment.png'),
                color: Colors.white,
              )),

          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddSurvey(allSurveyResponse:appCt.allSurveyResponse,))).then((value) async {
                  if(value == true){
                    setState(() {
                      screenLoad = true;
                    });
                   await getDetails();
                  }

                });
              },
              icon: ImageIcon(
                AssetImage('assets/back.png'),
                color: Colors.white,
              )),
        ],
      ),


      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(children: [
          screenLoad? Center(child: CircularProgressIndicator(color: Colors.red,)):GetBuilder<AppController>(
            builder: (ct) {
              return ListView(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Customer Details',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  new Divider(
                    color: Colors.grey.shade300,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image(image: (AssetImage('assets/Group 427318252.png'))),
                      Image.asset('assets/Group 427318252.png'),
                      SizedBox(
                        width: 17,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            
                            '${ct.allSurveyResponse?.customerName??''}',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600),
                          ),
                          CustomerDetail(
                            title: 'Company Name : ',
                            title1: '${ct.allSurveyResponse?.companyName??''}',
                          ),
                          CustomerDetail(
                            title: 'Email : ',
                            title1: '${ct.allSurveyResponse?.emailAddress??''}',
                          ),
                          CustomerDetail(
                            title: 'Phone : ',
                            title1: '+${ct.allSurveyResponse?.customerPhone??''}',
                          ),
                          CustomerDetail(
                            title: 'Whatsapp No : ',
                            title1: '+${ct.allSurveyResponse?.customerPhone2??''}',
                          ),
                          CustomerDetail(
                            title: 'Nationality : ',
                            title1: '${ct.allSurveyResponse?.nationality??''}',
                          ),
                          CustomerDetail(
                            title: 'Salesman : ',
                            title1: '${ct.allSurveyResponse?.name??''}',
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  new Divider(
                    color: Colors.grey.shade300,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Survey Details',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey.shade500),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        SurveyRow(title3: 'Ref No', title4: '${ct.allSurveyResponse?.surveyNo??''}'),
                        ct.allSurveyResponse?.surveyThrough== 0? SizedBox():  SurveyRow(title3: 'Survey Type', title4:surveyTypeList.firstWhere((element) => element.id == ct.allSurveyResponse?.surveyThrough).value! ??'' ),
                        SurveyRow(title3: 'Survey No', title4: '${ct.allSurveyResponse?.folioRefNo??''}'),
                        SurveyRow(
                            title3: 'Total price',
                            title4: '${ct.allSurveyResponse?.totalAmount??''}'),
                        SurveyRow(title3: 'Volume', title4: '${ct.allSurveyResponse?.volume??''}'),
                        SurveyRow(title3: 'Work Duration', title4: '${ct.allSurveyResponse?.workDuration??''}'),
                        SurveyRow(
                            title3: 'Date & Time', title4: '${ct.allSurveyResponse?.date??''} | ${ct.allSurveyResponse?.time??''}'),
                        SurveyRow(title3: 'Order Status', title4: orderStatusList.firstWhere((element) => element.id == ct.allSurveyResponse?.orderStatus).value! ??''),
                        SurveyRow(title3: 'Team Leader', title4: '${ct.allSurveyResponse?.teamLeaderName??''}'),
                        SurveyRow(title3: 'Instructions', title4: '${ct.allSurveyResponse?.requirement??''}'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey.shade500),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        SurveyRow(title3: 'Place From', title4: '${ct.allSurveyResponse?.placeFrom??''}'),
                        SurveyRow(title3: 'Emirate', title4: '${ct.allSurveyResponse?.placeFromEmirates??''}'),
                        SurveyRow(title3: 'Place to', title4: '${ct.allSurveyResponse?.placeTo??''}'),
                        SurveyRow(title3: 'Emirate', title4: '${ct.allSurveyResponse?.placeToEmirates??''}'),
                        SurveyRow(title3: 'Lead quality', title4: '${ct.allSurveyResponse?.leadQuality??''}'),
                        SurveyRow(title3: 'Lead Source', title4: '${ct.allSurveyResponse?.leadSourceName??''}'),
                        SurveyRow(title3: 'Building Type', title4: '${ct.allSurveyResponse?.buildingTypeName??''}'),
                        SurveyRow(title3: 'Moving type', title4: '${ct.allSurveyResponse?.movingTypeName??''}'),
                        SurveyRow(
                            title3: 'Moving date & Time', title4: '${ct.allSurveyResponse?.movingDate??''}'),
                        SurveyRow(title3: 'Confirmed Moving Dates', title4: ''),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey.shade500),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        SurveyRow(
                            title3: 'Agreed Amount', title4: '${ct.allSurveyResponse?.agreedAmount??''}'),
                        SurveyRow(title3: 'Work start date & Time', title4: '${ct.allSurveyResponse?.workStartDate??''} ${ct.allSurveyResponse?.workStartTime??''}'),
                        SurveyRow(title3: 'Final Volume', title4: '${ct.allSurveyResponse?.finalVolume??''}'),
                        SurveyRow(
                            title3: 'Final Amount', title4: '${ct.allSurveyResponse?.finalAmount??''}'),
                        SurveyRow(title3: 'Boxes to be collected', title4: '${ct.allSurveyResponse?.boxToBeCollected??''}'),
                        SurveyRow(title3: 'Payment status', title4: '${ct.allSurveyResponse?.paymentStatus??''}'),
                        SurveyRow(title3: 'Collected box', title4: '${ct.allSurveyResponse?.boxCollected??''}'),
                        SurveyRow(title3: 'Cancel Reason', title4: '${ct.allSurveyResponse?.canceledReason??''}'),
                        SurveyRow(title3: 'Closed Date & Time', title4: '${ct.allSurveyResponse?.closedDate??''} ${ct.allSurveyResponse?.closedTime??''}'),
                      ],
                    ),
                  ),

                  SizedBox(height: 10,),

                  new Divider(
                    color: Colors.grey.shade300,
                  ),

                  SizedBox(height: 5,),

                  Text(
                    'Survey Comments',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey.shade500),
                        borderRadius: BorderRadius.circular(8)),
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                       itemCount: appCt.allSurveyResponse!.comments!.length,
                      itemBuilder: (context,index)
                          {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(appCt.allSurveyResponse!.comments![index].name??'',style: TextStyle(color: Colors.grey),),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.keyboard_control_sharp,size: 10,color: Colors.grey,),
                                      Text(appCt.allSurveyResponse!.comments![index].remark?? ''),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),
                              ],
                            );
                          }
                    )
                  ),


                  SizedBox(height: 100,),

                ],
              );
            }
          ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              height: 70,
              color: Colors.white,
              child: widget.status == 'Pending'? Row(
                children: [
                  Expanded(
                    child: ButtonnElevated(
                      buttonName: 'Confirm',
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context)
                            {
                              return SurveyPendingConfirm(SurveyID: widget.surveyId,);
                            }
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(child: ButtonnOutlined(title: 'Cancel',onPressed: (){
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext conrext)
                        {
                          return BottomSheetCancel(surveyID: widget.surveyId,title: 'Cancel Survey', hintName: 'Reason for cancelation', labelName: 'Reason for cancelation', buttonName1: 'Done', buttonName2: 'Close');
                        }
                    );
                  },))
                ],
              ):
              widget.status== 'Confirm'? ButtonnElevated(buttonName: 'Start Work',onPressed: (){
                      showModalBottomSheet(context: context, builder: (BuildContext context)
                            {
                              return SurveyConfirm();
                            }
                      );
                },):
              widget.status=='Closed' ? ButtonnElevated(buttonName: 'Collect',onPressed: (){
                      showModalBottomSheet(context: context, builder: (BuildContext context)
                            {
                              return SurveyClosed();
                            }
                      );
              },):
                  widget.status == 'StartWork' ? ButtonnElevated(buttonName: 'Complete work',onPressed: (){
                    showModalBottomSheet(context: context,isScrollControlled: true, builder: (BuildContext context)
                      {
                        return SurveyStartWork();
                      }
                    );
                  },):
                      SizedBox()
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: Image.asset('assets/whatspp.png'),
      ),
    );
  }
}

class CustomerDetail extends StatelessWidget {
  final String title;
  final String title1;
  const CustomerDetail({super.key, required this.title, required this.title1});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w400, fontFamily: 'Poppins', fontSize: 14),
        ),
        Text(
          title1,
          style: TextStyle(
              fontWeight: FontWeight.w400, fontFamily: 'Poppins', fontSize: 14),
        )
      ],
    );
  }
}

class SurveyRow extends StatelessWidget {
  final String title3;
  final String title4;
  const SurveyRow({super.key, required this.title3, required this.title4});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title3,
          style: TextStyle(
              fontWeight: FontWeight.w500, fontFamily: 'Poppins', fontSize: 14),
        ),
        Text(
          title4,
          style: TextStyle(
              fontWeight: FontWeight.w500, fontFamily: 'Poppins', fontSize: 14),
        )
      ],
    );
  }
}
