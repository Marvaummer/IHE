import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ihe/commons/colors.dart';
import 'dart:convert';
import 'package:ihe/model/service_model.dart';

// Function to fetch data from the API with token
Future<List<ServiceModel>> fetchVehicleData() async {
  final url = Uri.parse("http://148.66.154.11/api/Vehicle/GetTotalVehicleList?userId=1");

  // Token
  final String token = "kMTcvwboAqKJL2exbAqcwD62_z36DM1zZXC3XFFe0dVOOLtwtq3JRrZ55m-W0leiJ6RojGurc6iFeOK3MQaO17jnpzDiXbZxxkelB5c7AjTHvTqbPPkGc1nY9T2M2aIG0g1mQaXOZAkEUJW1ulDhbvScQnq2oFkW_zdPXTS6SqMALixcE7f5ntv8jk7tLhB_10-FI2PIh6TppYK_1goGwG1SkdmdUDM6zm2mb1uVJUk";

  try {
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",  // Add the token to the request headers
      },
    );

    if (response.statusCode == 200) {
      // Parse the JSON and convert it into a list of ServiceModel objects
      return serviceModelFromJson(response.body);
    } else {
      print("Failed to load data. Status code: ${response.statusCode}");
      return [];
    }
  } catch (e) {
    print("Error occurred: $e");
    return [];
  }
}

class VehicleListPage extends StatefulWidget {
  @override
  _VehicleListPageState createState() => _VehicleListPageState();
}

class _VehicleListPageState extends State<VehicleListPage> {
  late Future<List<ServiceModel>> vehicleList;

  @override
  void initState() {
    super.initState();
    vehicleList = fetchVehicleData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myRed,
        title: Text('Vehicle List',style: TextStyle(color: Colors.white)),
      ),
      body: FutureBuilder<List<ServiceModel>>(
        future: vehicleList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No data available"));
          } else {
            // Data is available, display it in a ListView
            List<ServiceModel> vehicles = snapshot.data!;
            return ListView.builder(
              itemCount: vehicles.length,
              itemBuilder: (context, index) {
                ServiceModel vehicle = vehicles[index];
                return Card(
                  child: ListTile(
                    title: Text(vehicle.vehiclERegistrationNo ?? "Unknown Vehicle"),
                    subtitle: Text(vehicle.make ?? "Unknown Make"),
                    trailing: Text(vehicle.model ?? "Unknown Model"),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}