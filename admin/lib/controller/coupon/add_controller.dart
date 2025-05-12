import 'package:admin/controller/coupon/view_controller.dart';
import 'package:admin/core/class/statuscode.dart';
import 'package:admin/core/functions/handlingdatacontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/datasource/remote/coupon.dart';

class CouponAddController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  CouponData couponData = CouponData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController name;
  late TextEditingController count;
  late TextEditingController discount;
  DateTime? expireDate;
  addData() async {
    if (formState.currentState!.validate()) {
      if (expireDate == null) {
        return Get.snackbar("47".tr, "193".tr);
      }
      if (expireDate!.isBefore(DateTime.now())) {
        return Get.snackbar("47".tr, "194".tr);
      }
      statusRequest = StatusRequest.loading;
      update();
      var response = await couponData.addData(
          name.text, count.text, discount.text, expireDate.toString());
      print(
          "=====================response Controller================$response");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "failre") {
          return Get.snackbar("47".tr, "195".tr);
        } else {
          CouponController controller = Get.find();
          controller.getData();
          Get.back();
        }
      }
    }
    update();
  }

  setExpireDate(DateTime dateTime) {
    expireDate = dateTime;
    update();
  }

  @override
  void onInit() {
    name = TextEditingController();
    count = TextEditingController();
    discount = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }
}
