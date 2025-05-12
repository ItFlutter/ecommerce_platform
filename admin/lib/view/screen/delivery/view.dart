import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../controller/delivery/view_controller.dart';
import '../../../core/constant/routes.dart';

class DeliveryView extends StatelessWidget {
  const DeliveryView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DeliveryController());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoute.deliveryadd);
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("89".tr),
        ),
        body: GetBuilder<DeliveryController>(
          builder: (controller) {
            return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: ((context, index) {
                      return Slidable(
                        closeOnScroll: false,
                        endActionPane:
                            ActionPane(motion: const BehindMotion(), children: [
                          SlidableAction(
                              backgroundColor: Colors.red,
                              icon: Icons.delete,
                              label: "126".tr,
                              onPressed: (context) {
                                Get.defaultDialog(
                                    title: "47".tr,
                                    middleText: "164".tr,
                                    titleStyle: const TextStyle(
                                        color: AppColor.primaryColor),
                                    confirmTextColor: AppColor.backgroundcolor,
                                    cancelTextColor: AppColor.secondryColor,
                                    buttonColor: AppColor.primaryColor,
                                    onCancel: () {},
                                    onConfirm: () {
                                      controller.deleteData(
                                        controller.data[index].deliveryId!,
                                      );
                                      Get.back();
                                    });
                              })
                        ]),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(AppRoute.deliveryedit, arguments: {
                              'deliveryModel': controller.data[index]
                            });
                          },
                          child: Card(
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 10),
                            child: ListTile(
                              leading: Stack(
                                children: [
                                  Container(
                                    width: 55,
                                    // height: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.grey[200],
                                        image: const DecorationImage(
                                            fit: BoxFit.scaleDown,
                                            image: AssetImage(
                                              AppImageAsset.deliveryprofile,
                                            ))),
                                  ),
                                  controller.data[index].deliveryApprove == "1"
                                      ? const Padding(
                                          padding:
                                              EdgeInsets.only(top: 1, left: 42),
                                          child: Icon(
                                            Icons.verified,
                                            color: Colors.blue,
                                            size: 17,
                                          ),
                                        )
                                      : const Padding(
                                          padding:
                                              EdgeInsets.only(top: 1, left: 42),
                                          child: Icon(
                                            Icons.cancel,
                                            color: Colors.red,
                                            size: 17,
                                          ),
                                        )
                                ],
                              ),
                              title: Text(
                                controller.data[index].deliveryName!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              subtitle: Text(
                                controller.data[index].deliveryEmail!,
                                style: TextStyle(
                                    color: AppColor.grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17),
                              ),
                            ),
                          ),
                        ),
                      );
                    })));
          },
        ));
  }
}
