import 'package:flutter/material.dart';
import 'package:tes2_ambw/includes/functions.dart';
import 'package:tes2_ambw/includes/variables.dart';
import 'package:tes2_ambw/layouts/card_iklan.dart';
import 'package:tes2_ambw/layouts/card_tersimpan.dart';

class BacaNanti extends StatefulWidget {
  const BacaNanti({super.key});

  @override
  _BacaNanti createState() => _BacaNanti();
}

class _BacaNanti extends State<BacaNanti> {
  bool pressed = false;
  Future<void> tambahBacaNanti(BuildContext) async {
    if (!pressed) {
      const String apiUrl = '$URL_API/baca_nanti.php?act=add';
      var userprofile = await getUserProfile();
      String userid = userprofile['id'];
      String beritaid = '0083dcc6-2f87-11ef-98c8-0050564c5558';

      final Map<String, dynamic> requestBody = {
        'user_id': userid,
        'berita_id': beritaid
      };
      setState(() => pressed = false);
      try {
        final response = await postData(apiUrl, requestBody);
        final getMessages = response['messages'];
        print(getMessages);
      } catch (error) {
        print('Error');
        setState(() => pressed = false);
      }
    }
  }

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
              child: FutureBuilder<Map<String, dynamic>>(
                future: userdata,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
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
                        print(databerita);
                      }

                      return GridView.builder(
                          itemCount: databerita['berita'].length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 1,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                          ),
                          itemBuilder: (context, index) => cardTersimpan(
                              context, databerita['berita'], index));
                    },
                  );
                },
              ),
            )));

    // body: Padding(
    //   padding: const EdgeInsets.all(20.0),
    //   child: Center(
    //     child: GridView.builder(
    //         itemCount: 12,
    //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: 3,
    //           childAspectRatio: 1,
    //           crossAxisSpacing: 5,
    //           mainAxisSpacing: 5,
    //         ),
    //         itemBuilder: (context, index) {
    //           FutureBuilder<Map<String, dynamic>>(
    //               future: userdata,
    //               builder: (context, snapshot) {
    //                 if (snapshot.connectionState ==
    //                     ConnectionState.waiting) {
    //                   return loaderSmallCenter();
    //                 }

    //                 if (snapshot.hasError) {
    //                   return const Text(
    //                       'Terjadi kesalahan saat mengambil data berita.');
    //                 }

    //                 var data;
    //                 if (snapshot.hasData) {
    //                   data = snapshot.data;
    //                   // print("ini adalah data: ${data}");
    //                 }
    //                 //Untuk Mengambil user bookmark
    //                 return FutureBuilder<Map<String, dynamic>>(
    //                   future: getData(
    //                       '$URL_API/baca_nanti.php?user_id=${data['id']}'),
    //                   builder: (context, databookmark) {
    //                     if (databookmark.connectionState ==
    //                         ConnectionState.waiting) {
    //                       return loaderSmallCenter();
    //                     }

    //                     if (databookmark.hasError) {
    //                       return const Text(
    //                           'Terjadi kesalahan saat mengambil data berita.');
    //                     }

    //                     var databerita;
    //                     if (databookmark.hasData) {
    //                       databerita = databookmark.data;
    //                       print(databerita);
    //                     }

    //                     return
    //                         SizedBox(
    //                           height: 500,
    //                           child:
    //                               // Berita Terbaru
    //                               ListView.builder(
    //                             scrollDirection: Axis.vertical,
    //                             itemCount: databerita['berita'].length,
    //                             itemBuilder: (context, index) =>
    //                                 cardTersimpan(context,
    //                                     databerita['berita'], index),
    //                             // Text("${databerita}"),
    //                           ),
    //                     );
    //                   },
    //                 );
    //               });
    //           return SizedBox(
    //             child: Container(
    //               color: Colors.black,
    //             ),
    //           );
    //         }),
    //   ),
    // )
    //   body: SingleChildScrollView(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: <Widget>[
    //         const SizedBox(height: 20),
    //         // SizedBox(
    //         //   width: double.infinity,
    //         //   height: 45, // Lebar 100%
    //         //   child: ElevatedButton(
    //         //     onPressed: () => pressed ? null : tambahBacaNanti(context),
    //         //     style: ElevatedButton.styleFrom(
    //         //       backgroundColor: pressed
    //         //           ? COLOR_BTN_DISABLED
    //         //           : COLOR_PRIMARY, // Background biru
    //         //       foregroundColor: Colors.white, // Teks warna putih
    //         //     ),
    //         //     child: pressed
    //         //         ? const Text('Loading...')
    //         //         : const Text('Masuk'),
    //         //   ),
    //         // ),
    //         //Untuk mengambil user data
    //         FutureBuilder<Map<String, dynamic>>(
    //             future: userdata,
    //             builder: (context, snapshot) {
    //               if (snapshot.connectionState == ConnectionState.waiting) {
    //                 return loaderSmallCenter();
    //               }

    //               if (snapshot.hasError) {
    //                 return const Text(
    //                     'Terjadi kesalahan saat mengambil data berita.');
    //               }

    //               var data;
    //               if (snapshot.hasData) {
    //                 data = snapshot.data;
    //                 // print("ini adalah data: ${data}");
    //               }
    //               //Untuk Mengambil user bookmark
    //               return FutureBuilder<Map<String, dynamic>>(
    //                 future: getData(
    //                     '$URL_API/baca_nanti.php?user_id=${data['id']}'),
    //                 builder: (context, databookmark) {
    //                   if (databookmark.connectionState ==
    //                       ConnectionState.waiting) {
    //                     return loaderSmallCenter();
    //                   }

    //                   if (databookmark.hasError) {
    //                     return const Text(
    //                         'Terjadi kesalahan saat mengambil data berita.');
    //                   }

    //                   var databerita;
    //                   if (databookmark.hasData) {
    //                     databerita = databookmark.data;
    //                     print(databerita);
    //                   }

    //                   // return GridView.builder(
    //                   //     itemCount: 4,
    //                   //     gridDelegate:
    //                   //         SliverGridDelegateWithFixedCrossAxisCount(
    //                   //       crossAxisCount: 4,
    //                   //       childAspectRatio: 0.7,
    //                   //       crossAxisSpacing: 2,
    //                   //       mainAxisSpacing: 2,
    //                   //     ),
    //                   //     itemBuilder: (context, index) {
    //                   //       return SizedBox(
    //                   //         height: 200,
    //                   //         width: 200,
    //                   //         child: Container(color: Colors.black,),
    //                   //       );
    //                   //     });

    //                   // return SizedBox(
    //                   //               height: 200,
    //                   //               width: 200,
    //                   //               child: Container(color: Colors.black),
    //                   //             );

    //                   // Column(
    //                   //   crossAxisAlignment: CrossAxisAlignment.start,
    //                   //   children: <Widget>[
    //                   //     SizedBox(
    //                   //       height: 500,
    //                   //       child:
    //                   //           // Berita Terbaru
    //                   //           ListView.builder(
    //                   //         scrollDirection: Axis.vertical,
    //                   //         itemCount: databerita['berita'].length,
    //                   //         itemBuilder: (context, index) =>
    //                   //             cardTersimpan(
    //                   //                 context, databerita['berita'], index),
    //                   //         // Text("${databerita}"),
    //                   //       ),
    //                   //     )
    //                   //   ],
    //                   // );
    //                 },
    //               );
    //             }),
    //       ],
    //     ),
    //   ),
    // ));
  }
}
