import 'package:flutter/material.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ClipRRect(
      child: Card(
        child: Icon(Icons.watch_sharp),
      ),
    );
  }
}
