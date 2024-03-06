import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0, // Remove plot area border
      borderWidth: 0,
      primaryXAxis: CategoryAxis(
        majorGridLines: MajorGridLines(width: 0), // Set width to 0 to remove vertical lines
        majorTickLines: const MajorTickLines(size: 0), // Set majorTickLines to null to remove horizontal lines
        axisLine: const AxisLine(width: 0), // Set axisLine to null to remove axis border
      ),
      primaryYAxis: NumericAxis(
        majorGridLines: MajorGridLines(width: 1), // Set width to control the thickness of the horizontal lines
        majorTickLines: const MajorTickLines(size: 0), // Set majorTickLines to null to remove vertical lines
        axisLine: const AxisLine(width: 0), // Set axisLine to null to remove axis border
        labelIntersectAction: AxisLabelIntersectAction.multipleRows, // Display labels in multiple rows
        labelFormat: '{value}', // Format the label to display only the value
      ),
      series: <CartesianSeries>[
        ColumnSeries<SalesData, String>(
          spacing: 0.4, // Adjust the spacing to add space between bars
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)), // Apply curve to the top edges of the bars
          dataSource: <SalesData>[
            SalesData('Jan', 35, 28),
            SalesData('Feb', 28, 30),
            SalesData('Mar', 34, 32),
            SalesData('Apr', 32, 35),
            SalesData('May', 40, 38),
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
            SalesData('Jan', 40, 38),
            SalesData('Feb', 30, 32),
            SalesData('Mar', 32, 34),
            SalesData('Apr', 35, 28),
            SalesData('May', 38, 30),
          ],
          xValueMapper: (SalesData sales, _) => sales.month,
          yValueMapper: (SalesData sales, _) => sales.sales2,
          name: 'Sales 2',
          color: Colors.red.shade500,
        ),
      ],
    );
  }
}

class SalesData {
  final String month;
  final int sales1;
  final int sales2;

  SalesData(this.month, this.sales1, this.sales2);
}
