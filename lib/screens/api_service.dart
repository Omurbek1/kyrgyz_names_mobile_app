import 'package:http/http.dart' as http;
import 'dart:convert';
import 'name_model.dart'; // Ensure this import points to your Name model

class ApiService {
  // For iOS simulator, you can use localhost directly
  static const String _baseUrl = 'http://localhost:3000/persons';

  Future<List<Name>> fetchNames() async {
    final url = Uri.parse(_baseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Name.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load names from API');
    }
  }
}
