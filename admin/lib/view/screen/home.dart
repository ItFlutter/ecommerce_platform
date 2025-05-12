import 'dart:io';

import 'package:admin/core/constant/imageasset.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/view/widget/home/cardadmin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';
import '../../core/constant/color.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    // FavoriteControllerImp controllerFav = Get.put(FavoriteControllerImp());

    return Scaffold(
      appBar: AppBar(title: Text("62".tr)),
      body: WillPopScope(
          onWillPop: () {
            Get.defaultDialog(
              title: "47".tr,
              middleText: "48".tr,
              onConfirm: () {
                exit(0);
              },
              onCancel: () {},
              titleStyle: const TextStyle(color: AppColor.primaryColor),
              confirmTextColor: AppColor.backgroundcolor,
              cancelTextColor: AppColor.secondryColor,
              buttonColor: AppColor.primaryColor,
            );
            return Future.value(true);
          },
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 150,
            ),
            children: [
              CardAdminHome(
                  url: AppImageAsset.categories,
                  height: 80,
                  title: "59".tr,
                  onClick: () {
                    Get.toNamed(AppRoute.categoriesview);
                  }),
              CardAdminHome(
                  height: 80,
                  url: AppImageAsset.product,
                  title: "148".tr,
                  onClick: () {
                    Get.toNamed(AppRoute.itemsview);
                  }),
              CardAdminHome(
                  height: 80,
                  url: AppImageAsset.orders,
                  title: "106".tr,
                  onClick: () {
                    Get.toNamed(AppRoute.ordershome);
                  }),
              CardAdminHome(
                  height: 80,
                  url: AppImageAsset.coupon,
                  title: "185".tr,
                  onClick: () {
                    Get.toNamed(AppRoute.couponview);
                  }),
              CardAdminHome(
                  height: 80,
                  url: AppImageAsset.users,
                  title: "157".tr,
                  onClick: () {
                    Get.toNamed(AppRoute.usersview);
                  }),
              CardAdminHome(
                  height: 80,
                  url: AppImageAsset.deliveryman,
                  title: "89".tr,
                  onClick: () {
                    Get.toNamed(AppRoute.deliveryview);
                  }),
              CardAdminHome(
                  height: 80,
                  url: AppImageAsset.report,
                  title: "156".tr,
                  onClick: () {}),
              CardAdminHome(
                  height: 80,
                  url: AppImageAsset.notification,
                  title: "134".tr,
                  onClick: () {}),
            ],
          )),
    );
  }
}
