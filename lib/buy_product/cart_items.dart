import 'package:demo_project/model/cart_product.dart';
import 'package:demo_project/view/padding_view.dart';
import 'package:demo_project/view/text_view.dart';
import 'package:flutter/material.dart';

import '../Utils.dart';
import '../on_action_call_back.dart';

class CartItems extends StatefulWidget {
  final CartProduct cartProduct;
  final OnActionCallback callback;

  const CartItems({Key? key, required this.cartProduct, required this.callback})
      : super(key: key);

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  int count = 0;
  int total = 0;

  @override
  Widget build(BuildContext context) {
    return PaddingView(
      horizontal: 20,
      vertical: 10,
      widget: SizedBox(
        height: 120,
        child: Card(
          color: Colors.grey,
          child: Row(
            children: [
              SizedBox(
                height: 120,
                width: 100,
                child: Image(
                  image: AssetImage(widget.cartProduct.image),
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    data: widget.cartProduct.name,
                    isBold: true,
                    color: Colors.black,
                  ),
                  TextView(
                    data: "Size: ${widget.cartProduct.size}",
                    isBold: false,
                    color: Colors.black,
                  ),
                  TextView(
                      data:
                          '${Utils.formatNumber(widget.cartProduct.price)} VNĐ',
                      isBold: true,
                      color: Colors.black),
                ],
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Card(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (count == 0 || widget.cartProduct.amount <= 0) {
                              return;
                            }
                            count--;
                            total = count * widget.cartProduct.price;
                            widget.callback(total);
                          });
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      TextView(
                        data: count.toString(),
                        isBold: true,
                        color: Colors.black,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (count > widget.cartProduct.amount) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Số lượng bạn mua đã hết hàng"),
                                ),
                              );
                              return;
                            }
                            count++;
                            total = count * widget.cartProduct.price;
                            widget.callback(total);
                          });
                        },
                        icon: const Icon(
                          Icons.add,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
