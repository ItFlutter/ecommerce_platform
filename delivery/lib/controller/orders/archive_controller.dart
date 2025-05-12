import 'package:get/get.dart';
import '../../core/class/statuscode.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/sevices/sevices.dart';
import '../../data/datasource/remote/orders/archive_data.dart';
import '../../data/model/ordersmodel.dart';

class OrdersArchiveController extends GetxController {
  MyServices myservices = Get.find();
  OrdersArchiveData ordersArchiveData = OrdersArchiveData(Get.find());
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
  //     return "116".tr;
  //   } else if (val == "2") {
  //     return "127".tr;
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
    var response = await ordersArchiveData
        .getData(myservices.sharedPreferences.getString("id")!);
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

  refreshorder() {
    getOrders();
  }

  // submitRating(String ordersid, double rating, String comment) async {
  //   data.clear();
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response =
  //       await ordersArchiveData.rating(ordersid, rating.toString(), comment);
  //   print("=====================================Controller ${response}");
  //   statusRequest = handlingData(response);
  //   if (statusRequest == StatusRequest.success) {
  //     if (response['status'] == "failure") {
  //       statusRequest = StatusRequest.failure;
  //     } else {
  //       getOrders();
  //     }
  //   }
  //   update();
  // }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
