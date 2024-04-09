import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/complaint_Api.dart';
import 'package:sunstarmovers/enums/enum.dart';
import 'package:sunstarmovers/pages/BottomSheetCommon.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/Complaint.dart';
import 'package:sunstarmovers/pages/ComplaintAddDetails.dart';
import 'package:sunstarmovers/pages/ComplaintClose.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/SurveyDetails.dart';
import 'package:sunstarmovers/responses/AllComplaintResponse.dart';
import 'package:sunstarmovers/responses/ComplaintResponse.dart';

class ComplaintDetails extends StatefulWidget {
  final int?  complaintId;

  const ComplaintDetails({super.key,this.complaintId});

  @override
  State<ComplaintDetails> createState() => _ComplaintDetailsState();
}

class _ComplaintDetailsState extends State<ComplaintDetails> {
  AllComplaintResponse? allComplaintResponse;
  bool screenLoad = true;

  @override
  void initState() {
    getDetails();
    super.initState();
  }
  @override

  getDetails()async
  {
    allComplaintResponse=await ComplaintApi().allComplaint(compalintId: widget.complaintId);
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
            "Details",
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
                    return BottomShet1(
                      value: false,
                      ComplaintId: widget.complaintId,
                      title: 'Remark',
                      hintName: 'Remark',
                      labelName: 'Remark',
                      buttonName1: 'Done',
                      buttonName2: 'Close',
                    );
                  }
              ).then((value) async
              {
                setState(() {
                  screenLoad=true;
                });
                await getDetails();
              }
              );
            },
            icon: ImageIcon(
              AssetImage('assets/comment.png'),
              color: Colors.white,
            ),
          ),

          IconButton(
            onPressed: () {
              Get.to(()=>ComplaintAddDetails(refNo: allComplaintResponse!.surveyNo.toString(),complaintDetails: allComplaintResponse!.complaintDetails,));
            },
            icon: ImageIcon(
              AssetImage('assets/back.png'),
              color: Colors.white,
            ),
          ),
        ],
      ),

      body: screenLoad
          ? Center(
          child: CircularProgressIndicator(
            color: Colors.red,
          ))
          : Padding(
        padding: const EdgeInsets.all(13.0),
        child: Stack(
          children:[
            ListView(
              children: [
                Text3(name3: 'Customer Details'),
                SizedBox(height: 10,),
                new Divider(color: Colors.grey.shade300,),
                SizedBox(height: 10,),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Image.asset('assets/Group 427318252.png'),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text3(name3: '${allComplaintResponse?.customerName ?? ''}'),
                        CustomerDetail(title: 'Company Name : ', title1: '${allComplaintResponse?.companyName ?? ''}'),
                        CustomerDetail(title: 'Phone : ', title1: '${allComplaintResponse?.customerPhone ?? ''}'),
                        CustomerDetail(title: 'Whatsapp No : ', title1: '${allComplaintResponse?.customerPhone2 ?? ''}'),
                        CustomerDetail(title: 'Salesman : ', title1: '${allComplaintResponse?.staffName ?? ''}'),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10,),
                new Divider(
                  color: Colors.grey.shade300,
                ),

                SizedBox(height: 15,),

                Text3(name3: 'Survey Details'),
                SizedBox(height: 10,),

                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.grey.shade500),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Column(
                    children: [
                      SurveyRow(title3: 'Ref No', title4:'${allComplaintResponse?.surveyNo ?? ''}' ),
                      SurveyRow(title3: 'Date ', title4: '${allComplaintResponse?.date ?? ''}'),
                      SurveyRow(title3: 'Ouoted Price', title4: '${allComplaintResponse?.quotedPrice ?? ''}'),
                      SurveyRow(title3: 'Requirement', title4: '${allComplaintResponse?.requirement ?? ''}'),
                      SurveyRow(title3: 'Closed Date', title4: '${allComplaintResponse?.closedDate ?? ''}'),
                      SurveyRow(title3: 'Place From', title4: '${allComplaintResponse?.placeFrom ?? ''}'),
                      SurveyRow(title3: 'Emirate From', title4: '${allComplaintResponse?.emiratesFrom ?? ''}'),
                      SurveyRow(title3: 'Place To', title4: '${allComplaintResponse?.placeTo ?? ''}'),
                      SurveyRow(title3: 'Emirate To', title4: '${allComplaintResponse?.emiratesTo ?? ''}'),
                      SurveyRow(title3: 'Building Type', title4: '${allComplaintResponse?.buildingTypeName ?? ''}'),
                      SurveyRow(title3: 'Moving type', title4: '${allComplaintResponse?.movingTypeName ?? ''}'),
                      SurveyRow(title3: 'Final Volume', title4: '${allComplaintResponse?.finalVolume ?? ''}'),
                      SurveyRow(title3: 'Final Amount', title4: '${allComplaintResponse?.finalAmount ?? ''}'),
                      SurveyRow(title3: 'Collected box', title4: '${allComplaintResponse?.boxCollected ?? ''}'),

                    ],
                  ),
                ),

                SizedBox(height: 15,),

                Text3(name3: 'Complaint Details'),
                SizedBox(height: 10,),


                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.grey.shade500),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Column(
                    children: [
                      SurveyRow(title3: 'Complaint Date ', title4: '${allComplaintResponse?.complaintDate ?? ''}'),
                      SurveyRow(title3: 'Complaint  ', title4: '${allComplaintResponse?.complaintDetails ?? ''}'),
                      SurveyRow(title3: 'Complaint Status',
                          title4: complaintStatusList.firstWhere((element) => element.id==allComplaintResponse?.complaintStatus).value ??''
                      ),
                      SurveyRow(title3: 'Comment', title4: '${allComplaintResponse?.comment ?? ''}'),
                    ],
                  ),
                ),

                SizedBox(height: 70,),

              ],
            ),
            Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                child: Container(
                  height: 55,
                  color: Colors.white,
                  child:allComplaintResponse!.complaintStatus==ComplaintStatus.Pending.index
                  ? ButtonnElevated(
                    buttonName: 'Close Complaint',
                    onPressed: (){
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context)
                          {
                            return ComplaintClose(complaintID: widget.complaintId,);
                          }
                      );
                    },
                  ):SizedBox(),
                )
            ),
          ]
        ),
      ),

    );
  }
}
