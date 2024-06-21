import 'package:flutter/material.dart';
import 'package:tes2_ambw/includes/functions.dart';
import 'package:tes2_ambw/includes/variables.dart';

class BacaNanti extends StatefulWidget {
  const BacaNanti({super.key});

  @override
  _BacaNanti createState() => _BacaNanti();
}


class _BacaNanti extends State<BacaNanti>
{
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      title: 'Baca Nanti | Test 2 AMBW',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: customAppBar(context),
        backgroundColor: COLOR_WHITE,
        body: null,
      )
    );
  }
}