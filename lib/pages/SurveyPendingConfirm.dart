import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/ButtonOutline.dart';
import 'package:sunstarmovers/pages/ButtonnElevated.dart';
import 'package:sunstarmovers/pages/Row3.dart';
import 'package:sunstarmovers/pages/Survey.dart';
import 'package:sunstarmovers/pages/TextField1.dart';

class SurveyPendingConfirm extends StatelessWidget {
  const SurveyPendingConfirm({super.key});

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
                Dropdown(hintText: 'Time',),
                SizedBox(height: 10,),
                TextField1(hintName: 'Confirm Work Duration', labelText: 'Confirm Work Duration'),
                SizedBox(height: 10,),
                TextField1(hintName: 'Agreed Amount', labelText: 'Agreed Amount'),
                SizedBox(height: 10,),
                Dropdown(hintText: 'Tax Category'),
                SizedBox(height: 10,),
                TextField1(hintName: 'Total Amount', labelText: 'Total Amount'),
                SizedBox(height: 10,),
                Textformfield(hintName: 'Instruction', labelText: 'Instruction',),
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
                      Expanded(child: ButtonnElevated(buttonName: 'Done',onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Survey()));},)),
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
}

class Textformfield extends StatelessWidget {
  final String hintName;
  final String labelText;
  const Textformfield({super.key, required this.hintName, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
  const Dropdown({Key? key, required this.hintText}) : super(key: key);

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
        child: DropdownButton<String>(
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

