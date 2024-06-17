import 'package:flutter/material.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  _Beranda createState() => _Beranda();
}


class _Beranda extends State<Beranda>
{
  @override
  Widget build(BuildContext context) 
  {
    return const MaterialApp(
      title: 'Beranda | Tes 2 AMBW',
      debugShowCheckedModeBanner: false,
      home: null
    );
  }
}