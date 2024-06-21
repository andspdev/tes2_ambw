import 'package:flutter/material.dart';
import 'package:tes2_ambw/includes/functions.dart';
import 'package:tes2_ambw/includes/variables.dart';
import '/edit_profil.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  _Profil createState() => _Profil();
}

class _Profil extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Profil | Tes 2 AMBW',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: customAppBar(context),
          backgroundColor: COLOR_WHITE,
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/profile_picture.png'), // Add your image to the assets folder
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Column(
                    children: [
                      Text(
                        'Username',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Email: user@example.com',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Phone: (123) 456-7890',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Address: 123 Flutter St, Dart City',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      // Add more fields as needed
                    ],
                  ),
                ),
                SizedBox(height: 30), // Space between profile details and button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                  child: Text('Edit Profile'),
                ),
              ],
            ),
          ),
        ));
  }
}
