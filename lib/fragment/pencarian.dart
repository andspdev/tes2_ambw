import 'package:flutter/material.dart';
import 'package:tes2_ambw/includes/functions.dart';
import 'package:tes2_ambw/includes/variables.dart';
import 'package:tes2_ambw/layouts/card_pencarian.dart';

class Pencarian extends StatefulWidget {
  const Pencarian({super.key});

  @override
  _Pencarian createState() => _Pencarian();
}

class _Pencarian extends State<Pencarian> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _allData = [];
  List<Map<String, dynamic>> _searchResults = [];
  bool _isLoading = false;

  Future<void> _fetchData() async {
    final url = 'https://ambw.andsp.id/test-2/home.php';
    setState(() {
      _isLoading = true;
    });

    try {
      final data = await getData(url);
      final List<Map<String, dynamic>> berita = [
        ...List<Map<String, dynamic>>.from(data['berita']['highlight']),
        ...List<Map<String, dynamic>>.from(data['berita']['banyak_dilihat']),
        ...List<Map<String, dynamic>>.from(data['berita']['terbaru']),
      ];

      // Menghilangkan data yang terduplikat
      final uniqueBerita = <String, Map<String, dynamic>>{};
      for (var item in berita) {
        uniqueBerita[item['id']] = item;
      }

      setState(() {
        _allData = uniqueBerita.values.toList();
        _searchResults = _allData;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _performSearch(String query) {
    if (_allData.isEmpty) {
      return;
    }
    setState(() {
      if (query.isEmpty) {
        _searchResults = _allData;
      } else {
        _searchResults = _allData
            .where((element) =>
                element['judul_berita']
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                element['nama_kategori']
                    .toLowerCase()
                    .contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pencarian | Tes 2 AMBW',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: customAppBar(context),
        backgroundColor: COLOR_WHITE,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Cari...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onChanged: _performSearch,
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : _searchResults.isNotEmpty
                        ? GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: getCrossAxisCount(context),
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                              childAspectRatio: getAspectRatio(context),
                            ),
                            itemCount: _searchResults.length,
                            itemBuilder: (context, index) {
                              return cardPencarian(context, _searchResults, index);
                            },
                          )
                        : Center(
                            child: Text('Tidak ada hasil ditemukan'),
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
