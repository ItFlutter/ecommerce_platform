import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/linkapi.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(ItemsController());
    // Get.put
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.itemsadd);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("148".tr),
      ),
      body: GetBuilder<ItemsController>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {
                        controller.goToPageEdit(controller.data[index]);
                      },
                      child: Card(
                        child: Slidable(
                          closeOnScroll: false,
                          endActionPane: ActionPane(
                              motion: const BehindMotion(),
                              children: [
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
                                          confirmTextColor:
                                              AppColor.backgroundcolor,
                                          cancelTextColor:
                                              AppColor.secondryColor,
                                          buttonColor: AppColor.primaryColor,
                                          onCancel: () {},
                                          onConfirm: () {
                                            controller.deleteItems(
                                                controller.data[index].itemsId!,
                                                controller
                                                    .data[index].itemsImage!);
                                            Get.back();
                                          });
                                    })
                              ]),
                          child: ListTile(
                            title: Text(
                              controller.data[index].itemsName!,
                              style: const TextStyle(fontSize: 14),
                            ),
                            subtitle:
                                Text(controller.data[index].categoriesName!),
                            leading: Container(
                              height: 60,
                              width: 70,
                              padding: const EdgeInsets.all(5.0),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "${AppLink.imageitems}/${controller.data[index].itemsImage}",
                                // color: AppColor.grey,
                                // height: 50,
                                // width: 60,
                                fit: BoxFit.fill,
                              ),
                            ),
                            // IconButton(
                            //   icon: const Icon(
                            //       Icons.delete_outline_outlined),
                            //   onPressed: () {
                            //     Get.defaultDialog(
                            //         title: "47".tr,
                            //         middleText: "164".tr,
                            //         titleStyle: const TextStyle(
                            //             color: AppColor.primaryColor),
                            //         confirmTextColor:
                            //             AppColor.backgroundcolor,
                            //         cancelTextColor:
                            //             AppColor.secondryColor,
                            //         buttonColor: AppColor.primaryColor,
                            //         onCancel: () {},
                            //         onConfirm: () {
                            //           controller.deleteItems(
                            //               controller.data[index].itemsId!,
                            //               controller
                            //                   .data[index].itemsImage!);
                            //           Get.back();
                            //         });
                            //   },
                            // ),
                          ),
                        ),
                      ),
                    );
                  })),
            ));
      }),
    );
  }
}
