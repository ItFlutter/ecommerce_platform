import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statuscode.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/functions/uploadfile.dart';
import '../../data/datasource/remote/categories_data.dart';
import 'view_controller.dart';

class CategoriesAddController extends GetxController {
  CategoriesData categoreisdata = CategoriesData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController name;
  late TextEditingController namear;
  File? file;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  addData() async {
    if (formState.currentState!.validate()) {
      if (file == null) {
        return Get.snackbar("47".tr, "163".tr);
      }
      statusRequest = StatusRequest.loading;
      update();
      Map data = {"name": name.text, "namear": namear.text};
      var response = await categoreisdata.add(data, file);
      print("=====================================Controller ${response}");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "failure") {
          statusRequest = StatusRequest.failure;
        } else {
          Get.back();
          CategoriesController controller = Get.find();
          controller.getData();
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    namear = TextEditingController();
    super.onInit();
  }
}
