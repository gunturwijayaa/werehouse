import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  final double size;
  final String text;
  final Color color;

  const Dashboard({
    Key? key,
    this.size = 30,
    required this.text,
    this.color = Colors.black, required TextAlign textAlign,
  }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        color: widget.color,
        fontSize: widget.size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
