import 'package:admin/core/class/statuscode.dart';
import 'package:admin/core/functions/handlingdatacontroller.dart';
import 'package:admin/data/datasource/remote/delivery.dart';
import 'package:admin/data/model/deliverymodel.dart';
import 'package:get/get.dart';

class DeliveryController extends GetxController {
  DeliveryData deliveryData = DeliveryData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<DeliveryModel> data = [];
  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await deliveryData.getData();
    print("=====================response Controller================$response");

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'failure') {
        statusRequest = StatusRequest.failure;
      } else {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => DeliveryModel.fromJson(e)));
      }
    }
    update();
  }

  deleteData(String id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await deliveryData.deleteData(id);
    print("=====================response Controller================$response");

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'failure') {
        Get.snackbar("47".tr, "196".tr);
      } else {
        data.removeWhere((element) => element.deliveryId == id);
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
