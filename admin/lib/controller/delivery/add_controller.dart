import 'package:admin/controller/delivery/view_controller.dart';
import 'package:admin/core/class/statuscode.dart';
import 'package:admin/core/functions/handlingdatacontroller.dart';
import 'package:admin/data/datasource/remote/delivery.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DeliveryAddController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  DeliveryData deliveryData = DeliveryData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController name;
  late TextEditingController password;
  late TextEditingController email;
  late TextEditingController phone;
  addData() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await deliveryData.addData(
          name.text, password.text, email.text, phone.text);
      statusRequest = handlingData(response);
      update();
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'failureemailorphone') {
          return Get.snackbar("47".tr, "52".tr);
        } else if (response['status'] == 'failure') {
          return Get.snackbar("47".tr, "207".tr);
        } else {
          Get.back();
          DeliveryController controller = Get.find();
          controller.getData();
        }
      }
    }
    update();
  }

  @override
  void onInit() {
    name = TextEditingController();
    password = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }
}
