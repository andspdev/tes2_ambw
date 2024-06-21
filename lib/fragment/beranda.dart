import 'package:flutter/material.dart';
import 'package:tes2_ambw/includes/functions.dart';
import 'package:tes2_ambw/includes/variables.dart';

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
    return MaterialApp(
      title: 'Beranda | Tes 2 AMBW',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: customAppBar(context),
        backgroundColor: COLOR_WHITE,
        body: null,
      )
    );
  }
}