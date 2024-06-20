import 'package:flutter/material.dart';
import './includes/functions.dart';
import './includes/variables.dart';
import './main_home.dart';

class Masuk extends StatefulWidget {
  const Masuk({super.key});

  @override
  _Masuk createState() => _Masuk();
}


class _Masuk extends State<Masuk>
{
  bool is_submit = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Future<void> loginSubmit(BuildContext context) async 
  {
    if (!is_submit)
    { 
      const String apiUrl = '$URL_API/masuk.php';
      final String email_val = _emailController.value.text.trim();
      final String password_val = _passwordController.value.text.trim();

      if (email_val.isNotEmpty && password_val.isNotEmpty)
      {
        setState(() => is_submit = true);

        final Map<String, dynamic> requestBody = {
          'email': email_val,
          'password': password_val,
        };

        try 
        {
          final response = await postData(apiUrl, requestBody);
          final getMessages = response['messages'];

          if (getMessages != null)
          {
            final getErrors = getMessages['errors'];
            if (getErrors != null)
            {
              if (getErrors['email'] != null)
              {
                showSnackBar(context, getErrors['email']);
              }
              else if (getErrors['password'] != null)
              {
                showSnackBar(context, getErrors['password']);
              }
            }
          }
          else
          {
            // Simpan response ke Shared Preferences
            await saveToSharedPreferences(response['data_user']);

            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => MainHome())
            );
          }

          setState(() => is_submit = false);
        } catch (error) 
        {
          showSnackBar(context, error.toString());
          setState(() => is_submit = false);
        }
      }
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
        body: Builder(
          builder: (context) => Center(
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
                              borderSide: const BorderSide(color: COLOR_PRIMARY, width: 1.5)
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:  BorderRadius.circular(12.0),
                              borderSide: const BorderSide(color: Color.fromRGBO(204, 204, 204, 1))
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                          ),
                          cursorColor: COLOR_PRIMARY,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) 
                          {
                            if (value == null || value.isEmpty) 
                            {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          enabled: !is_submit
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
                              borderSide: const BorderSide(color: COLOR_PRIMARY, width: 1.5)
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:  BorderRadius.circular(12.0),
                              borderSide: const BorderSide(color: Color.fromRGBO(204, 204, 204, 1))
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                            // Menambahkan border
                          ),
                          cursorColor: COLOR_PRIMARY,
                          obscureText: true,
                          validator: (value) 
                          {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }

                            return null;
                          },
                          enabled: !is_submit
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 45, // Lebar 100%
                          child: ElevatedButton(
                            onPressed: () => is_submit ? null : loginSubmit(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: is_submit ? COLOR_BTN_DISABLED : COLOR_PRIMARY, // Background biru
                              foregroundColor: Colors.white, // Teks warna putih
                            ),
                            child: is_submit ? const Text('Loading...') : const Text('Masuk'),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                )
              )
            )
        ),
      )
    );
  }
}