import 'package:demo_project/information_product/components/item/size_item.dart';
import 'package:demo_project/information_product/components/list/page_view_image_product.dart';
import 'package:demo_project/model/cart_product.dart';
import 'package:demo_project/model/product.dart';
import 'package:demo_project/view/padding_view.dart';
import 'package:demo_project/view/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Utils.dart';
import '../view/appbar.dart';

class InformationProductScreen extends StatefulWidget {
  const InformationProductScreen({Key? key}) : super(key: key);

  @override
  State<InformationProductScreen> createState() =>
      _InformationProductScreenState();
}

class _InformationProductScreenState extends State<InformationProductScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.initState();
  }
  int _selectIndex = -1;

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as Product;
    TabController controller = TabController(
        length: product.image.length, vsync: this, initialIndex: 0);
    return SafeArea(
      child: Scaffold(
        appBar: AppBarView(
          title: "",
          iconLeading: const Icon(Icons.arrow_back),
          isHome: false,
          iconAction: const Icon(null),
          count: 0,
          onPressIconLeading: () {
            Navigator.pop(context);
          },
          onPressIconAction: () {},
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 300,
                ),
                child: Stack(
                  children: [
                    PageViewImages(
                      images: product.image,
                      callback: (val) {
                        controller.animateTo(val);
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: TabPageSelector(
                        selectedColor: Colors.orange,
                        controller: controller,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              PaddingView(
                horizontal: 20,
                vertical: 0,
                widget: TextView(
                  data: product.name,
                  isBold: true,
                  color: Colors.black,
                ),
              ),
              PaddingView(
                horizontal: 20,
                vertical: 0,
                widget: Row(
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 50),
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: const [
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextView(
                        data: '(${product.review.toString()} Reviews)',
                        isBold: false,
                        color: Colors.black),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              PaddingView(
                horizontal: 20,
                vertical: 0,
                widget: Row(
                  children: [
                    TextView(
                      data: '${Utils.formatNumber(product.price)} VNĐ',
                      isBold: true,
                      color: Colors.black,
                    ),
                    const Spacer(),
                    TextView(
                      data: product.amount <= 0
                          ? "Out of stock"
                          : 'Available of stock',
                      isBold: true,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const PaddingView(
                horizontal: 20,
                vertical: 0,
                widget: TextView(
                  data: 'About',
                  isBold: false,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              PaddingView(
                horizontal: 20,
                vertical: 0,
                widget: TextView(
                  data: product.information,
                  isBold: false,
                  color: Colors.black,
                ),
              ),
              PaddingView(
                horizontal: 10,
                vertical: 20,
                widget: ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 50),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: product.size.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var item = product.size[index];
                      return InkWell(
                        child: SizeItem(
                          size: item,
                          boxColor: _selectIndex == index
                              ? Colors.orange
                              : Colors.white,
                        ),
                        onTap: () {
                          _changeColorBackGround(index);
                        },
                      );
                    },
                  ),
                ),
              ),
              PaddingView(
                horizontal: 20,
                vertical: 20,
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
                      Future.delayed(const Duration(milliseconds: 1000), () {
                        Navigator.of(context, rootNavigator: true).pop('dialog');
                        _addItemsToCart(product);
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: const TextView(
                      data: 'Add to cart',
                      color: Colors.white,
                      isBold: false,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _changeColorBackGround(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  _addItemsToCart(Product product) {
    if (_selectIndex == -1) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please choose your size"),
      ));
      return;
    }
    var item = CartProduct(
        image: product.image[0],
        name: product.name,
        amount: product.amount,
        size: product.size[_selectIndex],
        price: product.price);
    Navigator.pop(context, item);
  }
}
