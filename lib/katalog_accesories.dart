import 'package:flutter/material.dart';
import 'form_penyewaan.dart';

class Accessories {
  String name;
  String description;
  String imageUrl;

  Accessories(
      {required this.name, required this.description, required this.imageUrl});
}

class AccessoriesDetails {
  String name;
  String rentalDetails;
  String completeness;
  String imageUrl;

  AccessoriesDetails({
    required this.name,
    required this.rentalDetails,
    required this.completeness,
    required this.imageUrl,
  });
}

class AccesoriesPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  final List<Accessories> accessories = [
    Accessories(
      name: "Mic Eksternal BOYA MMI +",
      description: "6 Jam : 150K\n"
          "12 Jam : 180K\n"
          "24 Jam : 200K",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRZaOMDgxWsJQ_irQutyyuSrpXkigtyX6lyg&usqp=CAU",
    ),
    Accessories(
      name: "Flash Eksternal GODOX TT600",
      description: "6 Jam : 30K\n"
          "12 Jam : 40K\n"
          "24 Jam : 50K",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYLcXW5qMTu70fwp3PTlKiui4jm7OmR3Tb1w&usqp=CAU",
    ),
    Accessories(
      name: "Transmitter Wireless GODOX XIT-C",
      description: "6 Jam : 30K\n"
          "12 Jam : 40K\n"
          "24 Jam : 50K",
      imageUrl:
          "https://img.ws.mms.shopee.co.id/38c14bf10aba9c865d8c454c63951438",
    ),
    Accessories(
      name: "Transmitter Wireless GODOX X2T-S",
      description: "6 Jam : 30K\n"
          "12 Jam : 40K\n"
          "24 Jam : 50K",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbluBgtkFYdgp10kZPo0PygTOPeqCN10Bvdw&usqp=CAU",
    ),
    Accessories(
      name: "Microphone Stand Recording",
      description: "6 Jam : 20K\n"
          "12 Jam : 30K\n"
          "24 Jam : 40K",
      imageUrl:
          "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//98/MTA-7971911/recording_tech_recording_tech_paket_bm800_bm_800_condenser_microphone_with_arm_stand_and_pop_filter_for_recording-_meeting-_podcast_and_broadcast_full03_diwqtjrf.jpg",
    ),
    Accessories(
      name: "Tripod Camera Pro Zhuang",
      description: "6 Jam : 15K\n"
          "12 Jam : 20K\n"
          "24 Jam : 35K",
      imageUrl:
          "https://m.media-amazon.com/images/I/41JCKxvC-3L._AC_UF1000,1000_QL80_.jpg",
    ),
    Accessories(
      name: "Tripod Camera Beike QZSD - 555",
      description: "6 Jam : 200K\n"
          "12 Jam : 230K\n"
          "24 Jam : 250K",
      imageUrl:
          "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//93/MTA-1554555/beike_beike-qzsd-555-tripod_full03.jpg",
    ),
    Accessories(
      name: "Batrai Enelope Panasonic Silver AA",
      description: "6 Jam : 20K\n"
          "12 Jam : 25K\n"
          "24 Jam : 30K",
      imageUrl:
          "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//89/MTA-1603770/eneloop_eneloop-panasonic-baterai-2000am-aa_full02.jpg",
    ),
    Accessories(
      name: "Batrai Enelope Panasonic Black Pro AA",
      description: "6 Jam : 30K\n"
          "12 Jam : 40K\n"
          "24 Jam : 50K",
      imageUrl:
          "https://images.tokopedia.net/img/cache/500-square/VqbcmM/2022/2/3/90fb5d2b-8e39-4bce-90e3-cdbd777a2347.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Accessories",
                border: InputBorder.none,
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          backgroundColor:
              Color(0xff000000), // Ganti warna appbar menjadi merah
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xfff5dfdf), // Set your desired background color
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: accessories.length,
            itemBuilder: (BuildContext context, int index) {
              return AccessoriesItem(accessories: accessories[index]);
            },
          ),
        ),
      ),
    );
  }
}

class AccessoriesItem extends StatelessWidget {
  final Accessories accessories;

  AccessoriesItem({required this.accessories});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AccessoriesDetailWidget(
              accessoriesDetails: AccessoriesDetails(
                name: accessories.name,
                rentalDetails: accessories.description,
                completeness: " -> ${accessories.name}"
                    " -> ${accessories.description}"
                    " -> dll.",
                imageUrl: accessories.imageUrl,
              ),
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xff000000)),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  accessories.imageUrl,
                  width: MediaQuery.of(context).size.width,
                  height: 60, // Set your desired height
                  fit: BoxFit.contain, // Set BoxFit value as needed
                ),
                SizedBox(height: 4),
                Text(
                  accessories.name,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  accessories.description,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: Icon(
                Icons.favorite,
                color: Color(0xffd5cece),
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccessoriesDetailWidget extends StatelessWidget {
  final AccessoriesDetails accessoriesDetails;

  AccessoriesDetailWidget({required this.accessoriesDetails});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title:
              Text(accessoriesDetails.name), // Move this line inside the AppBar
          backgroundColor: Color(0xff000000),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image.network(
                  accessoriesDetails.imageUrl,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text(accessoriesDetails.rentalDetails),
              SizedBox(height: 16),
              Text(
                "Completeness:",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(accessoriesDetails.completeness),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton.extended(
            onPressed: () {
              // Navigasi ke halaman FormPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PersonalForm(),
                ),
              );
            },
            label: Text('Sewa Langsung'),
            icon: Icon(Icons.shopping_cart),
            backgroundColor: Color(0xff000000),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        backgroundColor: Color(0xfffff4f4),
      ),
    );
  }
}
