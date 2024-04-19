import 'package:flutter/material.dart';
import 'package:sunstarmovers/responses/SurveyGraph.dart';

class RowChart extends StatefulWidget {
  final Color color;
  final String text;
  final String? count;
  const RowChart({super.key, required this.color, required this.text, this.count});

  @override
  State<RowChart> createState() => _RowChartState();
}

class _RowChartState extends State<RowChart> {
   List<SurveyGraph>? surveyGraph;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 5,
              backgroundColor: widget.color,
            ),
            SizedBox(
              width: 10,
            ),
            Text(widget.text),

          ],
        ),
        Text(widget.count ?? ""),
      ],
    );
  }
}
