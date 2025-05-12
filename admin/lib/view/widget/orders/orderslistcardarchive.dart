import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/archive_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../data/model/ordersmodel.dart';

class CardOrderListArchive extends GetView<OrdersArchiveController> {
  final OrdersModel listdata;
  const CardOrderListArchive({Key? key, required this.listdata})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.ordersdetails,
            arguments: {'ordresmodel': listdata});
      },
      child: Card(
        child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${"108".tr} : #${listdata.ordersId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      Jiffy.parse(listdata.ordersDatetime!).fromNow(),
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Divider(),
                Text(
                    "${"109".tr} : ${controller.printOrderType(listdata.ordersType!)}"),
                Text("${"110".tr} : ${listdata.ordersPrice} \$"),
                listdata.ordersType! == "0"
                    ? Text("${"111".tr} : ${listdata.ordersPricedelivery} \$")
                    : Container(),
                Text(
                    "${"112".tr} : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)}"),
                Text(
                    "${"113".tr} : ${controller.printOrderStatus(listdata.ordersStatus!)}"),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${"100".tr} : ${listdata.ordersTotalprice}\$",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor),
                    ),
                    InkWell(
                      onTap: () {
                        Get.defaultDialog(
                            title:
                                "${listdata.ordersNoterating == "none" ? "209".tr : listdata.ordersNoterating}",
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ...List.generate(
                                    int.parse(listdata.ordersRating!), (index) {
                                  return const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  );
                                }),
                              ],
                            ));
                      },
                      child: Text(
                        "Rating: ${listdata.ordersRating == "0" ? "-" : listdata.ordersRating}/5",
                        style: const TextStyle(color: Colors.black),
                      ),
                    )
                    // MaterialButton(
                    //   onPressed: () {
                    //     Get.toNamed(AppRoute.ordersdetails,
                    //         arguments: {'ordresmodel': listdata});
                    //   },
                    //   textColor: AppColor.secondryColor,
                    //   color: AppColor.thridColor,
                    //   child: Text("114".tr),
                    // ),
                    // if (listdata.ordersRating == "0")
                    //   MaterialButton(
                    //     onPressed: () {
                    //       showDialogRating(context, listdata.ordersId!);
                    //     },
                    //     textColor: AppColor.secondryColor,
                    //     color: AppColor.thridColor,
                    //     child: Text("66".tr),
                    //   ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
