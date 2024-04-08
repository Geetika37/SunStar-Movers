import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/complaint_Api.dart';
import 'package:sunstarmovers/Apis/survey_api.dart';
import 'package:sunstarmovers/controller/appController.dart';
import 'package:sunstarmovers/pages/BottomSheetCommon.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/Complaint.dart';
import 'package:sunstarmovers/pages/HomePage.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/SurveyDetails.dart';
import 'package:sunstarmovers/pages/SurveyPendingConfirm.dart';
import 'package:sunstarmovers/pages/SurveyStartwork.dart';
import 'package:sunstarmovers/pages/TextField1.dart';
import 'package:sunstarmovers/pages/showDialog.dart';
import 'package:sunstarmovers/responses/AllComplaintResponse.dart';
import 'package:sunstarmovers/responses/ComplaintAddDetailResponse.dart';

class ComplaintAddDetails extends StatefulWidget {
  final String? refNo;
  final String? complaintDetails;
  final ComplaintAddDetailResponse? complaintAddDetailResponse;
  const ComplaintAddDetails({super.key, this.refNo, this.complaintAddDetailResponse, this.complaintDetails,   });

  @override
  State<ComplaintAddDetails> createState() => _ComplaintAddDetailsState();
}

class _ComplaintAddDetailsState extends State<ComplaintAddDetails> {
  ComplaintAddDetailResponse? complaintAddDetailResponse;
  TextEditingController _complaintController = TextEditingController();
  TextEditingController _refController = TextEditingController();
  bool screenLoad = true;

  @override
  void initState() {
    _refController.text = widget.refNo ?? '';
    _complaintController.text=widget.complaintDetails!;
    getComplaintAddDetail();
    super.initState();
  }

