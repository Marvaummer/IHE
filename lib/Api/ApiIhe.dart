import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ihe/model/vehicle_ihemodel.dart';

class ApiService {
  // Define the base URL
  final String _baseUrl = "http://148.66.154.11/api/Vehicle/GetVehicleAtIHEList?userId=1";  // Replace with actual base URL

  // Define the token
  final String _token = "kMTcvwboAqKJL2exbAqcwD62_z36DM1zZXC3XFFe0dVOOLtwtq3JRrZ55m-W0leiJ6RojGurc6iFeOK3MQaO17jnpzDiXbZxxkelB5c7AjTHvTqbPPkGc1nY9T2M2aIG0g1mQaXOZAkEUJW1ulDhbvScQnq2oFkW_zdPXTS6SqMALixcE7f5ntv8jk7tLhB_10-FI2PIh6TppYK_1goGwG1SkdmdUDM6zm2mb1uVJUk";

  // Function to fetch the vehicle list
  Future<List<VehicleiheModel>> fetchVehicleList() async {
    final url = Uri.parse("$_baseUrl/api/Vehicle/GetTotalVehicleList?userId=1"); // Adjust the endpoint URL

    try {
      // Send the GET request with the token
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $_token",
        },
      );

      // Log the status code and body for debugging
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        // Parse and return the vehicle list
        return vehicleiheModelFromJson(response.body);
      } else {
        // Handle non-200 responses
        print("Failed to load data: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      // Catch and log any errors
      print("Error fetching vehicle data: $e");
      return [];
    }
  }
}
