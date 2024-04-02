import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart'; // Import untuk showDatePicker
import 'package:google_fonts/google_fonts.dart';

var selectedService = 0;
DateTime? selectedDate; // Change to nullable DateTime

class bantuan extends StatelessWidget {
  final Key? key;
  final TextEditingController _expiredController = TextEditingController();
  final TextEditingController _namaBarangController = TextEditingController();
  final TextEditingController _jumlahController = TextEditingController();
  final TextEditingController _satuanController = TextEditingController();
  final List<String> satuanOptions = [
    'Pieces (pcs)',
    'Kilogram (kg)',
    'Gram (g)',
    'Meter (m)',
    'Centimeter (cm)',
    'Liter (L)',
    'Mililiter (ml)',
    'Box',
    'Botol',
    'Dus',
    'Rol',
    'Lembar',
    'Set',
    'Buah',
    'Pak',
  ];

  String? selectedSatuan;

  bantuan({this.key}) : super(key: key);

  // Deklarasi daftar barang
  final List<String> daftarBarang = [
    'Sapu',
    'Sapu',
    'Sapu',
    'Sendok',
    'Sendok',
    'Handuk',
    'Handuk',
    'Tas',
    'Tas',
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                _greetings(),
                const SizedBox(
                  height: 16,
                ),
                _card(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildThreeFieldsInRow(
                        hintText1: 'Nama',
                        hintText2: 'Jumlah',
                        hintText3: 'Satuan',
                        label1: 'Nama Barang:',
                        label2: 'Jumlah:',
                        label3: 'Satuan:',
                        controller1: _namaBarangController,
                        controller2: _jumlahController,
                        controller3: _satuanController,
                        onTap1: () {
                          _showDaftarBarang(context);
                        },
                      ),
                      const SizedBox(height: 10),
                      _buildTextFieldWithButton(
                        hintText: 'Kadaluarsa',
                        label: 'Tanggal Kadaluarsa :',
                        controller: _expiredController,
                        onTap: () {
                          _selectDate(context);
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _customButton(
                            text: 'Simpan',
                            onPressed: () {
                              // Tambahkan fungsi untuk menyimpan data
                            },
                            color: Colors.green,
                          ),
                          _customButton(
                            text: 'Hapus',
                            onPressed: () {
                              // Tambahkan fungsi untuk menghapus data
                            },
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldWithButton({
    required String hintText,
    required String label,
    TextEditingController? controller,
    VoidCallback? onTap,
    VoidCallback? onButtonTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: controller,
                  onTap: onTap,
                  readOnly: true, // Set field menjadi tidak bisa ditulis
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            if (onButtonTap != null)
              InkWell(
                onTap: onButtonTap,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(
                    Icons.add,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildThreeFieldsInRow({
  required String hintText1,
  required String hintText2,
  required String hintText3,
  required String label1,
  required String label2,
  required String label3,
  TextEditingController? controller1,
  TextEditingController? controller2,
  TextEditingController? controller3,
  VoidCallback? onTap1,
  VoidCallback? onTap2,
  VoidCallback? onTap3,
  VoidCallback? onButtonTap,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label1,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: controller1,
                    onTap: onTap1,
                    readOnly: true, // Set field menjadi tidak bisa ditulis
                    decoration: InputDecoration(
                      hintText: hintText1,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label2,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: controller2,
                    keyboardType: TextInputType.number, // Set keyboard type to number
                    decoration: InputDecoration(
                      hintText: hintText2,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label3,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: controller3,
                    onTap: onTap3,
                    readOnly: true, // Set field menjadi tidak bisa ditulis
                    decoration: InputDecoration(
                      hintText: hintText3,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          if (onButtonTap != null)
            InkWell(
              onTap: onButtonTap,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  Icons.add,
                  size: 24,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    ],
  );
}



  Widget _buildSatuanDropdown({required String hintText, required String label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: DropdownButtonFormField<String>(
            value: selectedSatuan,
            onChanged: (newValue) {
              selectedSatuan = newValue;
            },
            items: satuanOptions.map((satuan) {
              return DropdownMenuItem<String>(
                value: satuan,
                child: Text(satuan),
              );
            }).toList(),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            ),
          ),
        ),
      ],
    );
  }

  AspectRatio _card() {
    return AspectRatio(
      aspectRatio: 336 / 184,
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color(0xFF818AF9),
        ),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/fitur_barang.png',
              height: double.maxFinite,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Hallo, ",
                      style: GoogleFonts.manrope(
                        fontSize: 14,
                        color: Color.fromARGB(255, 255, 255, 255),
                        height: 150 / 100,
                      ),
                      children: const [
                        TextSpan(
                          text: "Silahkan  ",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextSpan(
                          text:
                              "\n Melengkapi Kolom \n Yang Ada Di \n Bawah Ini...",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _greetings() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Input Barang ',
            style: GoogleFonts.manrope(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF3F3E3F),
            ),
          ),
        ],
      ),
    );
  }

  Widget _customButton({required String text, required VoidCallback onPressed, required Color color}) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      selectedDate = picked;
      // Update the value of the TextFormField using the controller
      _expiredController.text = "${picked.day}-${picked.month}-${picked.year}";
    }
  }

  void _showDaftarBarang(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: ListView.builder(
            itemCount: daftarBarang.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(daftarBarang[index]),
                onTap: () {
                  _namaBarangController.text = daftarBarang[index];
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: bantuan(),
  ));
}
