
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/surveyconfirm_api.dart';
import 'package:sunstarmovers/enums/enum.dart';
import 'package:sunstarmovers/pages/AddSurvey.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/HomePage.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/Survey.dart';
import 'package:sunstarmovers/pages/SurveyConfirm.dart';
import 'package:sunstarmovers/pages/SurveyConfirm.dart';
import 'package:sunstarmovers/pages/TextField1.dart';

class SurveyPendingConfirm extends StatefulWidget {
  final int? SurveyID;
  const SurveyPendingConfirm({super.key, this.SurveyID});

  @override
  State<SurveyPendingConfirm> createState() => _SurveyPendingConfirmState();
}

class _SurveyPendingConfirmState extends State<SurveyPendingConfirm> {
  TextEditingController _confirmWorkController=TextEditingController();
  TextEditingController _agreedAmountController=TextEditingController();
  TextEditingController _instructionController=TextEditingController();
  String? _timee;
  DateTime? _picked2;
  TextEditingController _dataController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 550,
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Stack(
          children:[
            ListView(
              children: [
                SizedBox(height: 15,),
                Text3(name3: 'Confirm Survey'),
                SizedBox(height: 10,),
                AppDropdownInput<String>(
                  value: _timee,
                  hintText: 'Time',
                  options: timeList,
                  getLabel: (String val)
                  {
                    return val;
                  },
                    onChanged: (val)
                  {
                    setState(() {
                      _timee=val;
                    });
                  },
                ),
                SizedBox(height: 10,),
                TextField1(hintName: 'Confirm Work Duration', labelText: 'Confirm Work Duration',controller: _confirmWorkController),
                SizedBox(height: 10,),
                TextField1(
                  controller: _dataController,
                  isKey: true,
                  hintName: 'Date',
                  labelText: 'Date',
                  image1: 'assets/Group 33192.png',
                  onTap: () {
                    _selectDate2();
                  },
                ),
                SizedBox(height: 10,),
                TextField1(hintName: 'Agreed Amount', labelText: 'Agreed Amount',controller:_agreedAmountController ,),
                SizedBox(height: 10,),
                Textformfield(hintName: 'Instruction', labelText: 'Instruction',controller:_instructionController ,),
                SizedBox(height: 70,),
              ],
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child:Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(child: ButtonnElevated(buttonName: 'Done',
                        onPressed: ()async{
                        var data={
                          "surveyID": widget.SurveyID,
                          "movingDate": _picked2!.toIso8601String(),
                          "agreedAmount": _agreedAmountController,
                          "pricingInstruction": _instructionController,
                          "confirmWorkDuration": _confirmWorkController,
                          "movingTime": _timee,
                          "startTime": null,
                          "taxCategoryID": null,
                          "percentage": null,
                          "totalAmount": null,
                          "orderStatus": OrderStatus.Confirmed.index,
                          "canceledReason": null,
                          "dates": [
                            {
                              "isRowInEditMode": false,
                              "rowIndex": 0,
                              "branchID": 0,
                              "surveyBookingDateID": 0,
                              "bookingDate": "2024-03-26T05:06:23.888Z",
                              "bookingTime": null,
                              "surveyID": null
                            }
                          ]
                        };

                        var isSuccess=await SurveyConfirmApi().SurveyConfirm(data);
                        if(isSuccess)
                          {
                            Get.back();
                          }

                      },)),
                      SizedBox(width: 10,),
                      Expanded(child: ButtonnOutlined(title: 'Close',onPressed: (){Navigator.pop(context);},))
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate2() async {
    _picked2 = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (_picked2 != null) {
      setState(() {
        _dataController.text = _picked2.toString().split(" ")[0];
      });
    }
  }
}

class Textformfield extends StatelessWidget {
  final String hintName;
  final String labelText;
  final TextEditingController? controller;
  const Textformfield({super.key, required this.hintName, required this.labelText, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 3,
      decoration: InputDecoration(
        hintText: hintName,
        hintStyle: TextStyle(fontFamily: 'Poppins',fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey.withOpacity(.5)),
        labelText: labelText,
        labelStyle: TextStyle(fontFamily: 'Poppins',fontSize: 14,fontWeight: FontWeight.w500,),

        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey,),
            borderRadius: BorderRadius.circular(9)
        ),
      ),
    );
  }
}






class Dropdown extends StatefulWidget {
  final String hintText;
  const Dropdown({Key? key, required this.hintText,}) : super(key: key);

  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String? dropdownValue;

