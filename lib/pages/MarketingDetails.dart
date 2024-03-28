import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/marketing_api.dart';
import 'package:sunstarmovers/controller/appController.dart';
import 'package:sunstarmovers/pages/BottomSheetCommon.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/SurveyDetails.dart';

class MarketingDetails extends StatefulWidget {
  final int? MarketingId;
  const MarketingDetails({super.key, this.MarketingId});

  @override
  State<MarketingDetails> createState() => _MarketingDetailsState();
}

class _MarketingDetailsState extends State<MarketingDetails> {
  AppController appCt=Get.find();
  bool screenLoad=true;

  @override

  void initState() {
    getDetails();
    super.initState();
  }

  getDetails()async
  {
    print('------------${widget.MarketingId}');
    appCt.allMarketingDetailResponse=await MarketingApi().allMarketing(marketingId: widget.MarketingId);
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
                      return BottomShet1(title: 'Activity Remark', hintName: 'Feedback', labelName: 'Feedback', buttonName1: 'Done', buttonName2: 'Close',);
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
                Navigator.pop(context);
              },
              icon: ImageIcon(
                AssetImage('assets/back.png'),
                color: Colors.white,
              ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Stack(
          children:[
            screenLoad? Center(child: CircularProgressIndicator(color: Colors.red,)):GetBuilder<AppController>(
              builder: (ct) {
                return ListView(
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
                            Text3(name3: '${ct.allMarketingDetailResponse?.customerName??''}'),
                            CustomerDetail(title: 'Designation : ', title1: '${ct.allMarketingDetailResponse?.designation??''}'),
                            CustomerDetail(title: 'Company Name : ', title1: '${ct.allMarketingDetailResponse?.companyName??''}'),
                            CustomerDetail(title: 'Email : ', title1: '${ct.allMarketingDetailResponse?.emailAddress??''}'),
                            CustomerDetail(title: 'Phone : ', title1: '${ct.allMarketingDetailResponse?.customerPhone??''}'),
                            CustomerDetail(title: 'Whatsapp No : ', title1: '${ct.allMarketingDetailResponse?.customerPhone2??''}'),
                            CustomerDetail(title: 'Nationality : ', title1: '${ct.allMarketingDetailResponse?.nationality??''}'),
                            CustomerDetail(title: 'Salesman : ', title1: '${ct.allMarketingDetailResponse?.name??''}'),
                            CustomerDetail(title: 'Address : ', title1: '${ct.allMarketingDetailResponse?.address??''}'),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    new Divider(
                      color: Colors.grey.shade300,
                    ),

                    SizedBox(height: 15,),

                    Text('Marketing Details',style: TextStyle(fontSize: 20,fontFamily: 'Poppins',fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),

                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1,color: Colors.grey.shade500),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Column(
                        children: [
                          SurveyRow(title3: 'Ref No', title4: '${ct.allMarketingDetailResponse?.marketingNo??''}'),
                          SurveyRow(title3: 'Date & Time', title4: '${ct.allMarketingDetailResponse?.date??''}|${ct.allMarketingDetailResponse?.time??''}'),
                          SurveyRow(title3: 'Activity', title4: '${ct.allMarketingDetailResponse?.marketingTypeName??''}'),
                          SurveyRow(title3: 'Activity Details', title4: '${ct.allMarketingDetailResponse?.activityDetails??''}'),
                        ],
                      ),
                    )

                  ],
                );
              }
            ),
            Positioned(
              left: 0,
                bottom: 0,
                right: 0,
                child: Container(
                  height: 55,
                  color: Colors.white,
                  child: ButtonnElevated(
                      buttonName: 'Delete',
                    onPressed: ()async{
                        var isSuccess=await MarketingApi().deleteMarketing(widget.MarketingId);
                        Get.back(result: true);
                        await getDetails();
                    },
                  ),
                ),
            ),

          ]
        ),
      ),
    );
  }
}
