import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomSubtitleCardChooseLanguage extends StatelessWidget {
  const CustomSubtitleCardChooseLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Text("151".tr,
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w700, color: AppColor.grey)),
    );
  }
}
