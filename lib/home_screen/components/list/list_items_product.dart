import 'package:demo_project/model/product.dart';
import 'package:demo_project/home_screen/components/item/product_item.dart';
import 'package:flutter/material.dart';

class ListProducts extends StatelessWidget {
  const ListProducts(
      {Key? key, required this.goToScreenM2, required this.listItems})
      : super(key: key);
  final Function(Product product) goToScreenM2;
  final List<Product> listItems;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 2 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      scrollDirection: Axis.vertical,
      itemCount: listItems.length,
      itemBuilder: (context, index) {
        var item = listItems[index];
        return InkWell(
          onTap: () => goToScreenM2(item),
          child: ProductItem(product: item),
        );
      },
    );
  }
}
