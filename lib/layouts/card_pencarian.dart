import 'package:flutter/material.dart';
import 'package:tes2_ambw/includes/variables.dart';
import 'package:tes2_ambw/includes/functions.dart';
import 'package:tes2_ambw/lihat_berita.dart';

Widget cardPencarian(
    BuildContext context, List<Map<String, dynamic>> berita, int index) {
  Widget getFontSizeJudul(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth >= 425) {
      return Text(
        berita[index]['judul_berita'],
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      );
    } else {
      return Text(
        berita[index]['judul_berita'],
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      );
    }
  }

  return GestureDetector(
    onTap: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ViewNews(berita: berita[index], page: 2),
        ),
      );
    },
    child: SizedBox(
      height: 200,
      width: 200,
      child: Card(
        color: COLOR_WHITE,
        surfaceTintColor: COLOR_WHITE,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: COLOR_BORDER_GREY),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Foto
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: SizedBox(
                width: double.infinity,
                child: FadeInImage.assetNetwork(
                  placeholder: ASSET_IMG_THUMBNAIL_LOADER,
                  image: berita[index]['thumbnail'],
                  width: 120,
                  height: getImageHeight(context),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  getFontSizeJudul(context),
                  Text(
                    berita[index]['dibuat_pada'],
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    berita[index]['nama_kategori'],
                    style: const TextStyle(
                      fontSize: 12,
                      color: COLOR_PRIMARY,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
