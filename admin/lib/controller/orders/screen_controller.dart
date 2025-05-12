import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screen/orders/accepted.dart';
import '../../view/screen/orders/archive.dart';
import '../../view/screen/orders/pending.dart';

abstract class OrderScreenController extends GetxController {
  changePage(int i);
}

class OrderScreenControllerImp extends OrderScreenController {
  List<Widget> listPage = const [
    OrdersPending(),
    OrdersAccepted(),
    OrdersArchiveView(),
  ];
  List bottomappbar = [
    {
      "title": "152".tr,
      "icon": Icons.card_travel,
    },
    {"title": "153".tr, "icon": Icons.done},
    {"title": "107".tr, "icon": Icons.archive_outlined},
  ];
  int currentPage = 0;
  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
