import 'package:demo_project/view/padding_view.dart';
import 'package:demo_project/view/text_view.dart';
import 'package:flutter/material.dart';

class SizeItem extends StatelessWidget {
  final int size;
final Color boxColor;
  const SizeItem({Key? key, required this.size, required this.boxColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingView(
      horizontal: 10,
      vertical: 0,
      widget: Center(
        child: SizedBox(
          height: 50,
          width: 50,
          child: Card(
            color: boxColor,
            elevation: 10.0,
            child: Align(
              alignment: Alignment.center,
              child: TextView(
                data: size.toString(),
                isBold: true,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
