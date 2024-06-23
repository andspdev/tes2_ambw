import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tes2_ambw/includes/functions.dart';
import 'package:tes2_ambw/includes/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: MediaQuery.of(context).size.width*0.1,
                                  backgroundImage:
                                      AssetImage(data['profile_pic']),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.03),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "HI PETRANESIAN",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      data['nama'].split(' ').first,
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ]),
                          SizedBox(height: MediaQuery.of(context).size.width*0.05),
                          const Divider(),
                          SizedBox(height: MediaQuery.of(context).size.width*0.05),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  child: Padding(
                                    padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),
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
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                              ),
                                            ]),
                                        SizedBox(width: MediaQuery.of(context).size.width*0.03),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start, // Ensure text starts from left
                                          children: [
                                            Text(
                                              'Nama',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.025,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                                height:
                                                    MediaQuery.of(context).size.width*0.015), // Add some vertical spacing between "Email" and data
                                            Text(
                                              data['nama'],
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.025,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.width*0.015),
                                Card(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  child: Padding(
                                    padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),
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
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                              ),
                                            ]),
                                        SizedBox(width: MediaQuery.of(context).size.width*0.03),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start, // Ensure text starts from left
                                          children: [
                                            Text(
                                              'Email',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.025,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                                height:
                                                    MediaQuery.of(context).size.width*0.015), // Add some vertical spacing between "Email" and data
                                            Text(
                                              data['email'],
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.025,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.width*0.015),
                                Card(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  child: Padding(
                                    padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),
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
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                              ),
                                            ]),
                                        SizedBox(width: MediaQuery.of(context).size.width*0.03),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start, // Ensure text starts from left
                                          children: [
                                            Text(
                                              'Jurusan',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.025,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                                height:
                                                    8), // Add some vertical spacing between "Email" and data
                                            Text(
                                              data['jurusan'],
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.025,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.width*0.015),
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
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                              ),
                                            ]),
                                        SizedBox(width: MediaQuery.of(context).size.width*0.03),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start, // Ensure text starts from left
                                          children: [
                                            Text(
                                              'Last Login',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.025,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                                height:
                                                    MediaQuery.of(context).size.width*0.015), // Add some vertical spacing between "Email" and data
                                            Text(
                                              data['login_terakhir'],
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.025,
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
                          SizedBox(height: MediaQuery.of(context).size.width*0.03),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const Center(child: Text('No user data found.'));
                }
              }),
        ));
  }
}
