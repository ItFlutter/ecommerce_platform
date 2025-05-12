import 'package:flutter/material.dart';

import '../../../core/constant/imageasset.dart';

class CustomTopLanguageLogo extends StatelessWidget {
  const CustomTopLanguageLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        alignment: Alignment.topCenter,
        child: Image.asset(AppImageAsset.languageLogo,
            // alignment: Alignment.topLeft,
            height: 200,
            width: 200));
  }
}
