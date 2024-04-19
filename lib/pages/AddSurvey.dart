import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:sunstarmovers/Apis/survey_api.dart';
import 'package:sunstarmovers/controller/appController.dart';
import 'package:sunstarmovers/enums/enum.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/Survey.dart';
import 'package:sunstarmovers/pages/SurveyPendingConfirm.dart';
import 'package:sunstarmovers/pages/TextField1.dart';
import 'package:sunstarmovers/pages/container2.dart';
import 'package:sunstarmovers/pages/showDialog.dart';
import 'package:sunstarmovers/responses/AllSurveyResponse.dart';
import 'package:sunstarmovers/responses/BuildingTypeResponse.dart';
import 'package:sunstarmovers/responses/EmirateResponse.dart';
import 'package:sunstarmovers/responses/LeadSourceResponse.dart';
import 'package:sunstarmovers/responses/MovingTypeResponse.dart';

class AddSurvey extends StatefulWidget {
  final AllSurveyResponse? allSurveyResponse;
  const AddSurvey({super.key, this.allSurveyResponse});

  @override
  State<AddSurvey> createState() => _AddSurveyState();
}

class _AddSurveyState extends State<AddSurvey> {
  TextEditingController _orderNumberController = TextEditingController();
  TextEditingController _date1Controller = TextEditingController();
  TextEditingController _date2Controller = TextEditingController();
  TextEditingController _ISD1Controller = TextEditingController();
  TextEditingController _ISD2Controller = TextEditingController();
  TextEditingController _phoneNumber1Controller = TextEditingController();
  TextEditingController _phoneNumber2Controller = TextEditingController();
  TextEditingController _customerNameController = TextEditingController();
  TextEditingController _emailAddressController = TextEditingController();
  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _nationalityController = TextEditingController();
  TextEditingController _volumeController = TextEditingController();
  TextEditingController _workDurationController = TextEditingController();
  TextEditingController _placeFromController = TextEditingController();
  TextEditingController _placeToController = TextEditingController();
  TextEditingController _quotedPriceController = TextEditingController();
  TextEditingController _instructionController = TextEditingController();
  TextEditingController _surveyNoController = TextEditingController();
  AppController appCt = Get.find();
  IdValue? _surveyTypeDropdown;
  String? _time;
  BuildingTypeResponse? _buildingType;
  MovingTypeResponse? _movingType;
  EmiratesResponse? _emirate;
  EmiratesResponse? _emirate1;
  LeadSourceResponse? _leadSource;
  String? _leadQuality;
  DateTime? _picked;
  DateTime? _picked1;
  bool? isChecked = false;
  bool screenLoad=true;
  bool orderNumberLoad=true;
  bool buildingTypeLoad=true;
  bool movingTypeLoad=true;
  bool emirateLoad=true;
  bool leadSourceLoad=true;

  bool isValidPhoneNumber(String value) {
    // Regular expression to match a valid phone number pattern
    // This regex pattern allows exactly 10 digits
    final RegExp phoneRegex = RegExp(r'^[0-9]{10}$');
    return phoneRegex.hasMatch(value);
  }

