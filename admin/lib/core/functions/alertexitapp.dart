import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/color.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(title: "47".tr, middleText: "48".tr, actions: [
    ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: AppColor.primaryColor),
        onPressed: () {
          exit(0);
        },
        child: Text("49".tr)),
    ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: AppColor.primaryColor),
        onPressed: () {
          Get.back();
        },
        child: Text("50".tr)),
  ]);
  return Future.value(true);
}
