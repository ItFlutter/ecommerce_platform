import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/orders/screen_controller.dart';
import '../../widget/home/custombottomappbarhome.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderScreenControllerImp());

    return GetBuilder<OrderScreenControllerImp>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text("106".tr),
        ),
        bottomNavigationBar: const CustomBottomAppBarHome(),
        // body: WillPopScope(
        //     child: controller.listPage.elementAt(controller.currentPage),
        //     onWillPop: () {
        //       Get.defaultDialog(
        //         title: "47".tr,
        //         middleText: "48".tr,
        //         onConfirm: () {
        //           exit(0);
        //         },
        //         onCancel: () {},
        //         titleStyle: const TextStyle(
        //             fontWeight: FontWeight.bold,
        //             color: AppColor.primaryColor),
        //         cancelTextColor: AppColor.secondryColor,
        //         confirmTextColor: AppColor.secondryColor,
        //         buttonColor: AppColor.thridColor,
        //       );
        //       return Future.value(true);
        //     })

        body: controller.listPage.elementAt(controller.currentPage),
      ),
    );
  }
}
