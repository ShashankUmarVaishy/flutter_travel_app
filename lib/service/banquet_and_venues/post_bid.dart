import 'dart:convert';
import 'package:http/http.dart' as http;

class BanquetAndVenueService {
  static const String baseUrl =
      "https://flutter-travel-app-backend.onrender.com/api/v1/banq_and_ven";

  static Future<Map<String, dynamic>> postBid(Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('$baseUrl/bid'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    final data = jsonDecode(response.body);

    return {
      "statusCode": response.statusCode,
      "data": data,
    };
  }
}
