import 'package:flutter/material.dart';
import 'package:tes2_ambw/includes/variables.dart';
import 'package:tes2_ambw/lihat_berita.dart';

GestureDetector cardKategori(context, berita, index) {
  return GestureDetector(
    onTap: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ViewNews(berita: berita[index], page: 0)),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(12.0), // Increased padding for more space
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Colors.grey.withOpacity(0.5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Thumbnail
              SizedBox(
                width: double.infinity,
                height: 120, // Adjusted the height as needed
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: FadeInImage.assetNetwork(
                        placeholder: ASSET_IMG_THUMBNAIL_LOADER,
                        image: berita[index]['thumbnail'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Details
              Padding(
                padding: const EdgeInsets.all(12.0), // Increased padding for better spacing
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
                        fontSize: 16.0, // Adjusted font size
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 8.0),

                    // Waktu dibuat
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 14.0, color: Colors.grey[600]),
                        const SizedBox(width: 4.0),
                        Text(
                          "${berita[index]['dibuat_pada']}",
                          style: const TextStyle(
                            color: COLOR_PRIMARY,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 4.0),

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
        ),
      ),
    ),
  );
}
