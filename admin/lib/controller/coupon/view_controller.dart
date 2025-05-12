import 'package:admin/core/class/statuscode.dart';
import 'package:admin/core/functions/handlingdatacontroller.dart';
import 'package:admin/data/model/couponmodel.dart';
import 'package:get/get.dart';

import '../../data/datasource/remote/coupon.dart';

class CouponController extends GetxController {
  CouponData couponData = CouponData(Get.find());
  StatusRequest? statusRequest;
  List<CouponModel> data = [];
  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await couponData.getData();
    print("=====================response Controller================$response");

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "failure") {
        statusRequest == StatusRequest.failure;
      } else {
        List listdata = response['data'];
        data.addAll(listdata.map((element) {
          return CouponModel.fromJson(element);
        }));
      }
    }
    update();
  }

  deleteData(String id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await couponData.deleteData(id);
    print("=====================response Controller================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "failure") {
        Get.snackbar("47".tr, "196".tr);
      } else {
        data.removeWhere((element) => element.couponId == id);
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    // TODO: implement onInit
    super.onInit();
  }
}
