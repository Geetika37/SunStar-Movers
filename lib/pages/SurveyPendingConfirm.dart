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
import 'package:sunstarmovers/responses/ConfirmDatePostModal.dart';

class SurveyPendingConfirm extends StatefulWidget {
  final int? SurveyID;
  const SurveyPendingConfirm({super.key, this.SurveyID});

  @override
  State<SurveyPendingConfirm> createState() => _SurveyPendingConfirmState();
}

class _SurveyPendingConfirmState extends State<SurveyPendingConfirm> {
  TextEditingController _confirmWorkController = TextEditingController();
  TextEditingController _agreedAmountController = TextEditingController();
  TextEditingController _instructionController = TextEditingController();
  String? _timee;
  DateTime? _picked2;
  TextEditingController _dataController = TextEditingController();
  DateTime selectedDurationDates = DateTime.now();
  int _numberOfTextFields = 0;
  List<TextEditingController> _controllers = [];
  List<Widget> _textFields = [];

  void _updateTextFields(int number, bool isEdit) {
    if (mounted) {
      setState(() {
        _numberOfTextFields = number;
        _controllers = List.generate(
            _numberOfTextFields, (index) => TextEditingController());
        _textFields = List.generate(_numberOfTextFields, (index) {
          // if (widget.allSurveyResponse != null &&
          //     widget.allSurveyResponse!.confirmDate!.isNotEmpty &&
          //     isEdit) {
          //   // _controllers = [];
          //   // if (index < oldUrls.length) {
          //   _controllers[index].text =
          //   "${DateFormat('dd/MM/yyyy').format(DateTime.parse(widget.allSurveyResponse!.confirmDate![index].bookingDate!))}";
          //
          //   widget.allSurveyResponse!.confirmDate!.forEach((element) {
          //     SurveyDatesModal data = SurveyDatesModal(
          //         isRowInEditMode: false,
          //         branchID: element.branchID,
          //         rowIndex: element.rowIndex,
          //         surveyBookingDateID: element.surveyBookingDateID,
          //         surveyID: element.surveyID,
          //         bookingTime: element.bookingTime,
          //         bookingDate: element.bookingDate);
          //     durationDatesPostModal.add(data);
          //   });
          //   // }
          // }
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextField1(
              controller: _controllers[index],
              labelText: "Choose Date",
              hintName: "Choose Date",
              isKey: true,
              // image1: SvgPicture.asset(
              //   AssetConstant.calender_new,
              //   fit: BoxFit.none,
              // ),
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDurationDates,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (picked != null && picked != selectedDurationDates) {
                  setState(() {
                    selectedDurationDates = picked;
                    _controllers[index].text =
                        DateFormat('dd/MM/yyyy').format(selectedDurationDates);
                  });
                  // ConfirmDatePostModal data = ConfirmDatePostModal(
                  //     isRowInEditMode: false,
                  //     branchID: 0,
                  //     rowIndex: 0,
                  //     surveyBookingDateID: 0,
                  //     surveyID: widget.SurveyID,
                  //     bookingTime: null,
                  //     bookingDate: selectedDurationDates.toIso8601String());

                  // Check if the item already exists in the list
                  if (index < confirmDatePostModel.length) {
                    confirmDatePostModel[index].bookingDate =
                        selectedDurationDates.toIso8601String();
                  } else {
                    ConfirmDatePostModal data = ConfirmDatePostModal(
                        isRowInEditMode: false,
                        branchID: 0,
                        rowIndex: 0,
                        surveyBookingDateID: 0,
                        surveyID: widget.SurveyID,
                        bookingTime: null,
                        bookingDate: selectedDurationDates.toIso8601String());
                    confirmDatePostModel.add(data);
                  }
                }
              },
              validator: (val) {
                if (val!.isEmpty) {
                  return "required";
                }
                return null;
              },
            ),
          );
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Stack(
          children: [
            ListView(
              children: [
                SizedBox(
                  height: 15,
                ),
                Text3(name3: 'Confirm Survey'),
                SizedBox(
                  height: 10,
                ),
                AppDropdownInput<String>(
                  value: _timee,
                  hintText: 'Time',
                  options: timeList,
                  getLabel: (String val) {
                    return val;
                  },
                  onChanged: (val) {
                    setState(() {
                      _timee = val;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextField1(
                  keyBoardType: TextInputType.number,
                  hintName: 'Confirm Work Duration',
                  labelText: 'Confirm Work Duration',
                  controller: _confirmWorkController,
                  onChanged: (val) {
                    if (int.parse(val) > 0) {
                      _updateTextFields(int.parse(val), false);
                    } else if (val.isEmpty) {
                      _updateTextFields(0, false);
                    } else if (int.parse(val) < 0) {
                      _updateTextFields(0, false);
                    } else {
                      _updateTextFields(0, false);
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: _textFields,
                ),

                SizedBox(
                  height: 10,
                ),
                TextField1(
                  hintName: 'Agreed Amount',
                  labelText: 'Agreed Amount',
                  controller: _agreedAmountController,
                ),
                SizedBox(
                  height: 10,
                ),
                Textformfield(
                  hintName: 'Instruction',
                  labelText: 'Instruction',
                  controller: _instructionController,
                ),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                          child: ButtonnElevated(
                        buttonName: 'Done',
                        onPressed: () async {
                          var data = {
                            "surveyID": widget.SurveyID,
                            "movingDate": null,
                            "agreedAmount":
                                int.parse(_agreedAmountController.text),
                            "pricingInstruction": _instructionController.text,
                            "confirmWorkDuration": _confirmWorkController.text,
                            "movingTime": _timee,
                            "startTime": null,
                            "taxCategoryID": null,
                            "percentage": null,
                            "totalAmount": null,
                            "orderStatus": OrderStatus.Confirmed.index,
                            "canceledReason": null,
                            "dates": confirmDatePostModel
                          };

                          var isSuccess =
                              await SurveyConfirmApi().SurveyConfirm(data);
                          if (isSuccess) {
                            Get.back(result: true);
                            Get.back(result: true);
                          }
                        },
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: ButtonnOutlined(
                        title: 'Close',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ))
                    ],
                  ),
                ))
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
  const Textformfield(
      {super.key,
      required this.hintName,
      required this.labelText,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 3,
      decoration: InputDecoration(
        hintText: hintName,
        hintStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey.withOpacity(.5)),
        labelText: labelText,
        labelStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(9)),
      ),
    );
  }
}

class Dropdown extends StatefulWidget {
  final String hintText;
  const Dropdown({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String? dropdownValue;

  var items = [
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

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        // isDense: true,
        contentPadding: EdgeInsets.only(top: 15, bottom: 15, left: 10),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey), // Border color
          borderRadius: BorderRadius.circular(9.0), // Border radius
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isDense: true,
          value: dropdownValue,
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
                hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.7)),
                // hintStyle: AppFontPoppins(
                //     fontWeight: FontWeight.w400,
                //     fontSize: 14,
                //     color: AppColorCode.black17),

                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(9)),
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

List<ConfirmDatePostModal> confirmDatePostModel = [];
