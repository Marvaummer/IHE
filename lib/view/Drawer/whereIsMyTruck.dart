import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ihe/commons/colors.dart';

class Whereismytruck extends StatefulWidget {
  const Whereismytruck({super.key});

  @override
  State<Whereismytruck> createState() => _WhereismytruckState();
}

class _WhereismytruckState extends State<Whereismytruck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myRed,
        title: Text(
          'Where is my Truck?',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            _buildDataTable(context), // Pass the context here
          ],
        ),
      ),
    );
  }
}

Widget _buildDataTable(BuildContext context) { // Accept BuildContext as a parameter
  return Card(
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    margin: const EdgeInsets.symmetric(vertical: 8),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: MediaQuery.of(context).size.width, // Now you can safely use context
            constraints: BoxConstraints(
              maxHeight: 500, // Set a max height to prevent vertical overflow
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('  Driver Name اسم السائق')),
                  DataColumn(label: Text('  Customer العميل')),
                  DataColumn(label: Text('  Project Name إسم المشروع ')),
                  DataColumn(label: Text('موقع التحميل  Loading Location')),
                  DataColumn(label: Text('موقع التنزيل  Unloading Location')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('KULWINDER SINGH')),
                    DataCell(Text('GET(OLD PKG 3)')),
                    DataCell(Text('Get')),
                    DataCell(Text('Get')),
                    DataCell(Text('Lusail')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('KULWINDER SINGH')),
                    DataCell(Text('GET(OLD PKG 3)')),
                    DataCell(Text('Get')),
                    DataCell(Text('Get')),
                    DataCell(Text('Lusail')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('KULWINDER SINGH')),
                    DataCell(Text('GET(OLD PKG 3)')),
                    DataCell(Text('Get')),
                    DataCell(Text('Get')),
                    DataCell(Text('Lusail')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('KULWINDER SINGH LEMB SINGH')),
                    DataCell(Text('IHE')),
                    DataCell(Text('IHE NEW CAMP')),
                    DataCell(Text('MAZROAH')),
                    DataCell(Text('OLD CAMP')),
                  ]),
                  // ... add other DataRow entries here
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
