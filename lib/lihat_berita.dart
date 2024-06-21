import 'package:flutter/material.dart';
import 'package:tes2_ambw/fragment/Beranda.dart';

class ViewNews extends StatefulWidget {
  final Map<String, dynamic> berita;

  const ViewNews({Key? key, required this.berita}) : super(key: key);

  @override
  _ViewNews createState() => _ViewNews();
}

class _ViewNews extends State<ViewNews> {
  @override
  Widget build(BuildContext context) {

    // Kalau mau ambil id berita
    print("\n\nID Berita: ${widget.berita['id']}\n\n");

    return MaterialApp(
      title: 'Edit Profil | Test 2 AMBW',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255)),
      home: Scaffold(
        body: Padding(
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
              SizedBox(height: 30), // Space between profile details and button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Beranda()),
                  );
                },
                child: Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
