import 'package:flutter/material.dart';
import 'package:ihe/Api/ApiIhe.dart';
import 'package:ihe/commons/colors.dart';
import 'package:ihe/model/vehicle_ihemodel.dart';



class VehicleIhe extends StatefulWidget {
  @override
  _VehicleIheState createState() => _VehicleIheState();
}

class _VehicleIheState extends State<VehicleIhe> {
  late Future<List<VehicleiheModel>> futureVehicleList;

  @override
  void initState() {
    super.initState();
    futureVehicleList = ApiService().fetchVehicleList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myRed,
        title: Text('Vehicle IHE',style: TextStyle(color: Colors.white)),
      ),
      body: FutureBuilder<List<VehicleiheModel>>(
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
                  subtitle: Text('${vehicle.make} ${vehicle.model}'),
                  trailing: Text(vehicle.color ?? 'Unknown color'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
