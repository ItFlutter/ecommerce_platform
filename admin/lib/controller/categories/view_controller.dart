import 'package:admin/core/constant/routes.dart';
import 'package:get/get.dart';

import '../../core/class/statuscode.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/categories_data.dart';
import '../../data/model/categoriesmodel.dart';

class CategoriesController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());
  List<Categoriesmodel> data = [];
  late StatusRequest statusRequest;
  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await categoriesData.get();
    print("=====================================Controller ${response}");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "failure") {
        statusRequest = StatusRequest.failure;
      } else {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => Categoriesmodel.fromJson(e)));
      }
    }
    update();
  }

  deleteCategory(String id, String imagename) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await categoriesData.delete({"id": id, "imagename": imagename});
    print("==================Response_Controller===================$response");

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        data.removeWhere((element) => element.categoriesId == id);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToPageEdit(Categoriesmodel categoriesmodel) {
    Get.toNamed(AppRoute.categoriesedit,
        arguments: {'categoriesModel': categoriesmodel});
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
