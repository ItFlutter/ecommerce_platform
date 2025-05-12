import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomTitleCardChooseLanguage extends StatelessWidget {
  const CustomTitleCardChooseLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Text("150".tr,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: AppColor.black.withOpacity(0.7))),
    );
  }
}
