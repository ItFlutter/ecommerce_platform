import 'dart:io';

import 'package:delivery/controller/homescreen_controller.dart';
import 'package:delivery/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());

    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
          appBar: AppBar(
            title: Text("106".tr),
          ),
          bottomNavigationBar: const CustomBottomAppBarHome(),
          body: WillPopScope(
              child: controller.listPage.elementAt(controller.currentPage),
              onWillPop: () {
                Get.defaultDialog(
                  title: "47".tr,
                  middleText: "48".tr,
                  onConfirm: () {
                    exit(0);
                  },
                  onCancel: () {},
                  titleStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor),
                  cancelTextColor: AppColor.secondryColor,
                  confirmTextColor: AppColor.secondryColor,
                  buttonColor: AppColor.thridColor,
                );
                return Future.value(true);
              })),
    );
  }
}