  @override
  getComplaintAddDetail() async {
    complaintAddDetailResponse =
        await ComplaintApi().complaintAddDetail(widget.refNo!);
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
            "Add Complaint",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: Colors.white),
          ),
        ),
      ),
      body: screenLoad
          ? Center(
              child: CircularProgressIndicator(
              color: Colors.red,
            ))
          : Padding(
              padding: const EdgeInsets.all(13.0),
              child: Stack(children: [
                ListView(
                  children: [
                    TextField1(
                      hintName: 'Ref No',
                      labelText: 'Ref No',
                      controller: _refController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Textformfield(
                      hintName: 'complaint',
                      labelText: 'complaint',
                      controller: _complaintController,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text3(name3: 'Customer Details'),
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
                        SizedBox(
                          height: 10,
                        ),
                        Image.asset('assets/Group 427318252.png'),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text3(
                                name3:
                                    complaintAddDetailResponse!.customerName ??
                                        ''),
                            CustomerDetail(
                                title: 'Company Name : ',
                                title1:
                                    complaintAddDetailResponse!.companyName ??
                                        ''),
                            CustomerDetail(
                                title: 'Email : ',
                                title1:
                                    complaintAddDetailResponse?.emailAddress ??
                                        ''),
                            CustomerDetail(
                                title: 'Phone : ',
                                title1:
                                    complaintAddDetailResponse?.customerPhone ??
                                        ''),
                            CustomerDetail(
                                title: 'Whatsapp No : ',
                                title1: complaintAddDetailResponse
                                        ?.customerPhone2 ??
                                    ''),
                            CustomerDetail(
                                title: 'Salesman : ',
                                title1:
                                    '${complaintAddDetailResponse?.staffName ?? ''}'),
                          ],
                        )
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
                    Text3(name3: 'Survey Details'),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Colors.grey.shade500),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          SurveyRow(
                              title3: 'Survey No',
                              title4:
                                  '${complaintAddDetailResponse?.surveyNo ?? ''}'),
                          SurveyRow(
                              title3: 'Total Price ',
                              title4:
                                  '${complaintAddDetailResponse!.totalAmount ?? ''}'),
                          SurveyRow(
                              title3: 'Volume',
                              title4:
                                  '${complaintAddDetailResponse!.volume ?? ''}'),
                          SurveyRow(
                              title3: 'Work Duration',
                              title4:
                                  '${complaintAddDetailResponse!.workDuration ?? ''}'),
                          SurveyRow(
                              title3: 'Date & Time',
                              title4:
                                  '${complaintAddDetailResponse!.date ?? ''}||${complaintAddDetailResponse!.time ?? ''}'),
                          complaintAddDetailResponse?.orderStatus == 0
                              ? SizedBox()
                              : SurveyRow(
                                  title3: 'Order Status',
                                  title4: orderStatusList
                                          .firstWhere((element) =>
                                              element.id ==
                                              complaintAddDetailResponse
                                                  ?.orderStatus)
                                          .value ??
                                      ''),
                          SurveyRow(
                              title3: 'Team Leader',
                              title4:
                                  '${complaintAddDetailResponse!.teamLeaderName ?? ''}'),
                          SurveyRow(
                              title3: 'Instructions',
                              title4:
                                  '${complaintAddDetailResponse!.requirement ?? ''}'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Colors.grey.shade500),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          SurveyRow(
                              title3: 'Place From',
                              title4:
                                  '${complaintAddDetailResponse?.placeFrom ?? ''}'),
                          SurveyRow(
                              title3: 'Emirate ',
                              title4:
                                  '${complaintAddDetailResponse?.emiratesFrom ?? ''}'),
                          SurveyRow(
                              title3: 'Place To',
                              title4:
                                  '${complaintAddDetailResponse?.placeTo ?? ''}'),
                          SurveyRow(
                              title3: 'Emirate',
                              title4:
                                  '${complaintAddDetailResponse?.emiratesTo ?? ''}'),
                          SurveyRow(
                              title3: 'Lead Quality',
                              title4:
                                  '${complaintAddDetailResponse?.leadQuality ?? ''}'),
                          SurveyRow(
                              title3: 'Lead Source',
                              title4:
                                  '${complaintAddDetailResponse?.leadSourceName ?? ''}'),
                          SurveyRow(
                              title3: 'Building Type',
                              title4:
                                  '${complaintAddDetailResponse?.buildingTypeName ?? ''}'),
                          SurveyRow(
                              title3: 'Moving Type',
                              title4:
                                  '${complaintAddDetailResponse?.movingTypeName ?? ''}'),
                          SurveyRow(
                              title3: 'Moving date & Time',
                              title4:
                                  '${complaintAddDetailResponse?.movingDate ?? ''}'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Colors.grey.shade500),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          SurveyRow(
                              title3: 'Agreed Amount',
                              title4:
                                  '${complaintAddDetailResponse?.agreedAmount ?? ''}'),
                          SurveyRow(
                              title3: 'Work start date',
                              title4:
                                  '${complaintAddDetailResponse?.workStartDate ?? ''}'),
                          SurveyRow(
                              title3: 'Final Volume',
                              title4:
                                  '${complaintAddDetailResponse?.finalVolume ?? ''}'),
                          SurveyRow(
                              title3: 'Final Amount',
                              title4:
                                  '${complaintAddDetailResponse?.finalAmount ?? ''}'),
                          SurveyRow(
                              title3: 'Boxes to be collected',
                              title4:
                                  '${complaintAddDetailResponse?.boxToBeCollected ?? ''}'),
                          complaintAddDetailResponse?.paymentStatus == 0
                              ? SizedBox()
                              : SurveyRow(
                                  title3: 'Payment Status',
                                  title4: paymentStatusList
                                          .firstWhere((element) =>
                                              element.id ==
                                              complaintAddDetailResponse
                                                  ?.paymentStatus)
                                          .value ??
                                      ''),
                          SurveyRow(
                              title3: 'Collected box ',
                              title4:
                                  '${complaintAddDetailResponse?.boxCollected ?? ''}'),
                          SurveyRow(
                              title3: 'Closed Date',
                              title4:
                                  '${complaintAddDetailResponse?.closedDate ?? ''}'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                  ],
                ),
                Positioned(
                    left: 0,
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 55,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(
                            child: ButtonnElevated(
                              buttonName: 'Save',
                              onPressed: () async {
                                var data = {
                                  "surveyID":
                                      complaintAddDetailResponse!.surveyID,
                                  "surveyNo":
                                      complaintAddDetailResponse!.surveyNo,
                                  "date": complaintAddDetailResponse!.date,
                                  "requirement":
                                      complaintAddDetailResponse!.requirement,
                                  "placeFrom":
                                      complaintAddDetailResponse!.placeFrom,
                                  "placeTo":
                                      complaintAddDetailResponse!.placeTo,
                                  "emiratesFrom":
                                      complaintAddDetailResponse!.emiratesFrom,
                                  "emiratesTo":
                                      complaintAddDetailResponse!.emiratesTo,
                                  "quotedPrice":
                                      complaintAddDetailResponse!.quotedPrice,
                                  "closedDate":
                                      complaintAddDetailResponse!.closedDate,
                                  "customerName":
                                      complaintAddDetailResponse!.customerName,
                                  "customerPhone":
                                      complaintAddDetailResponse!.customerPhone,
                                  "companyName":
                                      complaintAddDetailResponse!.companyName,
                                  "emailAddress":
                                      complaintAddDetailResponse!.emailAddress,
                                  "buildingTypeName":
                                      complaintAddDetailResponse!
                                          .buildingTypeName,
                                  "movingTypeName": complaintAddDetailResponse!
                                      .movingTypeName,
                                  "staffName":
                                      complaintAddDetailResponse!.staffName,
                                  "agreedAmount":
                                      complaintAddDetailResponse!.agreedAmount,
                                  "boxToBeCollected":
                                      complaintAddDetailResponse!
                                          .boxToBeCollected,
                                  "collectedDateTime":
                                      complaintAddDetailResponse!
                                          .collectedDateTime,
                                  "boxCollected":
                                      complaintAddDetailResponse!.boxCollected,
                                  "customerPhone2": complaintAddDetailResponse!
                                      .customerPhone2,
                                  "designation":
                                      complaintAddDetailResponse!.designation,
                                  "phoneCountryID": complaintAddDetailResponse!
                                      .phoneCountryID,
                                  "phone2CountryID": complaintAddDetailResponse!
                                      .phone2CountryID,
                                  "finalAmount":
                                      complaintAddDetailResponse!.finalAmount,
                                  "complaintID":
                                      complaintAddDetailResponse!.complaintID,
                                  "complaintDetails": _complaintController.text,
                                  "complaintStatus": complaintAddDetailResponse!
                                      .complaintStatus,
                                  "complaintDate":
                                      complaintAddDetailResponse!.complaintDate,
                                  "complaintCloseDate":
                                      complaintAddDetailResponse!
                                          .complaintCloseDate,
                                  "complaintCloseDetails":
                                      complaintAddDetailResponse!
                                          .complaintCloseDetails,
                                  "totalQuotedPrice":
                                      complaintAddDetailResponse!
                                          .totalQuotedPrice,
                                  "volume": complaintAddDetailResponse!.volume,
                                  "time": complaintAddDetailResponse!.time,
                                  "orderStatus":
                                      complaintAddDetailResponse!.orderStatus,
                                  "workDuration":
                                      complaintAddDetailResponse!.workDuration,
                                  "addedBy":
                                      complaintAddDetailResponse!.addedBy,
                                  "userName":
                                      complaintAddDetailResponse!.userName,
                                  "finalVolume":
                                      complaintAddDetailResponse!.finalVolume,
                                  "leadQuality":
                                      complaintAddDetailResponse!.leadQuality,
                                  "leadSourceName": complaintAddDetailResponse!
                                      .leadSourceName,
                                  "isSurveyNo":
                                      complaintAddDetailResponse!.isSurveyNo,
                                  "movingDate":
                                      complaintAddDetailResponse!.movingDate,
                                  "movingTime":
                                      complaintAddDetailResponse!.movingTime,
                                  "pricingInstruction":
                                      complaintAddDetailResponse!
                                          .pricingInstruction,
                                  "workStartDate":
                                      complaintAddDetailResponse!.workStartDate,
                                  "teamLeaderName": complaintAddDetailResponse!
                                      .teamLeaderName,
                                  "taxCategoryID":
                                      complaintAddDetailResponse!.taxCategoryID,
                                  "paymentStatus":
                                      complaintAddDetailResponse!.paymentStatus,
                                  "percentage":
                                      complaintAddDetailResponse!.percentage,
                                  "totalAmount":
                                      complaintAddDetailResponse!.totalAmount,
                                  "discountAmount": complaintAddDetailResponse!
                                      .discountAmount,
                                  "discount":
                                      complaintAddDetailResponse!.discount,
                                  "totalFinalAmount":
                                      complaintAddDetailResponse!
                                          .totalFinalAmount,
                                  "vat": complaintAddDetailResponse!.vat,
                                  "nationality":
                                      complaintAddDetailResponse!.nationality,
                                  "comment": complaintAddDetailResponse!.comment
                                };
                                var isSuccess =
                                    await ComplaintApi().ComplaintAdd(data);

                                if (isSuccess) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return showDialog1(
                                          title: 'Complaint Added',
                                          subtitle:
                                              'The complaint has been added successfully',
                                          image: 'assets/Group 427318220.png',
                                          buttonText1: 'Close',
                                          onTap: () {
                                            Get.back(result: true);
                                            Get.back(result: true);
                                            Get.back(result: true);
                                          },
                                        );
                                      });
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: ButtonnOutlined(
                            title: 'Cancel',
                            onPressed: () {},
                          ))
                        ],
                      ),
                    )),
              ]),
            ),
    );
    ;
  }
}
