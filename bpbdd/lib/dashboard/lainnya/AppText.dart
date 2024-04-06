import 'package:flutter/material.dart';

/// Widget untuk menampilkan teks dengan warna yang ditentukan.
class AppText extends StatelessWidget {
  /// Teks yang akan ditampilkan.
  final String text;

  /// Warna teks.
  final Color color;

  /// Konstruktor untuk widget AppText.
  const AppText({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color),
    );
  }
}
