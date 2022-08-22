import 'package:flutter/material.dart';

class PaddingView extends StatelessWidget {
  const PaddingView(
      {Key? key,
      required this.horizontal,
      required this.vertical,
      required this.widget})
      : super(key: key);
  final double horizontal;
  final double vertical;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      ),
      child: widget,
    );
  }
}
