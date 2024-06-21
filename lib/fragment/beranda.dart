import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tes2_ambw/includes/functions.dart';
import 'package:tes2_ambw/includes/variables.dart';
import 'package:tes2_ambw/layouts/card_iklan.dart';

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
                            const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text('Berita Pilihan', style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: COLOR_BLACK
                              )),
                            ),


                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: beritaPilihan.length,
                              itemBuilder: (context, index) 
                              {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      // Thumbnail
                                      Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12.0),
                                          image: DecorationImage(
                                            image: NetworkImage(beritaPilihan[index]['thumbnail']),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),

                                      // Details
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            // Judul (dibatasi 2 baris)
                                            Text(
                                              beritaPilihan[index]['judul_berita'],
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0,
                                              ),
                                            ),

                                            // Waktu dibuat
                                            Text(
                                              "${beritaPilihan[index]['dibuat_pada']}",
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12.0,
                                              ),
                                            ),

                                            // Kategori
                                            Text(
                                              "${beritaPilihan[index]['nama_kategori']}",
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
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
                              itemBuilder: (context, index) {
                                return cardIklanStandar(beritaTerbaru, index);
                              },
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