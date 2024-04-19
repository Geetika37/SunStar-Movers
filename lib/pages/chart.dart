import 'package:flutter/material.dart';
import 'package:sunstarmovers/Apis/auth_api.dart';
import 'package:sunstarmovers/responses/SurveyGraph.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  final  List<SurveyGraph>? surveyGraph;
  const Chart({Key? key, this.surveyGraph, }) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {

  bool screenLoad = true;



  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child:  SfCartesianChart(
              plotAreaBorderWidth: 0, // Remove plot area border
              borderWidth: 0,

              primaryXAxis: CategoryAxis(
                majorGridLines: MajorGridLines(width: 0),
                majorTickLines: const MajorTickLines(size: 0),
                axisLine: const AxisLine(width: 0),
              ),

              primaryYAxis: NumericAxis(
                minimum: 0, // Set the minimum value for the axis
                maximum: 5, // Set the maximum value for the axis
                interval: 1, // Set the interval between each label
                majorGridLines: MajorGridLines(width: 1),
                majorTickLines: const MajorTickLines(size: 0),
                axisLine: const AxisLine(width: 0),
                labelIntersectAction: AxisLabelIntersectAction.multipleRows,
                labelFormat: '{value}', // Format for displaying labels
              ),

              series: <CartesianSeries>[
                ColumnSeries<SurveyGraph, String>(
                  spacing: 0.4, // Adjust the spacing to add space between bars
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                          10)), // Apply curve to the top edges of the bars
                  dataSource: widget.surveyGraph!,
                  width: 0.5,
                  xValueMapper: (SurveyGraph sales, _) => sales.day,
                  yValueMapper: (SurveyGraph sales, _) => sales.pendingSurvey,
                  name: 'pending',
                  color: const Color(0xff909090),
                ),
                ColumnSeries<SurveyGraph, String>(
                    spacing:
                        0.4, // Adjust the spacing to add space between bars
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(
                            10)), // Apply curve to the top edges of the bars
                    dataSource: widget.surveyGraph!,
                    width: 0.5,
                    xValueMapper: (SurveyGraph sales, _) => sales.day,
                    yValueMapper: (SurveyGraph sales, _) => sales.confirmSurvey,
                    name: 'confirm',
                    color: Colors.blue),
                ColumnSeries<SurveyGraph, String>(
                  spacing: 0.4, // Adjust the spacing to add space between bars
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                          10)), // Apply curve to the top edges of the bars
                  dataSource: widget.surveyGraph!,
                  width: 0.5,
                  xValueMapper: (SurveyGraph sales, _) => sales.day,
                  yValueMapper: (SurveyGraph sales, _) => sales.startWorkSurvey,
                  name: 'startwork',
                  color: Color.fromARGB(255, 59, 156, 52),
                ),
                ColumnSeries<SurveyGraph, String>(
                  spacing: 0.4, // Adjust the spacing to add space between bars
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                          10)), // Apply curve to the top edges of the bars
                  dataSource: widget.surveyGraph!,
                  width: 0.5,
                  xValueMapper: (SurveyGraph sales, _) => sales.day,
                  yValueMapper: (SurveyGraph sales, _) => sales.closedSurvey,
                  name: 'closed',
                  color: Color(0xffD45B04),
                ),
                ColumnSeries<SurveyGraph, String>(
                  spacing: 0.4, // Adjust the spacing to add space between bars
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                          10)), // Apply curve to the top edges of the bars
                  dataSource: widget.surveyGraph!,
                  width: 0.5,
                  xValueMapper: (SurveyGraph sales, _) => sales.day,
                  yValueMapper: (SurveyGraph sales, _) => sales.canceledSurvey,
                  name: 'canceled',
                  color: Color(0xffFFB100),
                ),
              ],
            ),
    );
  }
}

// class SalesData {
//   final String month;
//   final int sales1;
//   final int sales2;

//   SalesData(this.month, this.sales1, this.sales2);
// }
