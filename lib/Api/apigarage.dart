import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ihe/model/vehicle_garagemodel.dart';  // Import your model here

class ApiServiceGarage {
  final String _baseUrl = "http://148.66.154.11/api/Vehicle";
  final String _token = "kMTcvwboAqKJL2exbAqcwD62_z36DM1zZXC3XFFe0dVOOLtwtq3JRrZ55m-W0leiJ6RojGurc6iFeOK3MQaO17jnpzDiXbZxxkelB5c7AjTHvTqbPPkGc1nY9T2M2aIG0g1mQaXOZAkEUJW1ulDhbvScQnq2oFkW_zdPXTS6SqMALixcE7f5ntv8jk7tLhB_10-FI2PIh6TppYK_1goGwG1SkdmdUDM6zm2mb1uVJUk";

  // Function to fetch the vehicle list
  Future<List<VehiclegarageModel>> fetchVehicleAtGarageList() async {
    final url = Uri.parse("$_baseUrl/GetVehicleAtGarageList?userId=1");

    try {
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $_token",
          "Accept": "application/json",
        },
      );

      if (response.statusCode == 200) {
        // Parsing the JSON response
        return vehiclegarageModelFromJson(response.body);
      } else {
        // Log the response details for debugging
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        if (response.body.isNotEmpty) {
          final errorResponse = json.decode(response.body);
          print('Error message: ${errorResponse['message']}');
        }
        throw Exception('Failed to load vehicles: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
