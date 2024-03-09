import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0, // Remove plot area border
        borderWidth: 0,
        primaryXAxis: CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
          majorTickLines: const MajorTickLines(size: 0),
          axisLine: const AxisLine(width: 0),
        ),

        primaryYAxis: NumericAxis(
          minimum: 0, // Set the minimum value for the axis
          maximum: 250, // Set the maximum value for the axis
          interval: 50, // Set the interval between each label
          majorGridLines: MajorGridLines(width: 1),
          majorTickLines: const MajorTickLines(size: 0),
          axisLine: const AxisLine(width: 0),
          labelIntersectAction: AxisLabelIntersectAction.multipleRows,
          labelFormat: '{value}',
        ),
        series: <CartesianSeries>[
          ColumnSeries<SalesData, String>(
            spacing: 0.4, // Adjust the spacing to add space between bars
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)), // Apply curve to the top edges of the bars
            dataSource: <SalesData>[
              SalesData('Jan', 156, 240),
              SalesData('Feb', 190, 30),
              SalesData('Mar', 160, 32),
              SalesData('Apr', 150, 35),
              SalesData('May', 200, 38),
              SalesData('Jun', 150, 39), // New data for June
            ],
            xValueMapper: (SalesData sales, _) => sales.month,
            yValueMapper: (SalesData sales, _) => sales.sales1,
            name: 'Sales 1',
            color: Colors.blue.shade900,
          ),
          ColumnSeries<SalesData, String>(
            spacing: 0.4, // Adjust the spacing to add space between bars
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)), // Apply curve to the top edges of the bars
            dataSource: <SalesData>[
              SalesData('Jan', 240, 240),
              SalesData('Feb', 30, 250),
              SalesData('Mar', 32, 210),
              SalesData('Apr', 35, 200),
              SalesData('May', 38, 240),
              SalesData('Jun', 37, 200), // New data for June
            ],
            xValueMapper: (SalesData sales, _) => sales.month,
            yValueMapper: (SalesData sales, _) => sales.sales2,
            name: 'Sales 2',
            color: Colors.red.shade500,
          ),
        ],
      ),
    );
  }
}

class SalesData {
  final String month;
  final int sales1;
  final int sales2;

  SalesData(this.month, this.sales1, this.sales2);
}
