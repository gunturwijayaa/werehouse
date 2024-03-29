import 'package:WEREHOUSE/dashboard/homepage/laporan_dashboard/service_model.dart';

class DoctorModel {
  String name;
  String image;
  List<String> services;
  int distance;

  DoctorModel({
    required this.name,
    required this.image,
    required this.services,
    required this.distance,
  });
}

var doctors = [
  DoctorModel(
    name: "Barang",
    image: "Dr. Stone.jpg", // Memperbarui path gambar disini
    services: [Service.vaccine],
    distance: 10,
  ),
  DoctorModel(
    name: "Penerimaan Logistik",
    image: "Dr. Stone.jpg", // Memperbarui path gambar disini
    services: [Service.vaccine, Service.surgery],
    distance: 10,
  ),
  DoctorModel(
    name: "Pengeluaran Logistik",
    image: "Dr. Stone.jpg", // Memperbarui path gambar disini
    services: [Service.vaccine, Service.surgery],
    distance: 10,
  ),
];