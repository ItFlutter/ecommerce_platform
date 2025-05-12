import 'dart:io';

import 'package:admin/data/datasource/remote/categories_data.dart';
import 'package:admin/data/datasource/remote/items.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:drop_down_list/drop_down_list.dart';
import '../../core/class/statuscode.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/functions/uploadfile.dart';
import '../../data/model/categoriesmodel.dart';
import 'view_controller.dart';

class ItemsAddController extends GetxController {
  List<SelectedListItem> dropdownlist = [];
  ItemsData itemsData = ItemsData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController name;
  late TextEditingController namear;
  late TextEditingController desc;
  late TextEditingController descar;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;
  late TextEditingController catid;
  late TextEditingController catname;
  File? file;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  showOptionImage() {
    showBottomMenu(chooseImageCamera, chooseImageGalery);
  }

  chooseImageCamera() async {
    file = await imageUploadCamera();
    update();
  }

  chooseImageGalery() async {
    file = await fileUploadGallery(false);
    update();
  }

  getCategories() async {
    CategoriesData categoriesData = CategoriesData(Get.find());
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.get();
    print("=====================================Controller ${response}");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        List<Categoriesmodel> data = [];
        List datalist = response['data'];
        data.addAll(datalist.map((e) => Categoriesmodel.fromJson(e)));
        for (int i = 0; i < data.length; i++) {
          dropdownlist.add(SelectedListItem(
              name: data[i].categoriesName!, value: data[i].categoriesId));
        }
      }
    }
    update();
  }

  addData() async {
    if (formState.currentState!.validate()) {
      if (file == null) {
        return Get.snackbar("47".tr, "163".tr);
      }
      if (catid.text.isEmpty) {
        return Get.snackbar("47".tr, "180".tr);
      }
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "name": name.text,
        "namear": namear.text,
        "desc": desc.text,
        "descar": descar.text,
        "count": count.text,
        "price": price.text,
        "discount": discount.text,
        "datenow": DateTime.now().toString(),
        "catid": catid.text,
      };
      var response = await itemsData.add(data, file);
      print("=====================================Controller ${response}");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "failure") {
          statusRequest = StatusRequest.failure;
        } else {
          Get.back();
          ItemsController controller = Get.find();
          controller.getData();
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    getCategories();
    name = TextEditingController();
    namear = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    catid = TextEditingController();
    catname = TextEditingController();
    super.onInit();
  }
}