  @override
  void initState() {
    if (widget.allSurveyResponse != null) {
      _orderNumberController.text = '${widget.allSurveyResponse?.surveyNo}';
      _surveyTypeDropdown = surveyTypeList.firstWhere(
          (element) => element.id == widget.allSurveyResponse?.orderStatus);
      _surveyNoController.text = '${widget.allSurveyResponse?.folioRefNo}';
      if (widget.allSurveyResponse?.date != null) {
        _date1Controller.text = '${widget.allSurveyResponse?.date}';
        _picked = DateTime.parse(widget.allSurveyResponse!.date!);
      }
      _time = '${widget.allSurveyResponse?.time}';
      _customerNameController.text = '${widget.allSurveyResponse?.customerName}';
      _ISD1Controller.text = '${widget.allSurveyResponse?.isdCode ?? ''}';
      _phoneNumber1Controller.text =
          '${widget.allSurveyResponse?.customerPhone}';
      _ISD2Controller.text = '${widget.allSurveyResponse?.isdCode2 ?? ''}';
      _phoneNumber2Controller.text =
          '${widget.allSurveyResponse?.customerPhone2}';
      _emailAddressController.text = '${widget.allSurveyResponse?.emailAddress}';
      _companyNameController.text = '${widget.allSurveyResponse?.companyName}';
      _nationalityController.text = '${widget.allSurveyResponse?.nationality}';
      _volumeController.text = '${widget.allSurveyResponse?.volume}';
      _workDurationController.text = '${widget.allSurveyResponse?.workDuration}';
      _placeFromController.text = '${widget.allSurveyResponse?.placeFrom}';
      _placeToController.text = '${widget.allSurveyResponse?.placeTo}';
      _quotedPriceController.text = '${widget.allSurveyResponse?.quotedPrice}';
      if(widget.allSurveyResponse?.movingDate!=null)
        {
          _date2Controller.text = '${widget.allSurveyResponse?.movingDate}';
          _picked1=DateTime.parse(widget.allSurveyResponse!.movingDate!);
        }
      _leadQuality = '${widget.allSurveyResponse?.leadQuality}';
      _instructionController.text = '${widget.allSurveyResponse?.requirement}';

    }

    
    
    getOrderNumber();
    getBuildingType();
    getMovingType();
    getEmirate();
    getLeadSource();
    super.initState();
  }

  getOrderNumber() async {
    appCt.orderNumberResponse = await SurveyApi().orderNumber();
    if (widget.allSurveyResponse == null) {
      _orderNumberController.text =
          appCt.orderNumberResponse?.orderNo?.toString() ?? '';
    }
    setState(() {
      orderNumberLoad=false;
    });
  }

  getBuildingType() async {
    appCt.buildingTypeResponse = await SurveyApi().buildingType();
    if (widget.allSurveyResponse != null) {
      _buildingType = appCt.buildingTypeResponse!.firstWhere(
          (element) => element.id == appCt.allSurveyResponse?.buildingTypeID);
    }
    setState(() {
      buildingTypeLoad=false;
    });
  }

  getMovingType() async {
    appCt.movingTypeResponse = await SurveyApi().movingType();
    if (widget.allSurveyResponse != null) {
      _movingType = appCt.movingTypeResponse!.firstWhere(
          (element) => element.id == appCt.allSurveyResponse?.movingTypeID);
    }
    setState(() {
      movingTypeLoad=false;
    });
  }

  getEmirate() async {
    appCt.emiratesResponse = await SurveyApi().emirate();
    if (widget.allSurveyResponse != null) {
      _emirate = appCt.emiratesResponse!.firstWhere((element) => element.id == appCt.allSurveyResponse?.emirateIDFrom);
      _emirate1 = appCt.emiratesResponse!.firstWhere((element) => element.id == appCt.allSurveyResponse?.emirateIDTo);
    }

    setState(() {
      emirateLoad=false;
    });
  }

  getLeadSource() async {
    appCt.leadSourceResponse = await SurveyApi().leadSource();
    if (widget.allSurveyResponse != null) {
      _leadSource = appCt.leadSourceResponse!.firstWhere(
          (element) => element.id == appCt.allSurveyResponse?.leadSourceID);
    }
    setState(() {
      leadSourceLoad=false;
    });
  }

