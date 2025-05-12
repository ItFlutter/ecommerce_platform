import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/categories/view_controller.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesController());
    // Get.put
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.categoriesadd);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("59".tr),
      ),
      body: GetBuilder<CategoriesController>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                            controller.deleteCategory(
                                                controller
                                                    .data[index].categoriesId!,
                                                controller.data[index]
                                                    .categoriesImage!);
                                            Get.back();
                                          });
                                    })
                              ]),
                          child: ListTile(
                            title: Text(controller.data[index].categoriesName!),
                            subtitle: Text(
                                controller.data[index].categoriesDatetime!),
                            leading: Container(
                              height: 70,
                              width: 70,
                              padding: const EdgeInsets.all(5.0),
                              child: SvgPicture.network(
                                "${AppLink.imagecategories}/${controller.data[index].categoriesImage}",
                                color: AppColor.grey,
                                // height: 50,
                                // width: 50,
                                fit: BoxFit.contain,
                              ),
                            ),
                            // trailing: IconButton(
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
                            //           controller.deleteCategory(
                            //               controller.data[index]
                            //                   .categoriesId!,
                            //               controller.data[index]
                            //                   .categoriesImage!);
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
