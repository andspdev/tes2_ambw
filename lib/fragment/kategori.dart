import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer'; // For logging purposes
import 'package:tes2_ambw/includes/variables.dart';
import 'package:tes2_ambw/includes/functions.dart';
import 'package:tes2_ambw/layouts/card_kategori.dart';

class Kategori extends StatefulWidget {
  const Kategori({super.key});

  @override
  _KategoriState createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  late Future<List<dynamic>> _categories;

  Future<List<dynamic>> fetchCategories() async {
    final response = await http.get(Uri.parse('$URL_API/kategori.php'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final categories = data['kategori'];

      // Fetch latest image for each category
      for (var category in categories) {
        final latestBeritaResponse = await http.get(
            Uri.parse('$URL_API/kategori_berita.php?id=${category['id']}'));

        if (latestBeritaResponse.statusCode == 200) {
          final latestBeritaData = json.decode(latestBeritaResponse.body);
          if (latestBeritaData['berita'].isNotEmpty) {
            category['latest_image'] =
                latestBeritaData['berita'][0]['thumbnail'];
          } else {
            category['latest_image'] = ASSET_IMG_EMPTY_THUMBNAIL;
          }
        } else {
          category['latest_image'] = ASSET_IMG_EMPTY_THUMBNAIL;
        }
      }

      return categories;
    } else {
      throw Exception('Failed to load kategori');
    }
  }

  @override
  void initState() {
    super.initState();
    _categories = fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kategori | Tes 2 AMBW',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: customAppBar(context),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                'Kategori',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: _categories,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    log('Error fetching categories: ${snapshot.error}');
                    return const Center(child: Text('Failed to load kategori'));
                  }

                  final categories = snapshot.data!;

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: getCrossAxisCount(context), // Set the number of columns
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: getAspectRatioForKategori(context), // Adjust the aspect ratio
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      log('Category: $category'); // Log category data

                      // Fetch latest berita image
                      final String latestImage = category['latest_image'] ?? '';

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 5.0,
                          child: Column(
                            children: [
                              if (latestImage.isNotEmpty &&
                                  Uri.tryParse(latestImage)?.hasAbsolutePath ==
                                      true)
                                Image.network(
                                  latestImage,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: getImageHeight(context), // Adjusted height
                                )
                              else
                                Image.asset(
                                  ASSET_IMG_THUMBNAIL_LOADER,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: getImageHeight(context), // Adjusted height
                                ),
                              Flexible(
                                child: ListTile(
                                  title: Text(
                                    category['nama'] ?? 'Unknown',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0, // Adjusted font size
                                    ),
                                  ),
                                  subtitle: Text(
                                    'Total berita: ${category['total_berita'] ?? 'N/A'}',
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BeritaPage(
                                          category: category,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BeritaPage extends StatefulWidget {
  final dynamic category;

  const BeritaPage({required this.category, Key? key}) : super(key: key);

  @override
  _BeritaPageState createState() => _BeritaPageState();
}

class _BeritaPageState extends State<BeritaPage> {
  late Future<List<dynamic>> _berita;

  Future<List<dynamic>> fetchBerita() async {
    final response = await http.get(
        Uri.parse('$URL_API/kategori_berita.php?id=${widget.category['id']}'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['berita'];
    } else {
      throw Exception('Failed to load berita');
    }
  }

  @override
  void initState() {
    super.initState();
    log('BeritaPage initialized with category: ${widget.category}');
    _berita = fetchBerita();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: CustomScrollView(
        slivers: <Widget>[
          // Existing custom app bar
          SliverToBoxAdapter(
            child: customAppBar(context),
          ),

          // Sliver app bar for category title
          SliverAppBar(
            backgroundColor: COLOR_PRIMARY, // Adjust as needed
            expandedHeight: 50.0, // Height when expanded
            pinned: true, // Keep the app bar pinned at the top
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                widget.category['nama'] ?? 'Unknown Category',
                style: TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 20.0,
                ),
              ),
            ),
          ),

          // Future builder for fetching and displaying berita
          FutureBuilder<List<dynamic>>(
            future: _berita,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (snapshot.hasError) {
                log('Error fetching berita: ${snapshot.error}');
                return SliverFillRemaining(
                  child: Center(child: Text('Failed to load berita')),
                );
              }

              // Handle case when snapshot has data
              if (snapshot.hasData && snapshot.data!.isEmpty) {
                return _buildEmptyBeritaMessage();
              }

              if (!mounted) {
                return SliverFillRemaining(
                  child: SizedBox.shrink(),
                );
              }

              final beritaList = snapshot.data!;

              return SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: getCrossAxisCount(context), // Number of columns
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: getAspectRatio(context), // Adjust the aspect ratio
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index < beritaList.length) {
                      final berita = beritaList[index];

                      // Ensure values are not null by providing default values
                      final String thumbnail =
                          berita['thumbnail'] ?? ASSET_IMG_THUMBNAIL_LOADER;
                      final String judulBerita =
                          berita['judul_berita'] ?? 'No Title';
                      final String dibuatPada =
                          berita['dibuat_pada'] ?? 'Unknown Date';
                      final String namaKategori =
                          widget.category['nama'] ?? 'Unknown Category';
                      berita['nama_kategori'] = namaKategori;

                      return cardKategori(context, beritaList, index);
                    } else {
                      // This handles the case when the index is out of valid range.
                      // If the index is beyond the list length, return an empty SizedBox.
                      // This ensures the grid layout completes correctly.
                      return SizedBox.shrink();
                    }
                  },
                  // Adjust childCount to include an additional item if the list length is odd
                  childCount: beritaList.length % 2 == 0
                      ? beritaList.length
                      : beritaList.length + 1,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyBeritaMessage() {
    return SliverFillRemaining(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.warning, size: 60, color: Colors.grey),
            SizedBox(height: 20),
            Text(
              'This Page still has no news. Please check back later.',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
