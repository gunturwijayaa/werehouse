import 'package:flutter/material.dart';
import 'package:WEREHOUSE/dashboard/lainnya/AppText.dart';
import 'package:WEREHOUSE/dashboard/lainnya/AppColors.dart';
import 'package:WEREHOUSE/dashboard/lainnya/AppLargeText.dart';
import 'package:WEREHOUSE/dashboard/homepage/laporan_dashboard/fitur_laporan.dart';
import 'package:WEREHOUSE/dashboard/homepage/fitur_scan.dart';
//import 'package:barcode_scan/barcode_scan.dart';

import 'dart:async'; // Add this import statement

// Your remaining code here...

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "icon_laporan.png": "laporan",
    "icon_bantuan.png": "bantuan",
    "icon_data.png": "barang",
    "icon_scan.png": "scan",
  };

  Map<String, String> images2 = {
    'image1': 'laporan.png',
    'image2': 'data_barang.png',
    'image3': 'data_barang.png',
  };

  late TabController _tabController;

  int currentImageIndex = 0;
  List<String> images3 = [
    "assets/dashboard/gambar1.png",
    "assets/dashboard/gambar2.png",
    "assets/dashboard/33.jpeg"
  ];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 3, vsync: this); // Inisialisasi TabController
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _tabController
        .dispose(); // Pastikan untuk memanggil dispose pada TabController
    super.dispose();
  }

  void showNextImage() {
    setState(() {
      currentImageIndex = (currentImageIndex + 1) % images3.length;
    });
  }

  void showPreviousImage() {
    setState(() {
      currentImageIndex =
          (currentImageIndex - 1 + images3.length) % images3.length;
    });
  }

  Timer? _timer;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      showNextImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Row(
              children: [
                SizedBox(width: 10),
                Text(
                  "Dashboard",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.withOpacity(0.5),
                      image: DecorationImage(
                          image: AssetImage("assets/dashboard/profile.jpeg"))),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: "Dashboard"),
                Tab(text: "Laporan"),
                Tab(text: "Dokumen"),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: images2.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 15, top: 10),
                      width: 180,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("assets/dashboard/" +
                              images2.values.elementAt(index)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                // Widget untuk tab laporan
                ListView.builder(
                  itemCount: 1,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          margin: EdgeInsets.only(right: 15, top: 1),
                          width: 320,
                          height: 230,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage(images3[currentImageIndex]),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                color: Colors.white,
                                icon: Icon(Icons.chevron_left),
                                onPressed: showPreviousImage,
                              ),
                              IconButton(
                                color: Colors.white,
                                icon: Icon(Icons.chevron_right),
                                onPressed: showNextImage,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            images3.length,
                            (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: currentImageIndex == index
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Text("hii")
              ],
            ),
          ),

          SizedBox(
            height: 15,
          ),

          Container(
            margin: const EdgeInsets.only(left: 25, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(
                  text: "Fitur Lainnya",
                  size: 22,
                  color: Colors.black, // Atur warna sesuai kebutuhan
                ),
                AppText(text: "See all", color: AppColors.textColor1)
              ],
            ),
          ),

          SizedBox(
            height: 15,
          ),

          Container(
            height: 115,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              itemCount: images.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    String imageName = images.keys.elementAt(index);
                    if (imageName == 'icon_laporan.png') {
                      showLoading(context); // Menampilkan loading
                      // Delay 3 detik sebelum pindah ke halaman isi_fitur_laporan
                      Future.delayed(Duration(seconds: 1), () {
                        Navigator.pop(context); // Menutup loading
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => fitur_laporan()),
                        );
                      });
                    } else if (imageName == 'icon_scan.png') {
                      showLoading(context);
                      Future.delayed(Duration(seconds: 1), () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => QRViewExample()),
                        );
                      });
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage("assets/dashboard/" +
                                  images.keys.elementAt(index)),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: AppText(
                            text: images.values.elementAt(index),
                            color: AppColors.textColor1,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )

          //youtube 1:46:49
          //https://www.youtube.com/watch?v=x4DydJKVvQk

          //https://youtu.be/msryeLtuY6c?si=crEqd-uPUHS3hMtT
        ],
      ),
    );
  }
}

void showLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    },
  );
}
