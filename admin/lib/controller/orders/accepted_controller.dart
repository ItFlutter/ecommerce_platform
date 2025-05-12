import 'package:get/get.dart';

import '../../core/class/statuscode.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/sevices/sevices.dart';
import '../../data/datasource/remote/orders/accepted_data.dart';
import '../../data/model/ordersmodel.dart';

class OrdersAcceptedController extends GetxController {
  MyServices myservices = Get.find();
  OrdersAcceptedData ordersAcceptedData = OrdersAcceptedData(Get.find());
  late StatusRequest statusRequest;

  List<OrdersModel> data = [];
  String printOrderType(String val) {
    if (val == "0") {
      return "89".tr;
    } else {
      return "90".tr;
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "86".tr;
    } else {
      return "87".tr;
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "115".tr;
    } else if (val == "1") {
      return "It has been approved and is being prepared";
    } else if (val == "2") {
      return "Ready To Picked up by Delivery Man";
    } else if (val == "3") {
      return "117".tr;
    } else {
      return "107".tr;
    }
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersAcceptedData.getData();
    print("=====================================Controller ${response}");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      }
    }
    update();
  }

  donePrepare(String ordersid, String usersid, String orderstype) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await ordersAcceptedData.donePrepare(ordersid, usersid, orderstype);
    print("=====================================Controller ${response}");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        data.removeWhere((element) => element.ordersType == "1");
        refreshorder();
      }
    }
    update();
  }

  refreshorder() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
