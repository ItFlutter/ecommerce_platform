import 'dart:io';

import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/data/model/categoriesmodel.dart';
import 'package:admin/data/model/itemsmodel.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statuscode.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/functions/uploadfile.dart';
import '../../data/datasource/remote/categories_data.dart';
import '../../data/datasource/remote/items.dart';

class ItemsEditController extends GetxController {
  List<SelectedListItem> dropdownlist = [];

  ItemsData itemsdata = ItemsData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  late ItemsModel itemsModel;
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
  late String active;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }

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

  editData() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "id": itemsModel.itemsId,
        "name": name.text,
        "namear": namear.text,
        "desc": desc.text,
        "descar": descar.text,
        "count": count.text,
        "price": price.text,
        "discount": discount.text,
        "catid": catid.text,
        "active": active,
        "imageold": itemsModel.itemsImage
      };

      var response = await itemsdata.edit(data, file);
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

  changeStatusActive(val) {
    active = val;
    update();
  }

  @override
  void onInit() {
    itemsModel = Get.arguments['itemsModel'];
    active = itemsModel.itemsActive!;
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
    name.text = itemsModel.itemsName!;
    namear.text = itemsModel.itemsNameAr!;

    desc.text = itemsModel.itemsDesc!;
    descar.text = itemsModel.itemsDescAr!;

    count.text = itemsModel.itemsCount!;
    price.text = itemsModel.itemsPrice!;
    discount.text = itemsModel.itemsDiscount!;
    catid.text = itemsModel.categoriesId!;
    catname.text = itemsModel.categoriesName!;
    super.onInit();
  }
}
