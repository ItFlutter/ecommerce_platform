import 'package:delivery/view/screen/orders/accepted.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screen/orders/archive.dart';
import '../view/screen/orders/pending.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  List<Widget> listPage = const [
    OrdersPending(),
    OrdersAccepted(),
    OrdersArchiveView(),
    // Text(""),
  ];
  List bottomappbar = [
    {
      "title": "152".tr,
      "icon": Icons.card_travel,
    },
    {"title": "153".tr, "icon": Icons.delivery_dining},
    {
      "title": "107".tr,
      "icon": Icons.archive_outlined,
    },
  ];
  int currentPage = 0;
  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
