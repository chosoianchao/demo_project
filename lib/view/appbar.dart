import 'package:flutter/material.dart';

class AppBarView extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Function()? onPressIconAction;
  final Function()? onPressIconLeading;
  final Icon iconLeading;
  final Icon iconAction;
  final int count;
  final bool isHome;

  const AppBarView({
    Key? key,
    required this.title,
    this.onPressIconAction,
    required this.iconLeading,
    required this.count,
    required this.isHome,
    this.onPressIconLeading,
    required this.iconAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconTheme(
        data: const IconThemeData(
          color: Colors.black,
        ),
        child: (IconButton(
          onPressed: onPressIconLeading,
          icon: iconLeading,
        )),
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      actions: [
        Visibility(
          visible: isHome ? true : false,
          child: Stack(
            children: [
              IconTheme(
                data: const IconThemeData(color: Colors.black),
                child: IconButton(
                  onPressed: onPressIconAction,
                  icon: iconAction,
                ),
              ),
              Visibility(
                child: Text(
                  isHome ? count.toString() : "",
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
