import 'package:demo_project/model/product.dart';
import 'package:demo_project/view/padding_view.dart';
import 'package:demo_project/view/text_view.dart';
import 'package:flutter/material.dart';

import '../../../Utils.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Card(
          elevation: 10.0,
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                children: const [
                  PaddingView(
                    horizontal: 5,
                    vertical: 0,
                    widget: TextView(
                      data: '30% Sale off',
                      isBold: true,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  PaddingView(
                    horizontal: 5,
                    vertical: 0,
                    widget: Icon(Icons.heart_broken),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 100,
                width: 100,
                child: Image(
                  image: AssetImage(product.image[0]),
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextView(data: product.name, isBold: true, color: Colors.black),
              TextView(
                data: "${Utils.formatNumber(product.price)} VNĐ",
                isBold: true,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
