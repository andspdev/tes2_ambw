import 'package:flutter/material.dart';
import 'package:tes2_ambw/includes/functions.dart';
import './main_home.dart';
import './masuk.dart';
import 'dart:async';

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


class SplashScreenState extends State<MyHomePage> 
{  
  @override  
  void initState()
  {
    super.initState();  

    Future.delayed(Duration.zero, () async 
    {
      try {
        Map<String, dynamic> userProfile = await getUserProfile();
        Widget nextPage = userProfile['id'] != null ? MainHome() : const Masuk();

        navigateToNextPage(nextPage);

      } catch (e) 
      {
        navigateToNextPage(const Masuk());
      }
    });
  }  

  void navigateToNextPage(Widget page) {
    Timer(const Duration(seconds: 0), () => Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page)
    ));
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