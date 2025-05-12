import 'dart:io';

import 'package:admin/data/model/categoriesmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statuscode.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/functions/uploadfile.dart';
import '../../data/datasource/remote/categories_data.dart';
import 'view_controller.dart';

class CategoriesEditController extends GetxController {
  CategoriesData categoreisdata = CategoriesData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  late Categoriesmodel categoriesModel;
  late TextEditingController name;
  late TextEditingController namear;
  File? file;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  editData() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "id": categoriesModel.categoriesId,
        "name": name.text,
        "namear": namear.text,
        "imageold": categoriesModel.categoriesImage
      };

      var response = await categoreisdata.edit(data, file);
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
    categoriesModel = Get.arguments['categoriesModel'];
    name = TextEditingController();
    namear = TextEditingController();
    name.text = categoriesModel.categoriesName!;
    namear.text = categoriesModel.categoriesNameAr!;
    super.onInit();
  }
}
