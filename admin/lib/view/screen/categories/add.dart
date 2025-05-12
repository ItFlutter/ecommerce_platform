import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/functions/validinput.dart';
import 'package:admin/core/shared/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/categories/add_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/shared/customtextformglobal.dart';

class CategoriesAdd extends StatelessWidget {
  const CategoriesAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoriesAddController controller = Get.put(CategoriesAddController());
    return Scaffold(
        bottomNavigationBar: CustomButton(
          text: "105".tr,
          onPressed: () {
            controller.addData();
          },
        ),
        appBar: AppBar(title: Text("159".tr)),
        body: GetBuilder<CategoriesAddController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                      padding: const EdgeInsets.only(
                          bottom: 10, left: 10, right: 10, top: 20),
                      child: Form(
                        key: controller.formState,
                        child: ListView(
                          children: [
                            CustomTextFormGlobal(
                                hinttext: "160".tr + " " + "(" + "3".tr + ")",
                                labeltext: "161".tr + " " + "(" + "3".tr + ")",
                                iconData: Icons.interests,
                                mycontroller: controller.name,
                                valid: (val) {
                                  return validInput(val!, 1, 30, "");
                                },
                                isNumber: false),
                            CustomTextFormGlobal(
                                hinttext: "160".tr + " " + "(" + "2".tr + ")",
                                labeltext: "161".tr + " " + "(" + "2".tr + ")",
                                iconData: Icons.interests,
                                mycontroller: controller.namear,
                                valid: (val) {
                                  return validInput(val!, 1, 30, "");
                                },
                                isNumber: false),
                            if (controller.file != null)
                              Card(
                                  child: Container(
                                width: 120,
                                height: 120,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: SvgPicture.file(
                                  controller.file!,
                                  color: AppColor.grey,
                                ),
                              )),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: MaterialButton(
                                onPressed: () {
                                  controller.chooseImage();
                                },
                                color: AppColor.primaryColor,
                                textColor: AppColor.backgroundcolor,
                                child: Text("162".tr),
                              ),
                            ),
                          ],
                        ),
                      )),
                )));
  }
}
