import 'package:flutter/material.dart';
import 'package:tes2_ambw/includes/variables.dart';
import 'package:tes2_ambw/lihat_berita.dart';

Widget cardTersimpan(context, berita, int index) 
{
  return GestureDetector(
    onTap: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ViewNews(berita: berita[index])),
      );
    },
    child: SizedBox(
      height: 250,
      width: 200,
      child: Card(
        color: COLOR_WHITE,
        surfaceTintColor: COLOR_WHITE,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: COLOR_BORDER_GREY
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), 
                topRight: Radius.circular(10)
              ),
              child: SizedBox(
                height: 180,
                width: double.infinity,
                child: FadeInImage.assetNetwork(
                  placeholder: ASSET_IMG_THUMBNAIL_LOADER, 
                  image: berita[index]['thumbnail'],
                  width: 120,
                  height: 180,
                  fit: BoxFit.cover,
                )
              ),
            ),

        
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  Text(
                    berita[index]['judul_berita'],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  
                  // Tanggal
                  Text(
                    berita[index]['dibuat_pada'],
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Kategori
                  Text(
                    berita[index]['nama_kategori'],
                    style: const TextStyle(
                      fontSize: 12,
                      color: COLOR_PRIMARY,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    )
  );
}