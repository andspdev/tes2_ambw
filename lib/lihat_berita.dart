import 'package:flutter/material.dart';
import 'package:tes2_ambw/fragment/Beranda.dart';
import 'includes/variables.dart';

class ViewNews extends StatefulWidget {
  final Map<String, dynamic> berita;

  const ViewNews({Key? key, required this.berita}) : super(key: key);

  @override
  _ViewNews createState() => _ViewNews();
}

class _ViewNews extends State<ViewNews> {
  @override
  Widget build(BuildContext context) {
    // Kalau mau ambil id berita
    print("\n\nID Berita: ${widget.berita}\n\n");

    return MaterialApp(
      title: 'Berita | Test 2 AMBW',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255)),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Container(
            decoration: const BoxDecoration(
              color: COLOR_WHITE,
              border: Border(
                bottom: BorderSide(
                  color: COLOR_BORDER_GREY, // Warna border
                  width: 1.0, // Ketebalan border
                ),
              ),
            ),
            child: SafeArea(
              child: Container(
                height: 60.0, // Set the height of the custom AppBar
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //BACK BUTTON
                    Container(
                      padding: EdgeInsets.only(left: 12),
                      child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          color: Color.fromARGB(255, 0, 0, 0),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Beranda()),
                            );
                          }),
                    ),

                    //BOOKMARK BUTTON
                    Container(
                      padding: EdgeInsets.only(right: 12),
                      child: IconButton(
                          icon: const Icon(Icons.bookmark_add),
                          color: Color.fromARGB(255, 0, 0, 0),
                          onPressed: () {}),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.height * 0.3,
                right: MediaQuery.of(context).size.height * 0.3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Column(children: [
                  //TITLE
                  Padding(
                      padding: EdgeInsets.only(left: 14),
                      child: Row(
                        children: [
                          Text(
                            widget.berita['judul_berita'],
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),

                  //CREATED AT
                  Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Tanggal Pembuatan: "),
                        Text(widget.berita['dibuat_pada'])
                      ],
                    ),
                  ),

                  //CATEGORY
                  Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Kategori: "),
                        Text(widget.berita['nama_kategori'])
                      ],
                    ),
                  ),

                  //SPACING
                  SizedBox(height: 50),

                  //IMAGE
                  Image.network(
                    widget.berita['thumbnail'],
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.5,
                  ),

                  //SPACING
                  SizedBox(height: 50),
                ])),

                //CONTENT
                const Padding(
                    padding: EdgeInsets.all(0),
                    child: Column(
                      children: [
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vestibulum morbi blandit cursus risus at ultrices mi tempus imperdiet. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Sagittis eu volutpat odio facilisis. Amet est placerat in egestas. Lorem ipsum dolor sit amet consectetur adipiscing elit pellentesque. Consequat ac felis donec et. Nam libero justo laoreet sit amet cursus. Pretium nibh ipsum consequat nisl vel pretium lectus quam. Nunc sed velit dignissim sodales ut eu sem. Euismod elementum nisi quis eleifend quam adipiscing vitae proin. Habitasse platea dictumst vestibulum rhoncus est. Accumsan tortor posuere ac ut consequat semper viverra nam. Libero id faucibus nisl tincidunt eget nullam. Eget arcu dictum varius duis at consectetur. Risus quis varius quam quisque id diam vel.",
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.normal, height: 1.5),
                      ),
                      SizedBox(height: 10),
                      
                      Text(
                        "Eros donec ac odio tempor orci dapibus. Et sollicitudin ac orci phasellus. Aliquam id diam maecenas ultricies mi. Nunc vel risus commodo viverra. Dolor morbi non arcu risus quis varius quam quisque id. Sodales ut eu sem integer vitae justo eget. Vivamus arcu felis bibendum ut. Quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna. Mattis molestie a iaculis at erat. In fermentum et sollicitudin ac orci. Sit amet nisl purus in mollis.",
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.normal, height: 1.5),
                      ),
                      SizedBox(height: 10),
                      
                      Text(
                        "Dolor sed viverra ipsum nunc aliquet bibendum. Convallis aenean et tortor at risus viverra adipiscing. Quis blandit turpis cursus in hac habitasse platea. Nunc id cursus metus aliquam eleifend. Viverra justo nec ultrices dui sapien. In hendrerit gravida rutrum quisque non tellus orci ac. Parturient montes nascetur ridiculus mus. Etiam tempor orci eu lobortis. Vitae proin sagittis nisl rhoncus mattis rhoncus. Lorem sed risus ultricies tristique nulla. Enim blandit volutpat maecenas volutpat blandit aliquam etiam. Pellentesque adipiscing commodo elit at imperdiet dui accumsan sit. Scelerisque viverra mauris in aliquam sem. Aliquam ultrices sagittis orci a. Risus quis varius quam quisque id diam vel. Enim sit amet venenatis urna cursus eget nunc scelerisque.",
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.normal, height: 1.5),
                      ),
                      SizedBox(height: 10),
                      
                      Text(
                        "Sed viverra ipsum nunc aliquet bibendum enim. Ullamcorper sit amet risus nullam eget felis eget. Pellentesque pulvinar pellentesque habitant morbi tristique. Massa placerat duis ultricies lacus. Sem viverra aliquet eget sit amet tellus cras. Ut placerat orci nulla pellentesque dignissim. Dignissim suspendisse in est ante in nibh. Nulla facilisi morbi tempus iaculis urna id. Et magnis dis parturient montes nascetur ridiculus mus. Consectetur adipiscing elit duis tristique. Phasellus faucibus scelerisque eleifend donec pretium vulputate sapien. Arcu ac tortor dignissim convallis aenean et tortor at risus. Fringilla est ullamcorper eget nulla facilisi etiam dignissim. Mauris pharetra et ultrices neque ornare aenean. Et leo duis ut diam quam nulla porttitor massa. Nibh nisl condimentum id venenatis a condimentum vitae. Ultricies mi eget mauris pharetra et. Eu scelerisque felis imperdiet proin. Sed vulputate mi sit amet mauris commodo quis.",
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.normal, height: 1.5),
                      ),
                      SizedBox(height: 10),
                      
                      Text(
                        "Maecenas pharetra convallis posuere morbi leo. Volutpat consequat mauris nunc congue nisi. Sem fringilla ut morbi tincidunt augue interdum. Adipiscing at in tellus integer. Et egestas quis ipsum suspendisse ultrices gravida dictum. Luctus accumsan tortor posuere ac ut consequat. In hac habitasse platea dictumst quisque sagittis purus sit. Vel risus commodo viverra maecenas accumsan lacus vel. Sit amet consectetur adipiscing elit. Neque laoreet suspendisse interdum consectetur libero id faucibus nisl. Purus viverra accumsan in nisl nisi. Eget nulla facilisi etiam dignissim diam. Magna eget est lorem ipsum dolor. In mollis nunc sed id semper risus in. Euismod in pellentesque massa placerat duis ultricies lacus. A arcu cursus vitae congue mauris rhoncus aenean vel. Blandit cursus risus at ultrices mi tempus imperdiet nulla. Euismod in pellentesque massa placerat duis. Nullam ac tortor vitae purus faucibus ornare. Enim praesent elementum facilisis leo vel fringilla est.",
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.normal, height: 1.5),
                      ),
                      SizedBox(height: 10),
                      
                      Text(
                        "Arcu dictum varius duis at consectetur lorem donec massa sapien. Volutpat sed cras ornare arcu dui vivamus arcu. At lectus urna duis convallis convallis tellus id. Viverra maecenas accumsan lacus vel facilisis. Enim tortor at auctor urna. Varius duis at consectetur lorem donec massa. Auctor urna nunc id cursus metus aliquam. Velit aliquet sagittis id consectetur purus ut. Praesent elementum facilisis leo vel fringilla est. Arcu bibendum at varius vel pharetra vel turpis nunc eget. Nullam vehicula ipsum a arcu cursus vitae congue mauris rhoncus. Sagittis nisl rhoncus mattis rhoncus. Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Erat nam at lectus urna duis.",
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.normal, height: 1.5),
                      ),
                      SizedBox(height: 10),
                      
                      Text(
                        "Dui ut ornare lectus sit. Integer malesuada nunc vel risus. Nunc aliquet bibendum enim facilisis gravida neque convallis a. Sed turpis tincidunt id aliquet risus feugiat. Egestas diam in arcu cursus euismod quis. Vestibulum sed arcu non odio euismod lacinia at quis. Id interdum velit laoreet id donec ultrices tincidunt. Tempor orci eu lobortis elementum. Fermentum leo vel orci porta non pulvinar. A diam sollicitudin tempor id eu nisl nunc mi ipsum. Sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus. Neque vitae tempus quam pellentesque. Est placerat in egestas erat imperdiet sed. Enim neque volutpat ac tincidunt vitae.",
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.normal, height: 1.5),
                      ),
                      SizedBox(height: 10),
                      
                      Text(
                        "Metus aliquam eleifend mi in nulla. Tincidunt vitae semper quis lectus nulla at volutpat diam ut. Lorem ipsum dolor sit amet consectetur adipiscing elit duis tristique. Urna cursus eget nunc scelerisque viverra. Nunc sed id semper risus in hendrerit gravida rutrum quisque. Nunc non blandit massa enim nec dui nunc. Id volutpat lacus laoreet non curabitur. Sit amet massa vitae tortor condimentum. Placerat in egestas erat imperdiet sed euismod nisi porta. Mi quis hendrerit dolor magna eget. Dapibus ultrices in iaculis nunc sed augue lacus viverra vitae. Nulla aliquet porttitor lacus luctus.",
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.normal, height: 1.5),
                      ),
                      SizedBox(height: 10),
                      
                      Text(
                        "Quam adipiscing vitae proin sagittis nisl rhoncus mattis. Amet cursus sit amet dictum. Venenatis urna cursus eget nunc scelerisque viverra. Interdum velit euismod in pellentesque massa. Quam quisque id diam vel quam elementum pulvinar etiam. Non pulvinar neque laoreet suspendisse interdum consectetur. In egestas erat imperdiet sed euismod nisi porta lorem. Diam donec adipiscing tristique risus nec feugiat in fermentum posuere. Proin sagittis nisl rhoncus mattis rhoncus urna. Malesuada pellentesque elit eget gravida cum sociis. Ultricies tristique nulla aliquet enim. Eget duis at tellus at urna. Consectetur adipiscing elit duis tristique. Proin libero nunc consequat interdum varius sit. Morbi enim nunc faucibus a. Faucibus pulvinar elementum integer enim. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Pellentesque elit eget gravida cum sociis natoque penatibus et magnis.",
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.normal, height: 1.5),
                      ),
                      SizedBox(height: 10),
                      
                      Text(
                        "Vitae elementum curabitur vitae nunc. Viverra nibh cras pulvinar mattis nunc sed blandit. Sollicitudin aliquam ultrices sagittis orci a. Lacus viverra vitae congue eu consequat ac felis donec et. Lacus suspendisse faucibus interdum posuere lorem ipsum dolor sit. Amet tellus cras adipiscing enim eu turpis. Sed viverra tellus in hac habitasse platea dictumst vestibulum. Mauris augue neque gravida in fermentum et. Non curabitur gravida arcu ac tortor dignissim convallis aenean. Bibendum ut tristique et egestas quis. Tortor aliquam nulla facilisi cras fermentum. Nullam vehicula ipsum a arcu. Neque sodales ut etiam sit amet. Sit amet mauris commodo quis imperdiet. Odio euismod lacinia at quis risus sed. Dolor magna eget est lorem. Faucibus interdum posuere lorem ipsum dolor. Porttitor massa id neque aliquam vestibulum.",
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.normal, height: 1.5),
                      ),
                      SizedBox(height: 10),
                      ]
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
