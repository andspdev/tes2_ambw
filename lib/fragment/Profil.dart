import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tes2_ambw/includes/functions.dart';
import 'package:tes2_ambw/includes/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/lihat_berita.dart';
import '/fragment/beranda.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  _Profil createState() => _Profil();
}

class _Profil extends State<Profil> {
  Future<Map<String, dynamic>> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(USER_DATA);

    if (jsonString != null) {
      Map<String, dynamic> userData = json.decode(jsonString);
      return userData;
    }
    return {};
  }

  @override
  Widget build(BuildContext context) {
    Future<Map<String, dynamic>> userData = getData();
    return MaterialApp(
        title: 'Profil | Tes 2 AMBW',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: customAppBar(context),
          backgroundColor: COLOR_WHITE,
          body: FutureBuilder<Map<String, dynamic>>(
              future: userData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  Map<String, dynamic> data = snapshot.data!;
                  return Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(data['profile_pic']),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                data['nama'],
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20),
                              Text(
                                data['email'],
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 10),
                              Text(
                                data['jurusan'],
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 10),
                              Text(
                                data['login_terakhir'],
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  );
                } else {
                  return Center(child: Text('No user data found.'));
                }
              }),
        ));
  }
}