  final _formKey = GlobalKey<FormState>();

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
          child: Form(
            key: _formKey,
            child:GetBuilder<AppController>(
              builder: (ct) {
                return Column(
                  children: [
                    orderNumberLoad?SkeletonAnimation(child: Skelton(height: 50,)):TextField1(
                      isKey: true,
                      hintName: 'Ref No',
                      labelText: 'Ref No',
                      controller: _orderNumberController,
                    ),
                    SizedBox(height: 10),
                    AppDropdownInput<IdValue>(
                      value: _surveyTypeDropdown,
                      validator: (value) {
                        if (_surveyTypeDropdown == null) {
                          return 'Required';
                        }
                      },
                      hintText: "Survey Type",
                      options: surveyTypeList!,
                      getLabel: (IdValue val) {
                        return val.value!;
                      },
                      onChanged: (val) {
                        setState(() {
                          _surveyTypeDropdown = val;
                        });
                        print(_surveyTypeDropdown?.id);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _surveyTypeDropdown?.id == SurveyThrough.PhysicalSurvey.index
                        ? TextField1(
                            hintName: 'Survey No',
                            labelText: 'Survey No',
                            controller: _surveyNoController,
                      keyBoardType: TextInputType.number,
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 10,
                    ),
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
                          child: AppDropdownInput<String>(
                            value: _time,
                            hintText: 'Time',
                            options: timeList,
                            getLabel: (String val) {
                              return val;
                            },
                            onChanged: (val) {
                              setState(() {
                                _time = val;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    TextField1(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required';
                          }
                        },
                        hintName: 'Customer Name',
                        labelText: 'Customer Name',
                        controller: _customerNameController),
                    SizedBox(height: 10),

                    Row(
                      children: [
                        SizedBox(
                          width: 95,
                          child: TextField1(

                            validator: (value) {
                              if (value!.isEmpty) {
                                return ' ';
                              }
                              if (!isValidPhoneNumber(value)) {
                                return ' ';
                              }
                              return null;
                          },
                            icon: Icon(Icons.add),
                            hintName: 'ISD', labelText: 'ISD',
                            controller: _ISD1Controller,
                            keyBoardType: TextInputType.number,
                            bottom: 0,
                            left: 0,

                          ),
                        ),
                        Expanded(
                          child: TextField1(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Required';
                              }
                              // Check if the value matches a valid phone number pattern
                              if (!isValidPhoneNumber(value)) {
                                return 'Enter a valid phone number';
                              }
                              return null; // Return null if validation passes
                            },
                            top: 0,
                            right: 0,
                            hintName: 'Customer Phone',
                            labelText: 'Customer Phone',
                            controller: _phoneNumber1Controller,
                            keyBoardType: TextInputType.number,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: isChecked,
                            onChanged: (newBool) {
                              setState(() {
                                isChecked = newBool;
                              });
                              if (isChecked == true) {
                                _phoneNumber2Controller.text =
                                    _phoneNumber1Controller.text;
                                _ISD2Controller.text = _ISD1Controller.text;
                              } else {
                                _phoneNumber2Controller.clear();
                                _ISD2Controller.clear();
                              }
                            }),
                        Text(
                          'Same as phone number',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontFamily: 'Poppins'),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        SizedBox(
                          width: 95,
                          child: TextField1(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ' ';
                              }
                            },
                            hintName: 'ISD',
                            labelText: 'ISD',
                            controller: _ISD2Controller,
                            keyBoardType: TextInputType.number,
                            bottom: 0,
                            left: 0,
                          ),
                        ),
                        Expanded(
                          child: TextField1(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Required';
                              }
                            },
                            top: 0,
                            right: 0,
                            hintName: 'Customer Phone',
                            labelText: 'Customer Whatsapp No',
                            controller: _phoneNumber2Controller,
                            keyBoardType: TextInputType.number,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField1(
                      hintName: 'Email Address',
                      labelText: 'Email Address',
                      controller: _emailAddressController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField1(
                      hintName: 'Company Name',
                      labelText: 'Company Name',
                      controller: _companyNameController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField1(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required';
                        }
                      },
                      hintName: 'Nationality',
                      labelText: 'Nationality',
                      controller: _nationalityController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildingTypeLoad?SkeletonAnimation(child: Skelton(height: 50,)):AppDropdownInput(
                      hintText: 'Building Type',
                      validator: (value) {
                        if (_buildingType == null) {
                          return 'Required';
                        }
                      },
                      value: _buildingType,
                      options: appCt.buildingTypeResponse!,
                      getLabel: (val) {
                        return val.value!;
                      },
                      onChanged: (val) {
                        setState(() {
                          _buildingType = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    movingTypeLoad?SkeletonAnimation(child: Skelton(height: 50,)): AppDropdownInput(
                      validator: (value) {
                        if (_movingType == null) {
                          return 'Required';
                        }
                      },
                      value: _movingType,
                      hintText: 'Moving Type',
                      options: appCt.movingTypeResponse!,
                      getLabel: (val) {
                        return val.value!;
                      },
                      onChanged: (val) {
                        setState(() {
                          _movingType = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField1(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required';
                        }
                      },
                      hintName: 'Volume',
                      labelText: 'Volume',
                      controller: _volumeController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField1(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required';
                        }
                      },
                      hintName: 'Work Duration',
                      labelText: 'Work Duration',
                      controller: _workDurationController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField1(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required';
                        }
                      },
                      hintName: 'Place From',
                      labelText: 'Place From',
                      controller: _placeFromController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    emirateLoad?SkeletonAnimation(child: Skelton(height: 50,)): AppDropdownInput(
                      validator: (value) {
                        if (_emirate == null) {
                          return 'Required';
                        }
                      },
                      value: _emirate,
                      hintText: 'Emirate',
                      options: appCt.emiratesResponse!,
                      getLabel: (val) {
                        return val.value!;
                      },
                      onChanged: (val) {
                        setState(() {
                          _emirate = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField1(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required';
                        }
                      },
                      hintName: 'Place To',
                      labelText: 'Place To',
                      controller: _placeToController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    emirateLoad?SkeletonAnimation(child: Skelton(height: 50,)): AppDropdownInput(
                      value: _emirate1,
                      hintText: 'Emirate',
                      options: appCt.emiratesResponse!,
                      getLabel: (val) {
                        return val.value!;
                      },
                      onChanged: (val) {
                        setState(() {
                          _emirate1 = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField1(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required';
                        }
                      },
                      hintName: 'Quoted Price',
                      labelText: 'Quoted Price',
                      controller: _quotedPriceController,
                      keyBoardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    leadSourceLoad?SkeletonAnimation(child: Skelton(height: 50,)):AppDropdownInput(
                      validator: (value) {
                        if (_leadSource == null) {
                          return 'Required';
                        }
                      },
                      value: _leadSource,
                      hintText: 'Lead Source',
                      options: appCt.leadSourceResponse!,
                      getLabel: (val) {
                        return val.value!;
                      },
                      onChanged: (val) {
                        _leadSource = val;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField1(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required';
                          }
                        },
                        controller: _date2Controller,
                        hintName: 'Moving Date',
                        isKey: true,
                        labelText: 'Moving Date',
                        image1: 'assets/Group 33192.png',
                        onTap: () {
                          _select1Date();
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    AppDropdownInput<String>(
                      validator: (value) {
                        if (_leadQuality == null) {
                          return 'Required';
                        }
                      },
                      value: _leadQuality,
                      hintText: "Lead Quality",
                      options: leadQualityList,
                      getLabel: (String val) {
                        return val;
                      },
                      onChanged: (val) {
                        _leadQuality = val;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Textformfield(
                      hintName: 'Instructions',
                      labelText: 'Instructions',
                      controller: _instructionController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                          height: 50,
                          child: ButtonnElevated(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {

                                var data = {
                                  "surveyID": widget.allSurveyResponse != null
                                      ? widget.allSurveyResponse?.surveyID
                                      : 0,
                                  "surveyNo":
                                      int.parse(_orderNumberController.text),
                                  "customerID": 0,
                                  "staffEntityID": null,
                                  "date": _picked!.toIso8601String(),
                                  "time": _time,
                                  "requirement": _instructionController.text,
                                  "folioRefNo": _surveyNoController.text,
                                  "placeFrom": _placeFromController.text,
                                  "placeTo": _placeToController.text,
                                  "emirateIDFrom": _emirate?.id,
                                  "emirateIDTo": _emirate1?.id,
                                  "quotedPrice": _quotedPriceController.text,
                                  "totalQuotedPrice": 0,
                                  "orderStatus": OrderStatus.Pending.index,
                                  "movingDate": _picked1!.toIso8601String(),
                                  "closedDate": null,
                                  "finalAmount": 0,
                                  "paymentStatus": 0,
                                  "canceledReason": null,
                                  "leadQuality": _leadQuality,
                                  "leadSourceID": _leadSource?.id,
                                  "customerName": _customerNameController.text,
                                  "customerPhone": _phoneNumber1Controller.text,
                                  "companyName": _companyNameController.text,
                                  "leadSourseName": _leadSource?.value,
                                  "remark": null,
                                  "remarkID": null,
                                  "emailAddress": _emailAddressController.text,
                                  "volume": _volumeController.text,
                                  "buildingTypeID": _buildingType?.id,
                                  "buildingTypeName": _buildingType?.value,
                                  "movingTypeID": _movingType?.id,
                                  "movingTypeName": _movingType?.value,
                                  "branchID": null,
                                  "agreedAmount": 0,
                                  "pricingInstruction": null,
                                  "teamLeaderID": null,
                                  "finalVolume": null,
                                  "boxToBeCollected": 0,
                                  "collectedDateTime": "2024-03-21T04:25:24.372Z",
                                  "boxCollected": 0,
                                  "workStartDate": null,
                                  "placeFromEmirates": _emirate?.value,
                                  "placeToEmirates": _emirate1?.value,
                                  "phoneCountryID":_ISD1Controller.text ,
                                  "phone2CountryID": _ISD2Controller.text,
                                  "customerPhone2": _phoneNumber2Controller.text,
                                  "isdCode": null,
                                  "isdCode2": null,
                                  "isSameContact": isChecked,
                                  "designation": null,
                                  "address": null,
                                  "workDuration": _workDurationController.text,
                                  "workDurationCurrent": "",
                                  "confirmWorkDuration": null,
                                  "confirmStartTime": null,
                                  "taxCategoryID": null,
                                  "percentage": 0,
                                  "totalAmount": null,
                                  "surveyThrough": 0,
                                  "receiptJournalMasterID": null,
                                  "nationality": _nationalityController.text
                                };
                                // SurveyApi().SurveyAdd(data);

                                var isSuccess = await SurveyApi().SurveyAdd(data);
                                if (isSuccess) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return showDialog1(
                                          title: 'Survey Added',
                                          subtitle:
                                              'This Survey has been added successfully',
                                          image: 'assets/Group 427318220.png',
                                          buttonText1: 'Close',
                                          onTap: () {
                                            Get.back(result: true);
                                            Get.back(result: true);

                                          },
                                        );
                                      });

                                }
                              }
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
                );
              }
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (_picked != null) {
      setState(() {
        _date1Controller.text = _picked.toString().split(" ")[0];
      });
    }
  }

  Future<void> _select1Date() async {
    _picked1 = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (_picked1 != null) {
      setState(() {
        _date2Controller.text = _picked1.toString().split(" ")[0];
      });
    }
  }
}

class IdValue {
  int? id;
  String? value;
  IdValue({this.id, this.value});
}

List<IdValue> surveyTypeList = [
  IdValue(
      id: SurveyThrough.PhysicalSurvey.index,
      value: SurveyThrough.PhysicalSurvey.name),
  IdValue(
      id: SurveyThrough.TelephonicSurvey.index,
      value: SurveyThrough.TelephonicSurvey.name)
];

List<String> leadQualityList = ["10%", "50%", '75%', "100%"];

List<String> timeList = [
  '1 AM',
  '2 AM',
  '3 AM',
  '4 AM',
  '5 AM',
  '6 AM',
  '7 AM',
  '8 AM',
  '9 AM',
  '10 AM',
  '11 AM',
  '12 AM',
  '1 PM',
  '2 PM',
  '3 PM',
  '4 PM',
  '5 PM',
  '6 PM',
  '7 PM',
  '8 PM',
  '9 PM',
  '10 PM',
  '11 PM',
  '12 PM',
];
