import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/surveyconfirm_api.dart';
import 'package:sunstarmovers/enums/enum.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/SurveyPendingConfirm.dart';
import 'package:sunstarmovers/pages/TextField1.dart';
import 'package:sunstarmovers/responses/AllSurveyResponse.dart';

class SurveyStartWork extends StatefulWidget {
  final AllSurveyResponse? allSurveyResponse;
  const SurveyStartWork({super.key, this.allSurveyResponse});

  @override
  State<SurveyStartWork> createState() => _SurveyStartWorkState();
}

class _SurveyStartWorkState extends State<SurveyStartWork> {
  TextEditingController _dateController = TextEditingController();
  DateTime? _picked;
  TextEditingController _finalVolumeController = TextEditingController();
  TextEditingController _workDurationController = TextEditingController();
  TextEditingController _finalAmountController = TextEditingController();
  TextEditingController _boxToBeCollectedController = TextEditingController();
  IdValue? _paymentStatusController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 530,
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Stack(
            children: [
              ListView(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text3(name3: 'Complete Survey'),
                  SizedBox(
                    height: 15,
                  ),
                  TextField1(
                    hintName: 'Complete Date',
                    labelText: 'Complete Date',
                    image1: 'assets/Group 33192.png',
                    controller: _dateController,
                    isKey: true,
                    onTap: () {
                      _selectDate();
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField1(
                    hintName: 'Final Volume',
                    labelText: 'Final Volume',
                    controller: _finalVolumeController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField1(
                    hintName: 'Work Duration',
                    labelText: 'Work Duration',
                    controller: _workDurationController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField1(
                    hintName: 'Final Amount',
                    labelText: 'Final Amount',
                    controller: _finalAmountController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField1(
                    hintName: 'Boxes to be collected',
                    labelText: 'Boxes to be Collected',
                    controller: _boxToBeCollectedController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppDropdownInput(
                    hintText: 'Payment Status',
                    value: _paymentStatusController,
                    options: paymentStatusList,
                    getLabel: (IdValue val) {
                      return val.value!;
                    },
                    onChanged: (val) {
                      setState(() {
                        _paymentStatusController = val;
                      });
                    },
                  )
                ],
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                            child: ButtonnElevated(
                          buttonName: 'Done',
                          onPressed: () async {
                            var data = {
                              "surveyID":
                                  widget.allSurveyResponse!.surveyID != null
                                      ? widget.allSurveyResponse?.surveyID
                                      : 0,
                              "finalVolume": _finalVolumeController.text,
                              "finalAmount":
                                  int.parse(_finalAmountController.text),
                              "boxToBeCollected":
                                  int.parse(_boxToBeCollectedController.text),
                              "paymentSattus": _paymentStatusController!.id,
                              "workCompleteDate": _picked!.toIso8601String(),
                              "workDuration": _workDurationController.text,
                              "workStartDate": "2024-03-29T04:56:00.405Z",
                              "taxCategoryID": null,
                              "discount": null,
                              "totalAmount": 0,
                              "percentage": 0,
                              "orderStatus": OrderStatus.Closed.index,
                              "journalNo": 0,
                              "prefix": null,
                              "receiptJournalMasterID": null,
                              "accountsDate": null,
                              "customerID": 0
                            };
                            var isSuccess =
                                await SurveyConfirmApi().CompleteWork(data);
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
                          onPressed: () {},
                        ))
                      ],
                    ),
                  ))
            ],
          )),
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
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }
}

class IdValue {
  int? id;
  String? value;
  IdValue({this.id, this.value});
}

List<IdValue> paymentStatusList = [
  IdValue(id: PaymentStatus.Pending.index, value: PaymentStatus.Pending.name),
  IdValue(id: PaymentStatus.Cash.index, value: PaymentStatus.Cash.name),
  IdValue(id: PaymentStatus.Bank.index, value: PaymentStatus.Bank.name),
];
