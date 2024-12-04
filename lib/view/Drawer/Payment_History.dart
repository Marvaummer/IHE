import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ihe/commons/colors.dart';
import 'dart:convert';

import 'package:ihe/model/payment_model.dart'; // Ensure this import is correct and your model is well-defined.

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  List<Paymentmodel> paymentHistory = [];
  bool isLoading = true; // To track loading state
  String errorMessage = ''; // To store error message

  @override
  void initState() {
    super.initState();
    fetchPaymentHistory();
  }

  Future<void> fetchPaymentHistory() async {
    try {
      var body = jsonEncode({
        'vehicleOwnerId': '12345', // Replace with actual data if needed
      });

      final response = await http.post(
        Uri.parse('http://148.66.154.11/api/Payment/GetPaymentListByVehicleOwner'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer l_oYjBoK7PltVdBnBIJ13pshEAm5rN3zTECi5A4TE3JXQNd0g3HPXB6zugLurmXIpDtNkAzVy0crgVEQ3J0tR7Wswc_rXuu_MCV3hYA9DBqmGEc_L5wpBHGWLN9dZEDnxO6A74yexwjmSxCA6QUKJ4EYiQIJKd13K169IGQtJ24nR288VyrAUzrR5fwGC6iN8ofY7ReAQE1iTctGH351Qp2GbeW_CaYSy6IcRSXtkrQ',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        setState(() {
          paymentHistory = paymentmodelFromJson(response.body);
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load payment history: ${response.body}';
          isLoading = false;
        });
        print('Error: ${response.body}');
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error: $e';
        isLoading = false;
      });
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myRed, // Use your color
        title: Text('Payment History', style: TextStyle(color: Colors.white)),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
          ? Center(child: Text(errorMessage))
          : SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columns: [
              DataColumn(label: Text('Date')),
              DataColumn(label: Text('Truck No')),
              // DataColumn(label: Text('Total Income')),
              // DataColumn(label: Text('Total Expenses')),
              DataColumn(label: Text('Total Balance')),
              // DataColumn(label: Text('PV No')),
              DataColumn(label: Text('Paid Amount')),
            ],
            rows: paymentHistory.map((payment) {
              return DataRow(cells: [
                DataCell(Text(payment?.pvdate?.toLocal().toString().split(' ')[0] ?? '')),
                DataCell(Text(payment?.vid?.toString() ?? '')),
                DataCell(Text(payment?.pvpaidamt?.toString() ?? '')),
                DataCell(Text(payment?.pvpaidamt?.toString() ?? '')),
                // DataCell(Text(payment?.pvnarration != null
                //     ? (payment.pvpaidamt!.toInt()).toString() // Convert double to int
                //     : '')),
                // DataCell(Text(payment?.pvno ?? '')),
                // Handling pvpaidamt: convert to int if it's a double
                // DataCell(Text(payment?.pvpaymode != null
                //     ? (payment.pvpaidamt!.toInt()).toString() // Convert double to int
                //     : '')),
              ]);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
