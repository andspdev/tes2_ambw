import 'package:flutter/material.dart';
import 'package:tes2_ambw/includes/functions.dart';
import 'package:tes2_ambw/includes/variables.dart';

class Pencarian extends StatefulWidget {
  const Pencarian({super.key});

  @override
  _Pencarian createState() => _Pencarian();
}


class _Pencarian extends State<Pencarian>
{
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      title: 'Pencarian | Tes 2 AMBW',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: customAppBar(context),
        backgroundColor: COLOR_WHITE,
        body: null,
      )
    );
  }
}