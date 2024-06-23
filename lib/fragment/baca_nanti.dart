import 'package:flutter/material.dart';
import 'package:tes2_ambw/includes/functions.dart';
import 'package:tes2_ambw/includes/variables.dart';
import 'package:tes2_ambw/layouts/card_tersimpan.dart';

class BacaNanti extends StatefulWidget {
  const BacaNanti({super.key});

  @override
  _BacaNanti createState() => _BacaNanti();
}

class _BacaNanti extends State<BacaNanti> {
  @override
  Widget build(BuildContext context) {
    Future<Map<String, dynamic>> userdata = getUserProfile();
    return MaterialApp(
        title: 'Baca Nanti | Test 2 AMBW',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: customAppBar(context),
            backgroundColor: COLOR_WHITE,
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    "TERSIMPAN",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: FutureBuilder<Map<String, dynamic>>(
                      future: userdata,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return loaderSmallCenter();
                        }

                        if (snapshot.hasError) {
                          return const Text(
                              'Terjadi kesalahan saat mengambil data berita.');
                        }

                        var data;
                        if (snapshot.hasData) {
                          data = snapshot.data;
                          // print("ini adalah data: ${data}");
                        }
                        return FutureBuilder<Map<String, dynamic>>(
                          future: getData(
                              '$URL_API/baca_nanti.php?user_id=${data['id']}'),
                          builder: (context, databookmark) {
                            if (databookmark.connectionState ==
                                ConnectionState.waiting) {
                              return loaderSmallCenter();
                            }

                            if (databookmark.hasError) {
                              return const Text(
                                  'Terjadi kesalahan saat mengambil data berita.');
                            }

                            var databerita;
                            if (databookmark.hasData) {
                              databerita = databookmark.data;
                            }

                            return GridView.builder(
                                itemCount: databerita['berita'].length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: getCrossAxisCount(context),
                                  childAspectRatio: getAspectRatio(context),
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5,
                                ),
                                itemBuilder: (context, index) => cardTersimpan(
                                    context, databerita['berita'], index));
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            )));
  }
}
