import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/imageasset.dart';
import 'customradiochooselanguage.dart';
import 'customsubtitlecardchooselanguage.dart';
import 'customtitlecardchooselanguage.dart';

class CustomCardChooseLanguage extends StatelessWidget {
  const CustomCardChooseLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTitleCardChooseLanguage(),
            const CustomSubtitleCardChooseLanguage(),
            const SizedBox(
              height: 20,
            ),
            CustomRadioChooseLanguage(
                tiltle: "3".tr, assetName: AppImageAsset.english, value: "en"),
            const Divider(
              thickness: 0.9,
              height: 20,
            ),
            CustomRadioChooseLanguage(
                tiltle: "2".tr, assetName: AppImageAsset.arabic, value: "ar"),
          ],
        ),
      ),
    );
  }
}
