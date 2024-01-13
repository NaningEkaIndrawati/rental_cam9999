import 'package:flutter/material.dart';
import 'form_penyewaan.dart';

class Camera {
  String name;
  String description;
  String imageUrl;

  Camera({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

class CameraDetails {
  String name;
  String rentalDetails;
  String completeness;
  String imageUrl;

  CameraDetails({
    required this.name,
    required this.rentalDetails,
    required this.completeness,
    required this.imageUrl,
  });
}

class CameraPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  final List<Camera> cameras = [
    Camera(
      name: "CANON EOS 650D",
      description: "6 Jam : 60K\n"
          "12 Jam : 80K\n"
          "24 Jam : 100K",
      imageUrl:
          "https://www.yangcanggih.com/wp-content/uploads/2012/06/canon-650D-2.jpg",
    ),
    Camera(
      name: "CANON EOS 700D",
      description: "6 Jam : 70K\n"
          "12 Jam : 90K\n"
          "24 Jam : 110K",
      imageUrl:
          "https://titikfokuskamera.com/wp-content/uploads/2014/10/Canon-700D-2.jpg",
    ),
    Camera(
      name: "CANON EOS 60D",
      description: "6 Jam : 80K\n"
          "12 Jam : 100K\n"
          "24 Jam : 130K",
      imageUrl:
          "https://images.tokopedia.net/img/cache/700/VqbcmM/2021/2/10/3cf73f00-5116-4c4c-b87f-5c58704f56f7.jpg",
    ),
    Camera(
      name: "CANON EOS 1300D",
      description: "6 Jam : 50K\n"
          "12 Jam : 70K\n"
          "24 Jam : 90K",
      imageUrl:
          "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//980/canon_canon-eos-1300d-dslr-18-mp-lens-kit-18-55-mm-is-ii---hitam_full05.jpg",
    ),
    Camera(
      name: "CANON EOS 1100D",
      description: "6 Jam : 40K\n"
          "12 Jam : 60K\n"
          "24 Jam : 90K",
      imageUrl: "https://media.pricebook.co.id/images/product/L/3635_L_1.jpg",
    ),
    Camera(
      name: "CANON EOS 1200D",
      description: "6 Jam : 40K\n"
          "12 Jam : 60K\n"
          "24 Jam : 90K",
      imageUrl:
          "https://images.tokopedia.net/img/cache/700/OJWluG/2023/1/3/156389cf-ee54-4a3e-b2f2-72302a3dcce8.jpg?ect=4g",
    ),
    Camera(
      name: "MIRRORLES SONY A7 MARK II",
      description: "6 Jam : 200K\n"
          "12 Jam : 230K\n"
          "24 Jam : 250K",
      imageUrl:
          "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//95/MTA-2813369/sony_sony-a7-mark-ii-kit-fe-28-70mm-oss-gudang-kamera-malang_full05.jpg",
    ),
    Camera(
      name: "MIRRORLES SONY A6400",
      description: "6 Jam : 150K\n"
          "12 Jam : 180K\n"
          "24 Jam : 200K",
      imageUrl:
          "https://p-id.ipricegroup.com/uploaded_4ed48d3279944b5237891445dea73576.jpg",
    ),
    Camera(
      name: "MIRRORLES SONY A6000",
      description: "6 Jam : 90K\n"
          "12 Jam : 100K\n"
          "24 Jam : 120K",
      imageUrl:
          "https://p-id.ipricegroup.com/uploaded_f76b2869b9823879b99a637558238bf9.jpg",
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
            itemCount: cameras.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraDetailsWidget(
                        cameraDetails: CameraDetails(
                          name: cameras[index].name,
                          rentalDetails: cameras[index].description,
                          completeness: " -> Lensa fix Yoguo 55M"
                              "  -> Strep Camera"
                              "  -> Baterai & cas"
                              "  -> Memory sanDisk 16 GB"
                              "  -> Support Video Full HD"
                              "  -> Touch Screen", // Add your completeness details here
                          imageUrl: cameras[index].imageUrl,
                        ),
                      ),
                    ),
                  );
                },
                child: CameraItem(camera: cameras[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CameraItem extends StatelessWidget {
  final Camera camera;

  CameraItem({required this.camera});

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
                camera.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 4),
              Text(
                camera.name,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                camera.description,
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

class CameraDetailsWidget extends StatelessWidget {
  final CameraDetails cameraDetails;

  CameraDetailsWidget({required this.cameraDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(cameraDetails.name),
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
                cameraDetails.imageUrl,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(cameraDetails.rentalDetails),
            SizedBox(height: 16),
            Text(
              "Completeness:",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(cameraDetails.completeness),
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
    );
  }
}
