import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/marketing_api.dart';
import 'package:sunstarmovers/controller/appController.dart';
import 'package:sunstarmovers/pages/AddSurvey.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/SurveyPendingConfirm.dart';
import 'package:sunstarmovers/pages/TextField1.dart';
import 'package:sunstarmovers/pages/showDialog.dart';
import 'package:sunstarmovers/responses/ActivityResponse.dart';
import 'package:sunstarmovers/responses/MarketingEmirateResponse.dart';

class MarketingAdd extends StatefulWidget {
  final int? MarketingId;
  const MarketingAdd({super.key, this.MarketingId});

  @override
  State<MarketingAdd> createState() => _MarketingAddState();
}

class _MarketingAddState extends State<MarketingAdd> {
  TextEditingController _marketingOrderNumber = TextEditingController();
  TextEditingController _dateeController = TextEditingController();
  TextEditingController _activityDetailController=TextEditingController();
  TextEditingController _isd1Controller = TextEditingController();
  TextEditingController _isd2Controller = TextEditingController();
  TextEditingController _phoneNumber1Controller = TextEditingController();
  TextEditingController _phoneNumber2Controller = TextEditingController();
  TextEditingController _customerNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _designationController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _nationalityController = TextEditingController();
  TextEditingController _placeController = TextEditingController();

  DateTime? _picked3;
  String? _time1;
  ActivityResponse? _activity;
  MarketingEmirateResponse? _emirate;
  bool screenLoad = true;
  bool? isChecked = false;

  AppController appCt = Get.find();
  @override
  void initState() {
    getEmirate();
    getMarketingOrderNumber();
    getActivity();
    super.initState();
  }

  getEmirate() async {
    appCt.marketingEmirateResponse = await MarketingApi().marketingEmirate();
    setState(() {
      screenLoad = false;
    });
  }

  getActivity() async {
    appCt.activityResponse = await MarketingApi().activity();
    setState(() {
      screenLoad = false;
    });
  }

