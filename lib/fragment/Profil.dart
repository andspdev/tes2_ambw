import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 70,
                                backgroundImage:
                                    AssetImage(data['profile_pic']),
                              ),
                              SizedBox(width: 20),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    "HI PETRANESIAN",
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    data['nama'],
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ]),
                        const SizedBox(height: 40),
                        const Divider(),
                        const SizedBox(height: 40),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0), // Add padding to the sides
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                color: Color.fromARGB(255, 255, 255, 255),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.person,
                                              size: 42,
                                            ),
                                          ]),
                                      SizedBox(width: 16),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start, // Ensure text starts from left
                                        children: [
                                          Text(
                                            'Nama',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  8), // Add some vertical spacing between "Email" and data
                                          Text(
                                            data['nama'],
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                color: Color.fromARGB(255, 255, 255, 255),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.email,
                                              size: 42,
                                            ),
                                          ]),
                                      SizedBox(width: 16),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start, // Ensure text starts from left
                                        children: [
                                          Text(
                                            'Email',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  8), // Add some vertical spacing between "Email" and data
                                          Text(
                                            data['email'],
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Card(
                                color: Color.fromARGB(255, 255, 255, 255),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.school,
                                              size: 42,
                                            ),
                                          ]),
                                      SizedBox(width: 16),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start, // Ensure text starts from left
                                        children: [
                                          Text(
                                            'Jurusan',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  8), // Add some vertical spacing between "Email" and data
                                          Text(
                                            data['jurusan'],
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Card(
                                color: Color.fromARGB(255, 255, 255, 255),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              size: 42,
                                            ),
                                          ]),
                                      SizedBox(width: 16),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start, // Ensure text starts from left
                                        children: [
                                          Text(
                                            'Last Login',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  8), // Add some vertical spacing between "Email" and data
                                          Text(
                                            data['login_terakhir'],
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
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
