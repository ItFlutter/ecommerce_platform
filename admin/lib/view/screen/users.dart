import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../controller/users/view_controller.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UsersController());
    return Scaffold(
        appBar: AppBar(
          title: Text("157".tr),
        ),
        body: GetBuilder<UsersController>(
          builder: (controller) {
            return HandlingDataView(
                statusRequest: controller.statusRequest!,
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
                                        controller.data[index].usersId!,
                                      );
                                      Get.back();
                                    });
                              })
                        ]),
                        child: Card(
                          margin: const EdgeInsets.only(
                              right: 10, left: 10, top: 10),
                          child: ListTile(
                            leading: Stack(
                              children: [
                                Container(
                                  width: 60,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.grey[200],
                                      image: const DecorationImage(
                                          fit: BoxFit.scaleDown,
                                          image: AssetImage(
                                            AppImageAsset.avatar,
                                          ))),
                                ),
                                controller.data[index].usersApprove == "1"
                                    ? const Padding(
                                        padding:
                                            EdgeInsets.only(top: 1, left: 45),
                                        child: Icon(
                                          Icons.verified,
                                          color: Colors.blue,
                                          size: 17,
                                        ),
                                      )
                                    : const Padding(
                                        padding:
                                            EdgeInsets.only(top: 1, left: 45),
                                        child: Icon(
                                          Icons.cancel,
                                          color: Colors.red,
                                          size: 17,
                                        ),
                                      )
                              ],
                            ),
                            title: Text(
                              controller.data[index].usersName!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                            subtitle: Text(
                              controller.data[index].usersEmail!,
                              style: TextStyle(
                                  color: AppColor.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17),
                            ),
                          ),
                        ),
                      );
                    })));
          },
        ));
  }
}
