import 'package:flutter/material.dart';
import 'package:tes2_ambw/includes/variables.dart';
import 'package:tes2_ambw/lihat_berita.dart';

GestureDetector cardIklanHighlight(context, berita, index) {
  return GestureDetector(
    onTap: () {
      
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ViewNews(berita: berita[index])),
      );
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Thumbnail
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: NetworkImage(berita[index]['thumbnail']),
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
                  berita[index]['judul_berita'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),

                // Waktu dibuat
                Text(
                  "${berita[index]['dibuat_pada']}",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),

                // Kategori
                Text(
                  "${berita[index]['nama_kategori']}",
                  style: const TextStyle(
                    color: COLOR_PRIMARY,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    )
  );
}