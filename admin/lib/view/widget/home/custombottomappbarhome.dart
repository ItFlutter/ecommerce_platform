import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/archive_controller.dart';
import '../../../controller/orders/screen_controller.dart';
import '../../../controller/orders/accepted_controller.dart';
import 'custombuttonappbar.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderScreenControllerImp>(
        builder: (controller) => BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 5,
            child: Row(
              children: [
                ...List.generate(controller.listPage.length, (index) {
                  return Expanded(
                    child: CustomButtonAppBar(
                      textbutton: controller.bottomappbar[index]['title'],
                      onPressed: () {
                        controller.changePage(index);

                        Get.delete<OrdersAcceptedController>();
                        Get.delete<OrdersArchiveController>();
                      },
                      active: controller.currentPage == index ? true : false,
                      icondata: controller.bottomappbar[index]['icon'],
                    ),
                  );
                }),
              ],
            )));
  }
}
