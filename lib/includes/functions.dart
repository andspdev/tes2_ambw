import 'package:http/http.dart' as http;
import 'dart:convert';


Future<Map<String, dynamic>> postData(String url, Map<String, dynamic> body) async 
{
  final response = await http.post(
    Uri.parse(url),

    headers: {"Content-Type": "application/json"},
    body: json.encode(body),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}