import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tes2_ambw/masuk.dart';
import './variables.dart';

Future<Map<String, dynamic>> postData(
    String url, Map<String, dynamic> body) async {
  final response = await http.post(
    Uri.parse(url),
    headers: {"Content-Type": "application/x-www-form-urlencoded"},
    body: body,
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

Future<Map<String, dynamic>> getData(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

Future<void> saveToSharedPreferences(Map<String, dynamic> data) async {
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

Future<Map<String, dynamic>> getSharedPreferences(String user_data) async {
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

Future<void> removeValueFromSharedPreferences(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove(key);
}

PreferredSize customAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60.0),
    child: Container(
      decoration: const BoxDecoration(
        color: COLOR_WHITE,
        border: Border(
          bottom: BorderSide(
            color: COLOR_BORDER_GREY, // Warna border
            width: 1.0, // Ketebalan border
          ),
        ),
      ),
      child: SafeArea(
        child: Container(
          height: 60.0, // Set the height of the custom AppBar
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Image.asset(
                  ASSET_IMG_LOGO,
                  height: 28,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.logout_outlined,
                    color: COLOR_BLACK,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Akhiri Session'),
                          backgroundColor: Colors.grey[200],
                          content: const Text('Anda yakin ingin keluar?'),
                          actions: <Widget>[
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<
                                        Color>(
                                    COLOR_PRIMARY), // Ubah warna teks tombol
                              ),
                              child: const Text('Tidak'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<
                                        Color>(
                                    COLOR_PRIMARY), // Ubah warna teks tombol
                              ),
                              child: const Text('Ya'),
                              onPressed: () {
                                removeValueFromSharedPreferences(USER_DATA);
                                Navigator.of(context).pop();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Masuk()));
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Center loaderSmallCenter() {
  return const Center(
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(COLOR_PRIMARY),
          strokeWidth: 2.5,
        ),
      ),
    ),
  );
}

double getAspectRatio(BuildContext context) {
  final double screenWidth = MediaQuery.of(context).size.width;
  print('Width: ${MediaQuery.of(context).size.width}');
  if (screenWidth >= 800) {
    final double hasil = ((screenWidth * 0.57) / 1000) * 2;
    return (hasil);
  } else if (screenWidth >= 700) {
    final double hasil = ((screenWidth * 0.68) / 1000) * 2;
    return (hasil);
  } else if (screenWidth >= 500) {
    final double hasil = ((screenWidth * 0.7) / 1000) * 2;
    return (hasil);
  } else if (screenWidth >= 340) {
    final double hasil = ((screenWidth * 0.8) / 1000) * 2;
    return (hasil);
  } else {
    final double hasil = ((screenWidth * 0.9) / 1000) * 2;
    return (hasil);
  }
}

int getCrossAxisCount(BuildContext context) {
  final double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth >= 1000) {
    return 3;
  } else {
    return 2;
  }
}

double getImageHeight(BuildContext context) {
  final double screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth >= 1000) {
    final double hasil = (screenWidth / 10);
    return hasil;
  } else if (screenWidth >= 600) {
    final double hasil = (screenWidth / 3.5);
    return hasil;
  } else {
    final double hasil = (screenWidth / 3);
    return hasil;
  }
}
