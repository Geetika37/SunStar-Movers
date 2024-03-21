import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/survey_api.dart';
import 'package:sunstarmovers/controller/appController.dart';
import 'package:sunstarmovers/enums/enum.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/SurveyPendingConfirm.dart';
import 'package:sunstarmovers/pages/TextField1.dart';
import 'package:sunstarmovers/pages/showDialog.dart';

class AddSurvey extends StatefulWidget {
  const AddSurvey({super.key});

  @override
  State<AddSurvey> createState() => _AddSurveyState();
}

class _AddSurveyState extends State<AddSurvey> {
  TextEditingController _orderNumberController = TextEditingController();
  TextEditingController _date1Controller = TextEditingController();
  TextEditingController _date2Controller = TextEditingController();
  TextEditingController _ISD1Controller=TextEditingController();
  TextEditingController _ISD2Controller=TextEditingController();
  TextEditingController _PhoneNumber1Controller=TextEditingController();
  TextEditingController _PhoneNumber2Controller=TextEditingController();
  AppController appCt = Get.find();
  Idvalue ? selectedDropDown;
  bool? isChecked=false;

  @override
  void initState() {
    getOrderNumber();
    getBuildingType();
    getMovingType();
    getEmirate();
    getLeadSource();
    super.initState();
  }

  getOrderNumber() async {
    appCt.orderNumberResponse = await SurveyApi().orderNumber();
    _orderNumberController.text = appCt.orderNumberResponse?.orderNo?.toString() ?? '';
  }

  getBuildingType()async
  {
    appCt.buildingTypeResponse=await SurveyApi().buildingType();
  }

  getMovingType()async
  {
    appCt.movingTypeResponse=await SurveyApi().movingType();
  }

  getEmirate()async
  {
    appCt.emiratesResponse=await SurveyApi().emirate();
  }