  getMarketingOrderNumber() async {
    appCt.marketingOrderNumberResponse =
        await MarketingApi().marketingOrderNumber();
    _marketingOrderNumber.text =
        appCt.marketingOrderNumberResponse!.orderNo.toString() ?? '';
    if (mounted) {
      setState(() {
        screenLoad = false;
      });
    }
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
            "Add Marketing",
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
          padding: const EdgeInsets.all(15.0),
          child: screenLoad
              ? Center(
                  child: CircularProgressIndicator(
                  color: Colors.red,
                ))
              : GetBuilder<AppController>(builder: (ct) {
                  return Column(
                    children: [
                      TextField1(
                          hintName: 'Ref No',
                          labelText: 'Ref No',
                          controller: _marketingOrderNumber,
                          isKey: true),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: TextField1(
                            controller: _dateeController,
                            hintName: 'Date',
                            labelText: 'Date',
                            isKey: true,
                            image1: 'assets/Group 33192.png',
                            onTap: () {
                              _selectDate1();
                            },
                          )),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: AppDropdownInput(
                              hintText: 'Time',
                              value: _time1,
                              options: timeList,
                              getLabel: (String val) {
                                return val;
                              },
                              onChanged: (val) {
                                setState(() {
                                  _time1 = val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AppDropdownInput(
                        hintText: 'Activity',
                        value: _activity,
                        options: appCt.activityResponse!,
                        getLabel: (val) {
                          return val.value!;
                        },
                        onChanged: (val) {
                          setState(() {
                            _activity = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      TextField1(
                          hintName: 'Details',
                          labelText: 'Details',
                          controller: _activityDetailController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 95,
                            child: TextField1(
                              hintName: 'ISD',
                              labelText: 'ISD',
                              controller: _isd1Controller,
                              keyBoardType: TextInputType.number,
                              bottom: 0,
                              left: 0,
                            ),
                          ),
                          Expanded(
                              child: TextField1(
                            hintName: 'Phone Number',
                            labelText: 'Phone Number',
                            controller: _phoneNumber1Controller,
                            top: 0,
                            right: 0,
                            keyBoardType: TextInputType.number,
                          )),
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
                                  _isd2Controller.text = _isd1Controller.text;
                                } else {
                                  _phoneNumber2Controller.clear();
                                  _isd2Controller.clear();
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
                              hintName: 'ISD',
                              labelText: 'ISD',
                              controller: _isd2Controller,
                              keyBoardType: TextInputType.number,
                              bottom: 0,
                              left: 0,
                            ),
                          ),
                          Expanded(
                              child: TextField1(
                            hintName: 'Whatsapp Number',
                            labelText: 'Whatsapp Number',
                            controller: _phoneNumber2Controller,
                            top: 0,
                            right: 0,
                            keyBoardType: TextInputType.number,
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField1(
                        hintName: 'Customer Name',
                        labelText: 'Customer Name',
                        controller: _customerNameController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField1(
                        hintName: 'Email Address',
                        labelText: 'Email Address',
                        controller: _emailController,
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
                        hintName: 'Designation',
                        labelText: 'Designation',
                        controller: _designationController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Textformfield(
                        hintName: 'Address',
                        labelText: 'Address',
                        controller: _addressController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField1(
                        hintName: 'Nationality',
                        labelText: 'Nationality',
                        controller: _nationalityController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField1(
                        hintName: 'Place',
                        labelText: 'Place',
                        controller: _placeController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AppDropdownInput(
                        value: _emirate,
                        hintText: 'Emirate',
                        options: appCt.marketingEmirateResponse!,
                        getLabel: (val) {
                          return val.value!;
                        },
                        onChanged: (val) {
                          _emirate = val;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: SizedBox(
                            height: 50,
                            child: ButtonnElevated(
                                buttonName: 'Save',
                                onPressed: () async {
                                  var data = {
                                    "marketingID": 0,
                                    "marketingNo": int.parse(_marketingOrderNumber.text),
                                    "activityID": _activity?.id,
                                    "activityDetails": _activityDetailController.text,
                                    "customerID": 0,
                                    "branchID": null,
                                    "staffEntityID": null,
                                    "name": null,
                                    "customerName": _customerNameController.text,
                                    "customerPhone": _phoneNumber1Controller.text,
                                    "emailAddress": _emailController.text,
                                    "designation": _designationController.text,
                                    "address": _addressController.text,
                                    "marketingTypeName": _activity?.value,
                                    "companyName": _companyNameController.text,
                                    "date": _picked3!.toIso8601String(),
                                    "phoneCountryID": _isd1Controller.text,
                                    "phone2CountryID": _isd2Controller.text,
                                    "customerPhone2": _phoneNumber2Controller.text,
                                    "isdCode": _isd1Controller.text,
                                    "isdCode2": _isd2Controller.text,
                                    "isSameContact": isChecked,
                                    "time": _time1,
                                    "placeEmirates": _emirate?.value,
                                    "place": _placeController.text,
                                    "emirateID": _emirate!.id,
                                    "nationality": _nationalityController.text
                                  };

                                  var isSuccess =
                                      await MarketingApi().MarketingAdd(data);
                                  if (isSuccess) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return showDialog1(
                                            title: 'Marketing Added',
                                            subtitle:
                                                'The marketing has been added successfully',
                                            image: 'assets/Group 427318220.png',
                                            buttonText1: 'Close',
                                            onTap: ()
                                            {
                                              Get.back(result: true);
                                              Get.back(result: true);
                                            },
                                          );
                                        });
                                  }
                                }),
                          )),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: ButtonnOutlined(
                                title: 'Cancel',
                                onPressed: () {},
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  );
                }),
        ),
      ),
    );
  }

  Future<void> _selectDate1() async {
    _picked3 = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (_picked3 != null) {
      setState(() {
        _dateeController.text = _picked3.toString().split(" ")[0];
      });
    }
  }
}
