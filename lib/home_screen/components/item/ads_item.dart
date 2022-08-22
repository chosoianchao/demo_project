import 'package:demo_project/view/padding_view.dart';
import 'package:flutter/material.dart';

class AdsItems extends StatelessWidget {
  const AdsItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: Card(
        color: Colors.orange,
        child: Row(
          children: [
            PaddingView(
              horizontal: 10,
              vertical: 0,
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("30% OFF DURING"),
                  const Text("COVID 19"),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: const Text(
                      "Get New",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ),
            const PaddingView(
              horizontal: 10,
              vertical: 0,
              widget: SizedBox(
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'tui.jpg',
                  ),
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
