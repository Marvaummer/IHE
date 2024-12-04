import 'package:flutter/material.dart';
import 'package:ihe/Api/apioutservice.dart';
import 'package:ihe/commons/colors.dart';
import 'package:ihe/model/outOfService_model.dart';


class OutOfServiceVehiclesPage extends StatefulWidget {
  @override
  _OutOfServiceVehiclesPageState createState() => _OutOfServiceVehiclesPageState();
}

class _OutOfServiceVehiclesPageState extends State<OutOfServiceVehiclesPage> {
  late Future<List<OutOfServiceModel>> _outOfServiceVehicles;

  @override
  void initState() {
    super.initState();
    _outOfServiceVehicles = Apioutservice().fetchVehicleOutOfServiceList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myRed,
        title: Text('Out of Service Vehicles',style: TextStyle(color: Colors.white)),
      ),
      body: FutureBuilder<List<OutOfServiceModel>>(
        future: _outOfServiceVehicles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No out of service vehicles found.'));
          }

          final vehicles = snapshot.data!;
          return ListView.builder(
            itemCount: vehicles.length,
            itemBuilder: (context, index) {
              final vehicle = vehicles[index];
              return ListTile(
                title: Text(vehicle.vehiclERegistrationNo ?? 'Unknown'),
                subtitle: Text(vehicle.make ?? 'Unknown'),
              );
            },
          );
        },
      ),
    );
  }
}
