import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/routes.dart';
import '../../core/localization/changelocal.dart';
import '../widget/language/custombuttonlang.dart';
import '../widget/language/customcardchooselanguage.dart';
import '../widget/language/customtoplanguagelogo.dart';

class Language extends GetView<LocaleController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomButtonLang(
          text: "96".tr,
          onPressed: () {
            controller.changeLang(controller.lang);
            Get.toNamed(AppRoute.login);
            controller.myServices.sharedPreferences.setString("step", "1");
          },
        ),
        body: GetBuilder<LocaleController>(
          builder: (controller) {
            return Container(
              margin: const EdgeInsets.only(
                top: 90,
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CustomTopLanguageLogo(),
                  CustomCardChooseLanguage()
                ],
              ),
            );
          },
        ));
  }
}
