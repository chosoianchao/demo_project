import 'package:demo_project/buy_product/buy_product_screen.dart';
import 'package:demo_project/constants.dart';
import 'package:demo_project/information_product/information_product_screen.dart';
import 'package:flutter/material.dart';

import '../home_screen/components/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Constants.homeScreen,
      routes: {
        Constants.homeScreen: (context) => const MyHomePage(title: ""),
        Constants.informationProductScreen: (context) =>
            const InformationProductScreen(),
        Constants.buyProductScreen: (context) => const BuyProductScreen(),
      },
    );
  }
}
