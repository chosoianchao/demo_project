import 'package:flutter/material.dart';

import '../item/information_product_item.dart';

class PageViewImages extends StatelessWidget {
  const PageViewImages({Key? key, required this.images}) : super(key: key);
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: images.length,
      controller: PageController(
        initialPage: 0,
      ),
      itemBuilder: (context, index) {
        var item = images[index];
        return InformationProductItem(productImage: item);
      },
    );
  }
}
