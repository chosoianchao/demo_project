import 'package:flutter/cupertino.dart';

import '../item/categories_item.dart';

class ListItemCategories extends StatelessWidget {
  const ListItemCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 20,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return const CategoriesItem();
      },
    );
  }
}
