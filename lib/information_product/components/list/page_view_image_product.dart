import 'package:demo_project/on_action_call_back.dart';
import 'package:flutter/material.dart';

import '../item/information_product_item.dart';

class PageViewImages extends StatefulWidget {
  const PageViewImages({
    Key? key,
    required this.images,
    required this.callback,
  }) : super(key: key);
  final List<String> images;
  final OnActionCallback callback;

  @override
  State<PageViewImages> createState() => _PageViewImagesState();
}

class _PageViewImagesState extends State<PageViewImages> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.images.length,
      controller: PageController(
        initialPage: 0,
      ),
      onPageChanged: (int val) {
        print(val);
        widget.callback(val);
      },
      itemBuilder: (context, index) {
        var item = widget.images[index];
        return InformationProductItem(productImage: item);
      },
    );
  }
}
