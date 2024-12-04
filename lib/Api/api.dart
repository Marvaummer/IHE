// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:ihe/model/service_model.dart';
// class ApiService {
//   Future<List<ServiceModel>> fetchServiceList(String userId) async {
//     final String apiUrl = 'http://148.66.154.11/apiVehicle/GetTotalVehicleList?userId=$userId';
//
//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: {
//         'Content-Type': 'application/json',
//         // Include authorization token if needed
//         'Authorization': 'Bearer your_token_here',
//       },
//     );
//
//     if (response.statusCode == 200) {
//       return serviceModelFromJson(response.body);
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }

//http://148.66.154.11/api/Vehicle/GetTotalVehicleList?userId=1
//http://148.66.154.11/Help/Api/POST-api-Vehicle-GetVehicleAtIHEList?userId={userId}