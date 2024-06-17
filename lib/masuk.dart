import 'dart:html';

import 'package:flutter/material.dart';
import 'package:tes2_ambw/main_home.dart';

class Masuk extends StatefulWidget {
  const Masuk({super.key});

  @override
  _Masuk createState() => _Masuk();
}


class _Masuk extends State<Masuk>
{
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginSubmit() 
  {
    if (_formKey.currentState!.validate()) 
    {
      // Proses login

      // Kalau sukses
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => MainHome())
      );
    }
  }

  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      title: 'Masuk | Tes 2 AMBW',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 230, // Atur lebar gambar
                      height: 120, // Atur tinggi gambar
                      child: Image.asset('assets/logo-petra-news.jpg'),
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: const TextStyle(color: Color.fromARGB(255, 163, 162, 162)),
                        border: OutlineInputBorder(
                          borderRadius:  BorderRadius.circular(12.0),
                        ), 
                        focusedBorder: OutlineInputBorder(
                          borderRadius:  BorderRadius.circular(12.0),
                          borderSide: const BorderSide(color: Color.fromRGBO(47, 91, 143, 1), width: 1.5)
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:  BorderRadius.circular(12.0),
                          borderSide: const BorderSide(color: Color.fromRGBO(204, 204, 204, 1))
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                      ),
                      cursorColor: const Color.fromRGBO(47, 91, 143, 1),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) 
                      {
                        if (value == null || value.isEmpty) 
                        {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Kata sandi',
                        labelStyle: const TextStyle(color: Color.fromARGB(255, 163, 162, 162)),
                        border: OutlineInputBorder(
                          borderRadius:  BorderRadius.circular(12.0)
                        ), 
                        focusedBorder: OutlineInputBorder(
                          borderRadius:  BorderRadius.circular(12.0),
                          borderSide: const BorderSide(color: Color.fromRGBO(47, 91, 143, 1), width: 1.5)
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:  BorderRadius.circular(12.0),
                          borderSide: const BorderSide(color: Color.fromRGBO(204, 204, 204, 1))
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                        // Menambahkan border
                      ),
                      cursorColor: const Color.fromRGBO(47, 91, 143, 1),
                      obscureText: true,
                      validator: (value) 
                      {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 45, // Lebar 100%
                      child: ElevatedButton(
                      onPressed: loginSubmit,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(47, 91, 143, 1), // Background biru
                          foregroundColor: Colors.white, // Teks warna putih
                        ),
                        child: const Text('Masuk'),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            )
          )
        )
      )
    );
  }
}