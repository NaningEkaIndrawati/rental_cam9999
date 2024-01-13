import 'package:flutter/material.dart';
import 'form_penyewaan.dart';

class Lensa {
  String name;
  String description;
  String imageUrl;

  Lensa({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

class LensaDetails {
  String name;
  String rentalDetails;
  String completeness;
  String imageUrl;

  LensaDetails({
    required this.name,
    required this.rentalDetails,
    required this.completeness,
    required this.imageUrl,
  });
}

class LensaPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  final List<Lensa> lens = [
    Lensa(
      name: "Lensa Tele Canon EF 70 - 200mm F2.8 LIS USM",
      description: "6 Jam : 150K\n"
          "12 Jam : 180K\n"
          "24 Jam : 200K",
      imageUrl:
          "https://megakamera.com/wp-content/uploads/2021/05/Canon-EF-70-200mm-f4L-USM-Lens-1.jpg",
    ),
    Lensa(
      name: "Lensa Tele Sigma APO DG 70 - 300 mm",
      description: "6 Jam : 30K\n"
          "12 Jam : 40K\n"
          "24 Jam : 50K",
      imageUrl:
          "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//90/MTA-52009701/oem_oem_full01.jpg",
    ),
    // Tambahkan lebih banyak objek Camera sesuai kebutuhan
    Lensa(
      name: "Lensa Fix Meike For Fuji Film 35 mm F1.4",
      description: "6 Jam : 30K\n"
          "12 Jam : 40K\n"
          "24 Jam : 50K",
      imageUrl:
          "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//92/MTA-1972262/meike_lensa-meike-35mm-f1-7-for-mirrorless-fujifilm-x-mount-series_full05.jpg",
    ),
    Lensa(
      name: "Lensa Fix Canon STM 50 mm F1.8",
      description: "6 Jam : 30K\n"
          "12 Jam : 40K\n"
          "24 Jam : 50K",
      imageUrl:
          "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full/canon_canon-ef-50mm-f1-8-ii-lensa-kamera_full06.jpg",
    ),
    Lensa(
      name: "Lensa Fix Canon is II F1.8",
      description: "6 Jam : 20K\n"
          "12 Jam : 30K\n"
          "24 Jam : 40K",
      imageUrl:
          "https://p-id.ipricegroup.com/uploaded_2c1ffa82cdfd5aa78476513ae0c6b68a.jpg",
    ),
    Lensa(
      name: "Lensa Fix Yongnuo For Canon F1.8",
      description: "6 Jam : 15K\n"
          "12 Jam : 20K\n"
          "24 Jam : 35K",
      imageUrl:
          "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//1181/yongnuo_yongnuo-50mm-f1-8-af-mf-prime-fixed-lens-for-canon-dslr_full02.jpg",
    ),
    Lensa(
      name: "Lensa Kit Canon Standart EFS 18 - 55 mm",
      description: "6 Jam : 200K\n"
          "12 Jam : 230K\n"
          "24 Jam : 250K",
      imageUrl:
          "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//102/MTA-2781957/canon_canon-lens-efs-18-55mm-f-3-5-5-6-is-ii_full02.jpg",
    ),
    Lensa(
      name: "Adapter Original Canon EF - EOS M",
      description: "6 Jam : 20K\n"
          "12 Jam : 25K\n"
          "24 Jam : 30K",
      imageUrl:
          "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//1368/canon_canon-mount-adapter-ef-eos-m-tanpa-tripod-mount--box-brown----hitam_full02.jpg",
    ),
    Lensa(
      name: "Lensa Fix Yongnuo 35 MM F2.0",
      description: "6 Jam : 30K\n"
          "12 Jam : 40K\n"
          "24 Jam : 50K",
      imageUrl:
          "https://lzd-img-global.slatic.net/live/id/p/16cf47906644798d3aa1702a5621bbda.jpg_720x720q80.jpg",
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
              // Add your back button functionality here
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
                hintText: "Canon 650D",
                border: InputBorder.none,
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          backgroundColor: Color(0xff000000),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xfff5dfdf),
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
            itemCount: lens.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LensaDetailsWidget(
                        LensaDetails: LensaDetails(
                          name: lens[index].name,
                          rentalDetails: lens[index].description,
                          completeness: " -> Lensa Tele Canon"
                              " -> EF 70-200 MM"
                              " -> dll.", // Add your completeness details here
                          imageUrl: lens[index].imageUrl,
                        ),
                      ),
                    ),
                  );
                },
                child: LensaItem(Lensa: lens[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}

class LensaItem extends StatelessWidget {
  final Lensa;

  LensaItem({required this.Lensa});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Lensa.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 4),
              Text(
                Lensa.name,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                Lensa.description,
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
    );
  }
}

class LensaDetailsWidget extends StatelessWidget {
  final LensaDetails;

  LensaDetailsWidget({required this.LensaDetails});

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
          title: Text(LensaDetails.name),
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
                  LensaDetails.imageUrl,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text(LensaDetails.rentalDetails),
              SizedBox(height: 16),
              Text(
                "Completeness:",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(LensaDetails.completeness),
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
        floatingActionButtonLocation: FloatingActionButtonLocation
            .endFloat, // Change to endFloat for bottom right corner
        backgroundColor: Color(0xfffff4f4), // Set your desired background color
      ),
    );
  }
}
