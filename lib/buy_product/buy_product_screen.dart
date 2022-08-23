import 'dart:collection';

import 'package:demo_project/Utils.dart';
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
  HashMap<int, int> mapTotal = HashMap<int, int>();
  var total = 0;

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
                  callback: (val) {
                    setState(() {
                      mapTotal[index] = val;
                      var listKeys = mapTotal.keys.toList();
                      for (int k in listKeys) {
                        if (k == index) {
                          total = 0;
                        }
                      }
                      var listValues = mapTotal.values.toList();
                      for (int v in listValues) {
                        total += v;
                      }
                    });
                  },
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
                      children: [
                        const TextView(
                            data: 'Total', isBold: true, color: Colors.black),
                        const Spacer(),
                        TextView(
                          isBold: true,
                          color: Colors.orange,
                          data: '${Utils.formatNumber(total)} VNĐ',
                        ),
                      ],
                    ),
                  ),
                  PaddingView(
                    horizontal: 20,
                    vertical: 10,
                    widget: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          );
                          Future.delayed(const Duration(milliseconds: 1000),
                              () {
                            Navigator.of(context, rootNavigator: true)
                                .pop('dialog');
                            _payProduct(products, total, mapTotal);
                          });
                        },
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
                          data: 'Buy now',
                          isBold: true,
                          color: Colors.white,
                        ),
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

  void _payProduct(
      List<CartProduct> products, int total, HashMap<int, int> mapTotal) {
    if (total == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Hãy chọn số lượng để thanh toán"),
        ),
      );
      return;
    }
    total = 0;
    mapTotal.clear();
    products.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Thanh toán thành công"),
      ),
    );
    Navigator.pop(context, products);
  }
}
