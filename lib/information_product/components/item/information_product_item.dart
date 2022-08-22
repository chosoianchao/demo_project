import 'package:flutter/material.dart';

class InformationProductItem extends StatelessWidget {
  final String productImage;

  const InformationProductItem({Key? key, required this.productImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Center(
        child: Image(
          image: AssetImage(productImage),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
