import 'package:flutter/material.dart';
import 'package:ihe/Api/apigarage.dart';
import 'package:ihe/commons/colors.dart';
import 'package:ihe/model/vehicle_garagemodel.dart';  // Import the model

class Vehiclegarage extends StatefulWidget {
  @override
  _VehiclegarageState createState() => _VehiclegarageState();
}

class _VehiclegarageState extends State<Vehiclegarage> {
  late Future<List<VehiclegarageModel>> futureVehicleList;

  @override
  void initState() {
    super.initState();
    // Fetch the vehicle list when the widget is initialized
    futureVehicleList = ApiServiceGarage().fetchVehicleAtGarageList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myRed,
        title: Text('Vehicle Garage List',style: TextStyle(color: Colors.white),),
      ),
      body: FutureBuilder<List<VehiclegarageModel>>(
        future: futureVehicleList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No vehicles found.'));
          } else {
            final vehicles = snapshot.data!;
            return ListView.builder(
              itemCount: vehicles.length,
              itemBuilder: (context, index) {
                final vehicle = vehicles[index];
                return ListTile(
                  title: Text(vehicle.vehiclERegistrationNo ?? 'No Registration'),
                  subtitle: Text('${vehicle.make ?? 'Unknown Make'} ${vehicle.model ?? 'Unknown Model'}'),
                  trailing: Text(vehicle.color ?? 'Unknown Color'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
