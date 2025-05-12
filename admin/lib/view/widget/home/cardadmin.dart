import 'package:flutter/material.dart';

class CardAdminHome extends StatelessWidget {
  final String url;
  final String title;
  final double height;
  final Function()? onClick;
  const CardAdminHome(
      {super.key,
      required this.url,
      required this.title,
      required this.onClick,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              url,
              height: height,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
