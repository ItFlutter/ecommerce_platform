import 'package:admin/core/class/statuscode.dart';
import 'package:admin/core/functions/handlingdatacontroller.dart';
import 'package:admin/data/datasource/remote/users.dart';
import 'package:admin/data/model/usersmodel.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  UsersData usersData = UsersData(Get.find());
  StatusRequest? statusRequest;
  List<UsersModel> data = [];
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await usersData.getData();
    print("=====================response Controller================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'failure') {
        statusRequest = StatusRequest.failure;
      } else {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => UsersModel.fromJson(e)));
      }
    }
    update();
  }

  deleteData(String id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await usersData.deleteData(id);
    print("=====================response Controller================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'failure') {
        Get.snackbar("47".tr, "196".tr);
      } else {
        data.removeWhere((element) => element.usersId == id);
      }
    }
    update();
  }

  // userStatus(String status) {
  //   if (status == "0") {
  //     return "Not Approve";
  //   } else {
  //     return "Approve";
  //   }
  // }

  @override
  void onInit() {
    getData();
    // TODO: implement onInit
    super.onInit();
  }
}
