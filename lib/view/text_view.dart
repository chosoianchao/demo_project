import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String data;
  final bool isBold;
  final Color color;

  const TextView({
    Key? key,
    required this.data,
    required this.isBold,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          color: color),
    );
  }
}
