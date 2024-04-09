import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunstarmovers/Apis/marketing_api.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';

class BottomSheetRemark extends StatefulWidget {
  final String title;
  final String hintName;
  final String labelName;
  final String buttonName1;
  final String buttonName2;
  final Function()? onTap;
  final int? MarketingId;

  const BottomSheetRemark({super.key, required this.title, required this.hintName, required this.labelName, required this.buttonName1, required this.buttonName2, this.onTap, this.MarketingId});

  @override
  State<BottomSheetRemark> createState() => _BottomSheetRemarkState();
}

class _BottomSheetRemarkState extends State<BottomSheetRemark> {
  TextEditingController _commentController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Stack(children: [
          ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                widget.title,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _commentController,
                maxLines: 4,
                decoration: InputDecoration(
                    hintText: widget.hintName,
                    hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.withOpacity(.5)),
                    labelText: widget.labelName,
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(9))),
              ),

            ],
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Row(
                children: [
                  Expanded(
                      child: ButtonnElevated(
                        buttonName: widget.buttonName1,
                        onPressed: ()async{
                          var isSuccess=await MarketingApi().commentMarketing(remark: _commentController.text,MarketingId: widget.MarketingId);
                          Get.back(result: true);
                        },
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: ButtonnOutlined(
                        title: widget.buttonName2,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )),
                ],
              ))
        ]),
      ),
    );
  }
}