  getLeadSource()async
  {
    appCt.leadSourceResponse=await SurveyApi().leadSource();
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
            "Add Survey",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField1(
                isKey: true,
                hintName: 'Survey No',
                labelText: 'Survey No',
                controller: _orderNumberController,
              ),
              SizedBox(height: 10),
              AppDropdownInput<Idvalue>(
                value: selectedDropDown,
                hintText: "Survey Type",
                options: surveyTypeList!,
                getLabel: (Idvalue val){
                  return val.value!;
                  },
              ),
              // Dropdown(hintText: 'SurveyType',),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: TextField1(
                      controller: _date1Controller,
                    isKey: true,
                    hintName: 'Date',
                    labelText: 'Date',
                    image1: 'assets/Group 33192.png',
                    onTap: () {
                      _selectDate();
                    },
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Dropdown(hintText: 'Time'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextField1(hintName: 'Customer Name', labelText: 'Customer Name'),
              SizedBox(height: 10),

              Row(
                children: [
                  SizedBox(
                    width: 95,
                    child: TextField1(hintName: 'ISD', labelText: 'ISD',controller: _ISD1Controller,keyBoardType: TextInputType.number,
                    bottom: 0,
                      left: 0,
                    ),
                  ),

                  Expanded(
                      child: TextField1(
                          top: 0,
                          right: 0,
                          hintName: 'Customer Phone', labelText: 'Customer Phone',controller: _PhoneNumber1Controller,keyBoardType: TextInputType.number,),
                  )
                ],
              ),


              Row(
                children: [
                  Checkbox(
                      value: isChecked,
                      onChanged: (newBool)
                        {
                          setState(() {
                            isChecked=newBool;
                            _PhoneNumber2Controller=_PhoneNumber1Controller;
                          });
                        }
                  ),
                  Text('Same as phone number',style: TextStyle(color: Colors.black.withOpacity(0.5),fontFamily: 'Poppins'),),
                ],
              ),

              Row(
                children: [
                  SizedBox(
                    width: 95,

                    child: TextField1(hintName: 'ISD', labelText: 'ISD',controller: _ISD2Controller,keyBoardType: TextInputType.number,
                      bottom: 0,
                      left: 0,
                    ),
                  ),

                  Expanded(
                    child: TextField1(
                        top: 0,
                        right: 0,
                        hintName: 'Customer Phone', labelText: 'Customer Whatsapp No',controller: _PhoneNumber2Controller,
                        keyBoardType: TextInputType.number,
                    ),
                  )
                ],
              ),

              SizedBox(
                height: 10,
              ),
              TextField1(hintName: 'Email Address', labelText: 'Email Address'),
              SizedBox(
                height: 10,
              ),
              TextField1(hintName: 'Company Name', labelText: 'Company Name'),
              SizedBox(
                height: 10,
              ),

              TextField1(hintName: 'Nationality', labelText: 'Nationality'),
              SizedBox(
                height: 10,
              ),

              AppDropdownInput(
                  hintText: 'Building Type',
                  // value: selectedDropDown1,
                  options: appCt.buildingTypeResponse!,
                getLabel: (val){
                    return val.value!;
                },
              ),

              SizedBox(
                height: 10,
              ),


              AppDropdownInput(
                  hintText: 'Moving Type',
                  options: appCt.movingTypeResponse!,
                getLabel: (val)
                {
                  return val.value!;
                },
              ),
              SizedBox(
                height: 10,
              ),

              TextField1(hintName: 'Volume', labelText: 'Volume'),
              SizedBox(
                height: 10,
              ),

              TextField1(hintName: 'Work Duration', labelText: 'Work Duration'),
              SizedBox(
                height: 10,
              ),

              TextField1(hintName: 'Place From',labelText: 'Place From'),
              SizedBox(
                height: 10,
              ),

              AppDropdownInput(
                hintText: 'Emirate',
                options: appCt.emiratesResponse!,
                getLabel: (val)
                {
                  return val.value!;
                },
              ),
              SizedBox(
                height: 10,
              ),

              TextField1(hintName: 'Place To', labelText: 'Place To',),
              SizedBox(
                height: 10,
              ),

              AppDropdownInput(
                hintText: 'Emirate',
                options: appCt.emiratesResponse!,
                getLabel: (val)
                {
                  return val.value!;
                },
              ),
              SizedBox(
                height: 10,
              ),

              TextField1(hintName: 'Quoted Price', labelText: 'Quoted Price'),
              SizedBox(
                height: 10,
              ),
              AppDropdownInput(
                  hintText: 'Lead Source',
                  options: appCt.leadSourceResponse!,
                getLabel: (val)
                {
                  return val.value!;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField1(
                controller: _date2Controller,
                  hintName: 'Moving Date',
                  isKey: true,
                  labelText: 'Moving Date',
                  image1: 'assets/Group 33192.png',
                  onTap: () {
                    _select1Date();
                  }
              ),
              SizedBox(
                height: 10,
              ),
              AppDropdownInput<String>(
                // value: selectedDropDown,
                hintText: "Lead Quality",
                options: leadQualityList,
                getLabel: (String val){
                  return val;
                },
              ),
              SizedBox(
                height: 10,
              ),

              Textformfield(hintName: 'Instructions', labelText: 'Instructions'),

              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: SizedBox(
                    height: 50,
                    child: ButtonnElevated(
                      onPressed: () {

                        var data={
                          "surveyID": 0,
                          "surveyNo": 0,
                          "customerID": 0,
                          "staffEntityID": 0,
                          "date": _selectDate(),
                          "time": "string",
                          "requirement": "string",
                          "folioRefNo": "string",
                          "placeFrom": "string",
                          "placeTo": "string",
                          "emirateIDFrom": 0,
                          "emirateIDTo": 0,
                          "quotedPrice": 0,
                          "totalQuotedPrice": 0,
                          "orderStatus": 0,
                          "movingDate": "2024-03-21T04:25:24.372Z",
                          "closedDate": "2024-03-21T04:25:24.372Z",
                          "finalAmount": 0,
                          "paymentStatus": 0,
                          "canceledReason": "string",
                          "leadQuality": "string",
                          "leadSourceID": 0,
                          "customerName": "string",
                          "customerPhone": "string",
                          "companyName": "string",
                          "leadSourseName": "string",
                          "remark": "string",
                          "remarkID": 0,
                          "emailAddress": "string",
                          "volume": "string",
                          "buildingTypeID": 0,
                          "buildingTypeName": "string",
                          "movingTypeID": 0,
                          "movingTypeName": "string",
                          "branchID": 0,
                          "agreedAmount": 0,
                          "pricingInstruction": "string",
                          "teamLeaderID": 0,
                          "finalVolume": "string",
                          "boxToBeCollected": 0,
                          "collectedDateTime": "2024-03-21T04:25:24.372Z",
                          "boxCollected": 0,
                          "workStartDate": "2024-03-21T04:25:24.372Z",
                          "placeFromEmirates": "string",
                          "placeToEmirates": "string",
                          "phoneCountryID": "string",
                          "phone2CountryID": "string",
                          "customerPhone2": "string",
                          "isdCode": "string",
                          "isdCode2": "string",
                          "isSameContact": true,
                          "designation": "string",
                          "address": "string",
                          "workDuration": "string",
                          "workDurationCurrent": "string",
                          "confirmWorkDuration": 0,
                          "confirmStartTime": "string",
                          "taxCategoryID": 0,
                          "percentage": 0,
                          "totalAmount": 0,
                          "surveyThrough": 0,
                          "receiptJournalMasterID": 0,
                          "nationality": "string"
                        };
                        SurveyApi().SurveyAdd(data);

                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return showDialog1(
                                title: 'Survey Added',
                                subtitle:
                                    'This Survey has been added successfully',
                                image: 'assets/Group 427318220.png',
                                buttonText1: 'Close',
                              );
                            });
                      },
                      buttonName: 'Save',
                    ),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: SizedBox(
                    height: 50,
                    child: ButtonnOutlined(title: 'Cancel', onPressed: () {}),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked=await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100)
    );
    if(_picked!=null)
      {
        setState(() {
          _date1Controller.text=_picked.toString().split(" ")[0];

        });
      }
  }

  Future<void> _select1Date() async {
    DateTime? _picked1=await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100)
    );
    if(_picked1!=null)
    {
      setState(() {
        _date2Controller.text=_picked1.toString().split(" ")[0];

      });
    }
  }
}

class Idvalue
{
  int? id;
  String? value;
  Idvalue({this.id,this.value});
}

List<Idvalue> surveyTypeList =[
  Idvalue(id: SurveyThrough.PhysicalSurvey.index,value: SurveyThrough.PhysicalSurvey.name),
  Idvalue(id: SurveyThrough.TelephonicSurvey.index,value: SurveyThrough.TelephonicSurvey.name)
];

List<String> leadQualityList=[
  "10%","50%",'75%',"100%"
];