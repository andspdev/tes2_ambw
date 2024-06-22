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
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed cras ornare arcu dui vivamus arcu felis. Tellus elementum sagittis vitae et leo duis. Sed ullamcorper morbi tincidunt ornare massa eget egestas purus. Cras fermentum odio eu feugiat pretium nibh ipsum. Felis donec et odio pellentesque. Sollicitudin aliquam ultrices sagittis orci a. Nec dui nunc mattis enim. Tortor aliquam nulla facilisi cras. Mauris a diam maecenas sed enim ut sem viverra. Eu nisl nunc mi ipsum faucibus vitae aliquet nec ullamcorper. Pharetra pharetra massa massa ultricies mi quis hendrerit dolor magna. Convallis a cras semper auctor neque vitae. Pulvinar neque laoreet suspendisse interdum consectetur libero. Tellus mauris a diam maecenas sed enim ut. Est velit egestas dui id ornare arcu odio. Dui sapien eget mi proin sed. Faucibus in ornare quam viverra orci sagittis eu volutpat odio. Eu nisl nunc mi ipsum faucibus vitae. Gravida quis blandit turpis cursus in hac habitasse. Diam in arcu cursus euismod quis viverra. Molestie ac feugiat sed lectus vestibulum mattis ullamcorper velit. Arcu risus quis varius quam quisque id. Faucibus a pellentesque sit amet porttitor eget dolor. In dictum non consectetur a erat nam at lectus. Morbi tristique senectus et netus et malesuada. Orci porta non pulvinar neque laoreet suspendisse interdum consectetur. At imperdiet dui accumsan sit. Semper viverra nam libero justo laoreet sit amet cursus sit. Sollicitudin nibh sit amet commodo nulla facilisi. Sed euismod nisi porta lorem mollis. Volutpat blandit aliquam etiam erat. Enim sit amet venenatis urna cursus. Nullam ac tortor vitae purus faucibus ornare suspendisse sed nisi. Tempus egestas sed sed risus pretium. Diam phasellus vestibulum lorem sed risus. Nunc lobortis mattis aliquam faucibus purus. Pharetra pharetra massa massa ultricies mi. Tortor vitae purus faucibus ornare suspendisse sed nisi lacus. Hendrerit gravida rutrum quisque non tellus orci ac. Dictum at tempor commodo ullamcorper a. Cursus turpis massa tincidunt dui ut ornare. Tellus cras adipiscing enim eu turpis. Tortor at auctor urna nunc id cursus. Id donec ultrices tincidunt arcu non sodales neque sodales ut. Massa enim nec dui nunc mattis enim ut tellus. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh sed. Tristique senectus et netus et malesuada fames ac turpis egestas. Amet massa vitae tortor condimentum lacinia quis. Faucibus a pellentesque sit amet porttitor eget. Tortor id aliquet lectus proin nibh. Tellus elementum sagittis vitae et leo duis ut diam. Arcu cursus vitae congue mauris rhoncus aenean vel elit. Non enim praesent elementum facilisis. Sed felis eget velit aliquet. Dictum non consectetur a erat nam at. Placerat in egestas erat imperdiet sed euismod nisi porta. Tincidunt praesent semper feugiat nibh sed pulvinar proin gravida hendrerit. Posuere morbi leo urna molestie at. At urna condimentum mattis pellentesque id. Massa tempor nec feugiat nisl pretium fusce id. In egestas erat imperdiet sed. Consectetur a erat nam at lectus urna duis convallis. Mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan. Phasellus faucibus scelerisque eleifend donec pretium vulputate sapien. Sed egestas egestas fringilla phasellus faucibus. Enim sit amet venenatis urna. Feugiat in ante metus dictum at tempor. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Nunc lobortis mattis aliquam faucibus purus in massa. Amet cursus sit amet dictum sit amet justo. Malesuada fames ac turpis egestas integer eget. Commodo sed egestas egestas fringilla phasellus faucibus scelerisque eleifend donec. Ultrices neque ornare aenean euismod elementum. Diam phasellus vestibulum lorem sed risus ultricies tristique. Lorem ipsum dolor sit amet consectetur adipiscing elit. Sem et tortor consequat id porta nibh venenatis cras sed. Nibh sit amet commodo nulla facilisi nullam vehicula. Enim neque volutpat ac tincidunt vitae semper quis. Eu sem integer vitae justo eget magna fermentum iaculis eu. Urna nunc id cursus metus aliquam eleifend. Gravida cum sociis natoque penatibus. Tempor orci eu lobortis elementum nibh. Ullamcorper malesuada proin libero nunc consequat. Tortor dignissim convallis aenean et tortor at risus viverra. Orci sagittis eu volutpat odio facilisis mauris sit amet. Tortor condimentum lacinia quis vel eros donec ac odio. Urna et pharetra pharetra massa massa ultricies mi. Lobortis mattis aliquam faucibus purus. Aliquam malesuada bibendum arcu vitae. Curabitur vitae nunc sed velit dignissim sodales ut eu. Vestibulum morbi blandit cursus risus at ultrices mi tempus. Tempus quam pellentesque nec nam aliquam. Tristique sollicitudin nibh sit amet commodo nulla facilisi nullam. Purus viverra accumsan in nisl. Lectus proin nibh nisl condimentum id venenatis a condimentum. Commodo quis imperdiet massa tincidunt nunc. A diam sollicitudin tempor id eu nisl. Felis eget nunc lobortis mattis aliquam. Sed vulputate odio ut enim blandit volutpat. Vel facilisis volutpat est velit egestas dui id ornare. Sit amet consectetur adipiscing elit duis tristique. Aliquet nec ullamcorper sit amet. Feugiat scelerisque varius morbi enim nunc faucibus. Porta lorem mollis aliquam ut porttitor leo a. Tortor posuere ac ut consequat semper viverra nam libero justo. Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi tristique. Sed velit dignissim sodales ut eu. Nisl tincidunt eget nullam non nisi. Duis tristique sollicitudin nibh sit amet commodo nulla facilisi. Nec nam aliquam sem et tortor consequat id porta. Ac orci phasellus egestas tellus rutrum tellus pellentesque. Varius morbi enim nunc faucibus a pellentesque sit. Suspendisse interdum consectetur libero id. Nibh mauris cursus mattis molestie a iaculis. Velit laoreet id donec ultrices tincidunt arcu. Cursus eget nunc scelerisque viverra mauris in aliquam sem. Aliquam malesuada bibendum arcu vitae elementum. Felis eget velit aliquet sagittis. Laoreet non curabitur gravida arcu. Sed turpis tincidunt id aliquet. Consequat id porta nibh venenatis cras sed felis eget velit. Tristique senectus et netus et malesuada fames ac. Arcu dictum varius duis at consectetur lorem donec massa sapien. Neque viverra justo nec ultrices dui sapien eget. Libero id faucibus nisl tincidunt eget nullam. Sapien pellentesque habitant morbi tristique senectus et. Fermentum dui faucibus in ornare. Vestibulum sed arcu non odio euismod. Ac turpis egestas integer eget aliquet nibh praesent. Enim ut tellus elementum sagittis. Diam quis enim lobortis scelerisque fermentum dui faucibus in. Mauris vitae ultricies leo integer malesuada nunc vel risus commodo. Enim praesent elementum facilisis leo. Pretium vulputate sapien nec sagittis aliquam malesuada bibendum arcu. Nisi quis eleifend quam adipiscing vitae. Tellus cras adipiscing enim eu turpis egestas pretium. Risus viverra adipiscing at in tellus integer feugiat. Nibh nisl condimentum id venenatis a. Duis ultricies lacus sed turpis. Nunc mi ipsum faucibus vitae aliquet nec ullamcorper sit. Aliquam sem et tortor consequat id porta. Platea dictumst quisque sagittis purus sit amet volutpat consequat mauris. Et ligula ullamcorper malesuada proin libero nunc consequat interdum varius. Tincidunt augue interdum velit euismod in pellentesque. Ullamcorper eget nulla facilisi etiam dignissim. Viverra vitae congue eu consequat ac felis donec et odio. Facilisi etiam dignissim diam quis enim lobortis scelerisque. Vel eros donec ac odio tempor orci dapibus. Volutpat commodo sed egestas egestas fringilla. Viverra nibh cras pulvinar mattis nunc. Egestas sed sed risus pretium quam. Nunc scelerisque viverra mauris in aliquam sem fringilla. Ullamcorper malesuada proin libero nunc consequat interdum. Justo eget magna fermentum iaculis eu non. Tellus cras adipiscing enim eu turpis egestas. Bibendum neque egestas congue quisque egestas diam in arcu. Nunc sed blandit libero volutpat sed cras ornare arcu dui. Ut sem nulla pharetra diam sit amet nisl suscipit adipiscing. Cursus vitae congue mauris rhoncus. Non diam phasellus vestibulum lorem sed risus. Faucibus pulvinar elementum integer enim neque volutpat ac tincidunt. Platea dictumst vestibulum rhoncus est pellentesque elit. Ac placerat vestibulum lectus mauris ultrices. Hendrerit dolor magna eget est. Pretium aenean pharetra magna ac. Tortor id aliquet lectus proin nibh. Condimentum vitae sapien pellentesque habitant morbi tristique senectus et netus. Id consectetur purus ut faucibus pulvinar. Mollis aliquam ut porttitor leo. At quis risus sed vulputate odio ut. Neque gravida in fermentum et. Sollicitudin ac orci phasellus egestas tellus rutrum tellus pellentesque. Vel facilisis volutpat est velit egestas dui id ornare. Diam maecenas sed enim ut sem viverra."),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
