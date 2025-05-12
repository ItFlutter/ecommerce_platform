import 'package:admin/core/constant/routes.dart';
import 'package:admin/data/datasource/remote/items.dart';
import 'package:admin/data/model/itemsmodel.dart';
import 'package:get/get.dart';
import '../../core/class/statuscode.dart';
import '../../core/functions/handlingdatacontroller.dart';

class ItemsController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());
  List<ItemsModel> data = [];
  late StatusRequest statusRequest;
  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.get();
    print("=====================================Controller ${response}");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => ItemsModel.fromJson(e)));
      }
    }
    update();
  }

  deleteItems(String id, String imagename) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.delete({"id": id, "imagename": imagename});
    print("==================Response_Controller===================$response");

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        data.removeWhere((element) => element.itemsId == id);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToPageEdit(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.itemsedit, arguments: {'itemsModel': itemsModel});
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
