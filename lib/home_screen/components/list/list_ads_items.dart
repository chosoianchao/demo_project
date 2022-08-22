import 'package:flutter/material.dart';

import '../item/ads_item.dart';

class ListAdsItems extends StatelessWidget {
  const ListAdsItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return const AdsItems();
      },
    );
  }
}
