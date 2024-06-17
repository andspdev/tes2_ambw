import 'package:flutter/material.dart';
import 'dart:async';

import './main_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {  
  const MyApp({super.key});

  @override  
  Widget build(BuildContext context) {  
    return const MaterialApp(  
      home: MyHomePage(),  
      debugShowCheckedModeBanner: false,  
    );  
  }  
}  

class MyHomePage extends StatefulWidget {  
  const MyHomePage({super.key});

  @override  
  SplashScreenState createState() => SplashScreenState();  
}  

class SplashScreenState extends State<MyHomePage> {  
  @override  
  void initState() {  
    super.initState();  
    Timer(const Duration(seconds: 4),  
        () => Navigator.pushReplacement(context,  
        MaterialPageRoute(builder:  
          (context) => MainHome()  
        )
      )  
    );
  }  

  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(
      title: 'Test 2 AMBW',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255)),
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 230, // Atur lebar gambar
            height: 230, // Atur tinggi gambar
            child: Image.asset('assets/logo-petra-news.jpg'),
          ),
        ),
      )
    );
  }  
}