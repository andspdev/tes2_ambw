import 'package:flutter/material.dart';
import 'package:tes2_ambw/includes/functions.dart';
import 'package:tes2_ambw/includes/variables.dart';
import 'package:tes2_ambw/layouts/card_iklan.dart';
import 'package:tes2_ambw/layouts/card_iklan_highlight.dart';

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
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Berita Pilihan
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align to the start
                  children: <Widget>
                  [

                    FutureBuilder<Map<String, dynamic>>(
                      future: getData('$URL_API/home.php'),
                      builder: (context, snapshot) 
                      {
                        if (snapshot.connectionState == ConnectionState.waiting) 
                        {
                          return loaderSmallCenter();
                        }
                        
                        if (snapshot.hasError) 
                        {
                          return const Text('Terjadi kesalahan saat mengambil data berita.');
                        }
                        
                        var beritaPilihan = snapshot.data!['berita']['highlight'] as List;
                        var beritaTerbaru = snapshot.data!['berita']['terbaru'] as List;
                          

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Berita Terbaru
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: beritaPilihan.length,
                              itemBuilder: (context, index) => cardIklanHighlight(beritaPilihan, index)
                            ),


                          const SizedBox(height: 5),


                           const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text('Berita Pilihan', style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: COLOR_BLACK
                              )),
                            ),


                            const SizedBox(height: 20),


                            // Berita Terbaru
                            const Padding(
                              padding: EdgeInsets.only(bottom: 5), // Add some space above
                              child: Text('Berita Terbaru', style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: COLOR_BLACK
                              )),
                            ),


                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: beritaTerbaru.length,
                              itemBuilder: (context, index) => cardIklanStandar(beritaTerbaru, index)
                            ),
                          ],
                        );
                        
                      },
                    )



                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}