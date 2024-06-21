import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  _Profil createState() => _Profil();
}

class _Profil extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/profile_picture.png'), // Add your image to the assets folder
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'Username',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
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
    );
  }
}
