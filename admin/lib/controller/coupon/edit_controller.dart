import 'package:admin/controller/coupon/view_controller.dart';
import 'package:admin/core/class/statuscode.dart';
import 'package:admin/core/functions/handlingdatacontroller.dart';
import 'package:admin/data/model/couponmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/datasource/remote/coupon.dart';

class CouponEditController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  CouponData couponData = CouponData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController name;
  late TextEditingController count;
  late TextEditingController discount;
  late String currentexpireDate;
  DateTime? expireDate;
  late CouponModel couponModel;
  editData() async {
    if (formState.currentState!.validate()) {
      // if (expireDate == null) {
      //   return Get.snackbar("47".tr, "Please Choose Expire Date");
      // }
      if (expireDate != null && expireDate!.isBefore(DateTime.now())) {
        return Get.snackbar("47".tr, "194".tr);
      }
      statusRequest = StatusRequest.loading;
      update();
      var response;
      if (expireDate == null) {
        response = await couponData.editData(
            name.text, count.text, discount.text, couponModel.couponId!);
      } else {
        response = await couponData.editData(name.text, count.text,
            discount.text, couponModel.couponId!, expireDate.toString());
      }

      print(
          "=====================response Controller================$response");
      statusRequest = handlingData(response);
      update();
      if (response['status'] == 'failurename') {
        return Get.snackbar("47".tr, "195".tr);
      }
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "failure") {
          return Get.snackbar("47".tr, "No Update in Data");
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
    couponModel = Get.arguments['couponModel'];
    name = TextEditingController();
    count = TextEditingController();
    discount = TextEditingController();
    name.text = couponModel.couponName!;
    count.text = couponModel.couponCount!;
    discount.text = couponModel.couponDiscount!;
    // TODO: implement onInit
    super.onInit();
  }
}
