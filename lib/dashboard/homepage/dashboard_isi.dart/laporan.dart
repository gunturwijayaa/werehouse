import 'package:flutter/material.dart';

class laporan extends StatefulWidget {
  const laporan({super.key});

  @override
  State<laporan> createState() => _laporanState();
}

class _laporanState extends State<laporan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
         children: [
            Positioned(
            left: 20,
            top: 70,
            child: Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.menu),
              color: const Color.fromARGB(255, 0, 0, 0),
              //1:56:19 
              ),
            ],
          )),
         ],  
        ),
      ),
    );
  }
}