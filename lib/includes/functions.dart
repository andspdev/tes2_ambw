import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import './variables.dart';


Future<Map<String, dynamic>> postData(String url, Map<String, dynamic> body) async 
{
  final response = await http.post(
    Uri.parse(url),

    headers: {
      "Content-Type": "application/x-www-form-urlencoded"
    },
    body: body,
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}


Future<Map<String, dynamic>> getData(String url) async 
{
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}


Future<void> saveToSharedPreferences(Map<String, dynamic> data) async 
{
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(USER_DATA, json.encode(data));
}


void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 2),
    ),
  );
}


Future<Map<String, dynamic>> getSharedPreferences(String user_data) async 
{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userDataString = prefs.getString(user_data);

  if (userDataString != null) {
    return json.decode(userDataString);
  } else {
    throw Exception('User data not found in SharedPreferences');
  }
}


Future<Map<String, dynamic>> getUserProfile() async {
  Map<String, dynamic> userProfile = await getSharedPreferences(USER_DATA);
  return userProfile;
}


Future<void> clearSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}