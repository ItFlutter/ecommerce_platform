import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/imageasset.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import '../../../controller/coupon/view_controller.dart';
import '../../../core/constant/color.dart';

class CouponView extends StatelessWidget {
  const CouponView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CouponController());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoute.couponadd);
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(title: Text("185".tr)),
        body: GetBuilder<CouponController>(
          builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest!,
                widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed(AppRoute.couponedit, arguments: {
                            "couponModel": controller.data[index]
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
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
                                              buttonColor:
                                                  AppColor.primaryColor,
                                              onCancel: () {},
                                              onConfirm: () {
                                                controller.deleteData(
                                                  controller
                                                      .data[index].couponId!,
                                                );
                                                Get.back();
                                              });
                                        })
                                  ]),
                              child: ListTile(
                                leading: Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  width: 90,
                                  child: Image.asset(
                                    AppImageAsset.couponbackground,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  "${controller.data[index].couponDiscount!}% off",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black.withOpacity(0.7)),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(controller.data[index].couponName!),
                                    Row(
                                      children: [
                                        Jiffy.parse(controller.data[index]
                                                        .couponExpiredate!

                                                    // "yyy-MM-dd"
                                                    )
                                                .fromNow(
                                                    // DateTime.now(),
                                                    )
                                                .contains("ago")
                                            ? Container()
                                            : Text(
                                                "192".tr + " ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black
                                                        .withOpacity(0.7)),
                                              ),
                                        Text(
                                          Jiffy.parse(controller.data[index]
                                                          .couponExpiredate!

                                                      // "yyy-MM-dd"
                                                      )
                                                  .fromNow(
                                                      // DateTime.now(),
                                                      )
                                                  .contains("ago")
                                              ? "210".tr
                                              : Jiffy.parse(controller
                                                          .data[index]
                                                          .couponExpiredate!

                                                      // "yyy-MM-dd"
                                                      )
                                                  .fromNow(
                                                      // DateTime.now(),
                                                      ),
                                          style: const TextStyle(
                                              color: Color(0xffc52b2b),
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              )),
        ));
  }
}
