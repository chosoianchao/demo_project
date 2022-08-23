import 'package:demo_project/constants.dart';
import 'package:demo_project/home_screen/components/list/list_item_categories.dart';
import 'package:demo_project/home_screen/components/list/list_items_product.dart';
import 'package:demo_project/model/cart_product.dart';
import 'package:demo_project/model/product.dart';
import 'package:demo_project/view/appbar.dart';
import 'package:demo_project/view/bottom_navigation_bar.dart';
import 'package:demo_project/view/padding_view.dart';
import 'package:demo_project/view/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'list/list_ads_items.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _listItems = <Product>[];
  var _listItemsCart = <CartProduct>[];

  @override
  void initState() {
    _listItems.add(
      Product(
          price: 20000000,
          image: [
            "apple_pro_m2_2022.png",
            "silver.png",
          ],
          amount: 100,
          name: "Apple Watch - M2",
          information:
              "Apple Inc. là một tập đoàn công nghệ đa quốc gia của Mỹ có trụ sở chính tại Cupertino, California, chuyên thiết kế, phát triển và bán thiết bị điện tử tiêu dùng, phần mềm máy tính và các dịch vụ trực tuyến. Nó được coi là một trong Năm công ty lớn của ngành công nghệ thông tin Hoa Kỳ, cùng với Amazon, Google, Microsoft và Meta",
          review: 4500,
          size: [31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45]),
    );

    _listItems.add(
      Product(
          price: 15000000,
          image: [
            "mac_mini_m1.png",
          ],
          review: 4500,
          name: "Apple Watch - M2",
          amount: 100,
          information: "",
          size: [31, 32, 33, 34]),
    );
    _listItems.add(
      Product(
          price: 15000000,
          image: [
            "mac_mini_m1.png",
          ],
          review: 4500,
          name: "Apple Watch - M2",
          amount: 100,
          information: "",
          size: [31, 32, 33, 34]),
    );
    _listItems.add(
      Product(
          price: 15000000,
          image: [
            "mac_mini_m1.png",
          ],
          review: 4500,
          name: "Apple Watch - M2",
          amount: 100,
          information: "",
          size: [31, 32, 33, 34]),
    );
    _listItems.add(
      Product(
          price: 15000000,
          image: [
            "mac_mini_m1.png",
          ],
          review: 4500,
          name: "Apple Watch - M2",
          amount: 100,
          information: "",
          size: [31, 32, 33, 34]),
    );
    _listItems.add(
      Product(
          price: 15000000,
          image: [
            "mac_mini_m1.png",
          ],
          review: 4500,
          name: "Apple Watch - M2",
          amount: 100,
          information: "",
          size: [31, 32, 33, 34]),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarView(
          isHome: true,
          count: _listItemsCart.length,
          iconAction: const Icon(Icons.search),
          iconLeading: const Icon(Icons.ac_unit_outlined),
          title: "",
          onPressIconAction: () {
            _onPressSearch(_listItemsCart);
          },
          onPressIconLeading: () {},
        ),
        bottomNavigationBar: const BottomNavigationBarView(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PaddingView(
                horizontal: 20,
                vertical: 20,
                widget: Row(
                  children: const [
                    TextView(
                      data: 'Hello Rocky',
                      isBold: true,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(
                        Icons.emoji_emotions_sharp,
                      ),
                    )
                  ],
                ),
              ),
              const PaddingView(
                horizontal: 20,
                vertical: 0,
                widget: TextView(
                  data: "Let's get's somethings?",
                  color: Colors.black,
                  isBold: false,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 120),
                child: const ListAdsItems(),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const PaddingView(
                    horizontal: 20,
                    vertical: 0,
                    widget: TextView(
                      data: ' Top categories',
                      isBold: true,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const TextView(
                      data: "See all",
                      color: Colors.orange,
                      isBold: true,
                    ),
                  ),
                ],
              ),
              PaddingView(
                horizontal: 20,
                vertical: 0,
                widget: ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 50),
                  child: const ListItemCategories(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              PaddingView(
                horizontal: 20,
                vertical: 0,
                widget: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height,
                  ),
                  child: ListProducts(
                      goToScreenM2: _goToScreenM2, listItems: _listItems),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onPressSearch(List<CartProduct> listItemsCart) async {
    var result = await Navigator.pushNamed(context, Constants.buyProductScreen,
        arguments: listItemsCart);
    setState(() {
      _listItemsCart = result as List<CartProduct>;
    });
  }

  _goToScreenM2(Product product) async {
    final result = await Navigator.pushNamed(
        context, Constants.informationProductScreen,
        arguments: product);
    setState(() {
      for (int i = 0; i < _listItemsCart.length; i++) {
        if (_listItemsCart[i] == result) {
          _listItemsCart.remove(_listItemsCart[i]);
        }
      }
      _listItemsCart.add(result as CartProduct);
    });
  }
}
