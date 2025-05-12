import 'package:delivery/controller/test_controller.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    TestController controller = Get.put(TestController());
    return Scaffold(
      appBar: AppBar(title: Text("Test")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: MaterialButton(
              onPressed: () {
                controller.futureTimer();
                print("=============================button");
              },
              child: Text("timer"),
              color: AppColor.primaryColor,
            ),
          ),
          Center(
            child: MaterialButton(
              onPressed: () {
                controller.timer!.cancel();
              },
              child: Text("cancel"),
              color: AppColor.primaryColor,
            ),
          ),
          Center(
            child: MaterialButton(
              onPressed: () {
                Get.offNamed(AppRoute.test2);
              },
              child: Text("gopage"),
              color: AppColor.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
