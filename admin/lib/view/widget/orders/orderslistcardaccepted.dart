import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/accepted_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../data/model/ordersmodel.dart';

class CardOrderListAccepted extends GetView<OrdersAcceptedController> {
  final OrdersModel listdata;
  const CardOrderListAccepted({Key? key, required this.listdata})
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
                      "${"100".tr}:${listdata.ordersTotalprice}\$",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor),
                    ),

                    // MaterialButton(
                    //   onPressed: () {
                    //     Get.toNamed(AppRoute.ordersdetails,
                    //         arguments: {'ordresmodel': listdata});
                    //   },
                    //   textColor: AppColor.grey2.withOpacity(0.7),
                    //   color: AppColor.thridColor,
                    //   child: Text("114".tr),
                    // ),
                    if (listdata.ordersStatus == "1")
                      MaterialButton(
                        onPressed: () {
                          controller.donePrepare(listdata.ordersId!,
                              listdata.ordersUsersid!, listdata.ordersType!);
                        },
                        textColor: AppColor.secondryColor,
                        color: AppColor.thridColor,
                        child: Text("184".tr),
                      ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
