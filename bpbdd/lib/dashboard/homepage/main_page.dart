import 'package:WEREHOUSE/dashboard/homepage/fitur_scan.dart';
import 'package:WEREHOUSE/dashboard/homepage/laporan_dashboard/fitur_laporan.dart';
import 'package:WEREHOUSE/dashboard/homepage/home_page.dart';
//import 'package:WEREHOUSE/dashboard/homepage/profile.dart';
import 'package:WEREHOUSE/dashboard/profileScreen/account_screen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    fitur_laporan(),
    QRViewExample(),
    //RootApp(),
    AccountScreen(),
  ];

  //fungsi untuk klik navigator agar pindah ke halaman yang di klik 
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],//1:05:33 untuk pindah ke navigator halaman lain
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label: "Barang", icon: Icon(Icons.bar_chart)),
          BottomNavigationBarItem(label: "Scan", icon: Icon(Icons.barcode_reader)),
          BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
