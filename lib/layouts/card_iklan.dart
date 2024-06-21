import 'package:flutter/material.dart';
import 'package:tes2_ambw/includes/variables.dart';
import 'package:tes2_ambw/lihat_berita.dart';

GestureDetector cardIklanStandar(context, beritaTerbaru, index) 
{
  return GestureDetector(
    onTap: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ViewNews(berita: beritaTerbaru[index])),
      );
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          // Thumbnail
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.only(right: 12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: NetworkImage(beritaTerbaru[index]['thumbnail']),
                fit: BoxFit.cover,
              ),
            ),
          ),


          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Judul
                Text(
                  beritaTerbaru[index]['judul_berita'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                // Waktu dibuat
                Text(
                  "${beritaTerbaru[index]['dibuat_pada']}",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),

                // Kategori
                Text(
                  "${beritaTerbaru[index]['nama_kategori']}",
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