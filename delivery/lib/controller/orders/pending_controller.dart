import 'package:get/get.dart';

import '../../core/class/statuscode.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/sevices/sevices.dart';
import '../../data/datasource/remote/orders/pending_data.dart';
import '../../data/model/ordersmodel.dart';
import '../tracking_controller.dart';

class OrdersPendingController extends GetxController {
  OrdersModel? ordersModel;
  MyServices myservices = Get.find();
  OrdersPendingData ordersPendingData = OrdersPendingData(Get.find());
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

  // String printOrderStatus(String val) {
  //   if (val == "0") {
  //     return "115".tr;
  //   } else if (val == "1") {
  //     return "It has been approved and is being prepared";
  //   } else if (val == "2") {
  //     return "Ready To Picked up by Delivery Man";
  //   } else if (val == "3") {
  //     return "117".tr;
  //   } else {
  //     return "107".tr;
  //   }
  // }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData.getData();
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

  // enableTracking(OrdersModel ordersModel) {
  //   TrackingController controller = Get.put(TrackingController());
  //   controller.ordersModel = ordersModel;
  // }

  approveOrders(String ordersid, String usersid) async {
    // data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData.approveOrder(
      ordersid,
      usersid,
      myservices.sharedPreferences.getString("id")!,
    );
    print("=====================================Controller ${response}");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        // TrackingController trackingController = Get.put(TrackingController());
        // data.removeWhere((element) => element.ordersId == ordersid);
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
