import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ihe/commons/colors.dart';

class ServiceHistory extends StatefulWidget {
  const ServiceHistory({super.key});

  @override
  State<ServiceHistory> createState() => _ServiceHistoryState();
}

class _ServiceHistoryState extends State<ServiceHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar:AppBar(
          backgroundColor: myRed,
          title: Text('Service History',style: TextStyle(color: Colors.white),)
      ,) ,

    body: Center(child:Column(
    children: [
    _buildDataTable(),
    ],
    )));
  }
}
Widget _buildDataTable() {
  return Card(
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    margin: const EdgeInsets.symmetric(vertical: 8),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:
        Column(
          children: [

            SizedBox(height: 20),
            DataTable(
              columns: [
                DataColumn(label: Text('SN')),
                DataColumn(label: Text('Truck No ')),
                DataColumn(label: Text('Month')),
                DataColumn(label: Text('Diesel')),
                DataColumn(label: Text('Spare Paris ')),
                DataColumn(label: Text('Car Wash ')),
                DataColumn(label: Text('Total S+W')),
                DataColumn(label: Text('Fine/Ins/GPS')),
                DataColumn(label: Text('Tyre')),
                DataColumn(label: Text('Total')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('9881')),
                  DataCell(Text('Jan-24')),
                  DataCell(Text('8671')),
                  DataCell(Text('397.24')),
                  DataCell(Text('300')),
                  DataCell(Text('697.24')),
                  DataCell(Text('-')),
                  DataCell(Text('1430.76')),
                  DataCell(Text('10,799.00')),
                ]),
                DataRow(cells: [
                  DataCell(Text('2')),
                  DataCell(Text('9881')),
                  DataCell(Text('Feb-24')),
                  DataCell(Text('6446.1')),
                  DataCell(Text('1080.6')),
                  DataCell(Text('300')),
                  DataCell(Text('1380.6')),
                  DataCell(Text('-')),
                  DataCell(Text('3760.00')),
                  DataCell(Text('11586.7')),
                ]),
                DataRow(cells: [
                  DataCell(Text('3')),
                  DataCell(Text('9881')),
                  DataCell(Text('Mar-24')),
                  DataCell(Text('7248.5')),
                  DataCell(Text('1550.65')),
                  DataCell(Text('300')),
                  DataCell(Text('1850.65')),
                  DataCell(Text('-')),
                  DataCell(Text('-')),
                  DataCell(Text('9099.15')),
                ]),
                DataRow(cells: [
                  DataCell(Text('4')),
                  DataCell(Text('9881')),
                  DataCell(Text('Apr-24')),
                  DataCell(Text('17934.00')),
                  DataCell(Text('1614.44')),
                  DataCell(Text('300')),
                  DataCell(Text('1914.44')),
                  DataCell(Text('-')),
                  DataCell(Text('-')),
                  DataCell(Text('9848.44')),
                ]),
                DataRow(cells: [
                  DataCell(Text('5')),
                  DataCell(Text('9881')),
                  DataCell(Text('May-24')),
                  DataCell(Text('6217.4')),
                  DataCell(Text('1652.92')),
                  DataCell(Text('300')),
                  DataCell(Text('1952.92')),
                  DataCell(Text('250')),
                  DataCell(Text('620')),
                  DataCell(Text('9040.32')),
                ]),
                DataRow(cells: [
                  DataCell(Text('6')),
                  DataCell(Text('9881')),
                  DataCell(Text('Jun-24')),
                  DataCell(Text('4561.22')),
                  DataCell(Text('1203.26')),
                  DataCell(Text('300')),
                  DataCell(Text('1503.26')),
                  DataCell(Text('-')),
                  DataCell(Text('5546.28')),
                  DataCell(Text('11610.76')),
                ]),
                DataRow(cells: [
                  DataCell(Text('7')),
                  DataCell(Text('9881')),
                  DataCell(Text('july-24')),
                  DataCell(Text('5827.00')),
                  DataCell(Text('2297.35')),
                  DataCell(Text('300')),
                  DataCell(Text('2597.35')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('8424.35')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Total')),
                  DataCell(Text('')),
                  DataCell(Text('')),
                  DataCell(Text('46905.22')),
                  DataCell(Text('9796.46')),
                  DataCell(Text('2100.00')),
                  DataCell(Text('11896.46')),
                  DataCell(Text('250')),
                  DataCell(Text('11357.04')),
                  DataCell(Text('70408.72')),
                ]),

              ],
            ),
       ],
        ),
      ),
    )
  );
  }

