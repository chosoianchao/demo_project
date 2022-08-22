import 'package:demo_project/model/cart_product.dart';
import 'package:demo_project/view/appbar.dart';
import 'package:demo_project/view/padding_view.dart';
import 'package:demo_project/view/text_view.dart';
import 'package:flutter/material.dart';

import 'cart_items.dart';

class BuyProductScreen extends StatefulWidget {
  const BuyProductScreen({Key? key}) : super(key: key);

  @override
  State<BuyProductScreen> createState() => _BuyProductScreenState();
}

class _BuyProductScreenState extends State<BuyProductScreen> {
  @override
  Widget build(BuildContext context) {
    final products =
        ModalRoute.of(context)?.settings.arguments as List<CartProduct>;
    return SafeArea(
      child: Scaffold(
        appBar: AppBarView(
          title: 'My Cart',
          iconLeading: const Icon(Icons.arrow_back),
          isHome: false,
          count: 0,
          iconAction: const Icon(null),
          onPressIconLeading: () {
            Navigator.pop(context);
          },
          onPressIconAction: () {},
        ),
        body: Column(
          children: [
            ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var item = products[index];
                return CartItems(
                  cartProduct: item,
                );
              },
            ),
            const Spacer(),
            Card(
              elevation: 10.0,
              child: Column(
                children: [
                  PaddingView(
                    horizontal: 20,
                    vertical: 0,
                    widget: Row(
                      children: const [
                        TextView(
                            data: 'Total', isBold: true, color: Colors.black),
                        Spacer(),
                        TextView(
                            data: '400', isBold: true, color: Colors.orange),
                      ],
                    ),
                  ),
                  PaddingView(
                    horizontal: 20,
                    vertical: 10,
                    widget: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.orange),
                        ),
                        child: const TextView(
                            data: 'Buy now', isBold: true, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
