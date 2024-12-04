import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class CategoryBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category Axis Bar Chart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BarChart(
          BarChartData(
            barGroups: _getBarGroups(),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    switch (value.toInt()) {
                      case 0:
                        return Text('Private');
                      case 1:
                        return Text('Commercial');
                      case 2:
                        return Text('Taxi');
                      case 3:
                        return Text('Bus');
                      case 4:
                        return Text('Truck');
                      default:
                        return Text('');
                    }
                  },
                  reservedSize: 600,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  getTitlesWidget: (value, meta) {
                    return Text(value.toInt().toString());
                  },
                ),
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            gridData: FlGridData(show: false),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _getBarGroups() {
    return [
      BarChartGroupData(x: 0, barRods: [
        BarChartRodData( width: 16, toY: 19,color: Colors.amberAccent),
      ]),
      BarChartGroupData(x: 1, barRods: [
        BarChartRodData( width: 16, toY: 7,),
      ]),
      BarChartGroupData(x: 2, barRods: [
        BarChartRodData( width: 16, toY: 13,color: Colors.deepPurple),
      ]),
      BarChartGroupData(x: 3, barRods: [
        BarChartRodData( width: 16,  toY: 20,color: Colors.red),
      ]),
      BarChartGroupData(x: 4, barRods: [
        BarChartRodData( width: 16, toY: 10,color: Colors.green
        )]),
    ];
  }
}
