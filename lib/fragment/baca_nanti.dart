import 'package:flutter/material.dart';
import 'package:tes2_ambw/includes/functions.dart';
import 'package:tes2_ambw/includes/variables.dart';
import 'package:tes2_ambw/layouts/card_iklan.dart';

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
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 45, // Lebar 100%
                  child: ElevatedButton(
                    onPressed: () => pressed ? null : tambahBacaNanti(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: pressed
                          ? COLOR_BTN_DISABLED
                          : COLOR_PRIMARY, // Background biru
                      foregroundColor: Colors.white, // Teks warna putih
                    ),
                    child: pressed
                        ? const Text('Loading...')
                        : const Text('Masuk'),
                  ),
                ),
                //Untuk mengambil user data
                FutureBuilder<Map<String, dynamic>>(
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
                      //Untuk Mengambil user bookmark
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

                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Berita Terbaru
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: databerita['berita'].length,
                                  itemBuilder: (context, index) =>
                                      cardIklanStandar(context, databerita['berita'], index),
                                      // Text("${databerita}"),
                                ),
                              ]);
                        },
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}
