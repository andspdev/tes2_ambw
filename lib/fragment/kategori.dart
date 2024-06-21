import 'package:flutter/material.dart';
import 'package:tes2_ambw/includes/functions.dart';
import 'package:tes2_ambw/includes/variables.dart';

class Kategori extends StatefulWidget {
  const Kategori({super.key});

  @override
  _Kategori createState() => _Kategori();
}


class _Kategori extends State<Kategori>
{
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      title: 'Kategori | Tes 2 AMBW',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: customAppBar(context),
        backgroundColor: COLOR_WHITE,
        body: null,
      )
    );
  }
}