  var items = [
    '1 AM', '2 AM', '3 AM', '4 AM', '5 AM', '6 AM', '7 AM', '8 AM','9 AM', '10 AM', '11 AM', '12 AM',
    '1 PM', '2 PM', '3 PM', '4 PM', '5 PM', '6 PM', '7 PM', '8 PM','9 PM', '10 PM', '11 PM', '12 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        // isDense: true,
        contentPadding: EdgeInsets.only(top: 15,bottom: 15,left: 10),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey), // Border color
          borderRadius: BorderRadius.circular(9.0), // Border radius
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isDense: true,

          value:dropdownValue,
          icon: const Icon(Icons.keyboard_arrow_down),
          hint: Text(widget.hintText),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
        ),
      ),
    );
  }
}


class AppDropdownInput<T> extends StatelessWidget {
  final String hintText;
  final List<T> options;
  final T? value;
  final String Function(T)? getLabel;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final double? fontSize;

  const AppDropdownInput(
      {Key? key,
        this.hintText = 'Please select an Option',
        this.options = const [],
        this.getLabel,
        this.value,
        this.onChanged,
        this.validator,
        this.fontSize = 14})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   hintText,
        //   style: AppFontRoboto(
        //     fontSize: 14,
        //     fontWeight: FontWeight.w500,
        //     color: Colors.black.withOpacity(0.5),
        //   ),
        // ),
        // const VerticalHeight(6),
        Container(
          // height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            // color: AppColors.grey75,
          ),
          child:
          // FormField<T>(
          //   builder: (FormFieldState<T> state) {
          // return InputDecorator(
          //   decoration: InputDecoration(
          //     contentPadding:
          //         const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
          //     // labelStyle: textStyle,
          //     errorStyle:
          //         const TextStyle(color: Colors.redAccent, fontSize: 16.0),
          //     hintText: hintText,
          //     // labelText: hintText,
          //     enabledBorder: OutlineInputBorder(
          //       borderSide: BorderSide(color: WHITE),
          //     ),
          //     focusedBorder: UnderlineInputBorder(
          //       borderSide: BorderSide(color: WHITE),
          //     ),
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(5.0),
          //     ),
          //   ),
          //   isEmpty: value == null || value == '',
          //   child:
          DropdownButtonHideUnderline(
            child: DropdownButtonFormField<T>(
              // style: AppFontPoppins(
              //     fontWeight: FontWeight.w400, fontSize: fontSize),
              decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.only(left: 15, top: 19, bottom: 10),
                // labelStyle: textStyle,
                // errorStyle:
                //     const TextStyle(color: Colors.redAccent, fontSize: 16.0),
                hintText: hintText,
                hintStyle: TextStyle(fontFamily: 'Poppins',fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.7)),
                // hintStyle: AppFontPoppins(
                //     fontWeight: FontWeight.w400,
                //     fontSize: 14,
                //     color: AppColorCode.black17),


                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey,),
                    borderRadius: BorderRadius.circular(9)
                ),
              ),
              value: value,
              isDense: true,
              onChanged: onChanged != null ? onChanged : (T? value) {},
              items: options.map((T val) {
                return DropdownMenuItem<T>(
                  value: val,
                  child: Text(
                    getLabel != null ? getLabel!(val) : '',

                    // color: AppColorCode.black17,
                  ),
                );
              }).toList(),
              validator: validator,
            ),
            // ),
          ),
          // },
          // ),
        ),
      ],
    );
  }
}


