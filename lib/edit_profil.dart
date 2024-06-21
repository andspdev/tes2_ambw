import 'package:flutter/material.dart';
import './main_home.dart';
import './lihat_berita.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  @override
  _EditProfile createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Berita | Test 2 AMBW',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255)),
      home: Scaffold(
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
              SizedBox(height: 20),
              const Center(
                child: Column(
                  children: [
                    Text(
                      'Username',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
              const SizedBox(height: 30), // Space between profile details and button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainHome(initialIndex: 4,)),
                  );
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
