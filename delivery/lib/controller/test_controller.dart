import 'dart:async';

import 'package:get/get.dart';

class TestController extends GetxController {
  Timer? timer;
  // testTimer() {
  //   Timer timer2;
  //   timer2 = Timer.periodic(Duration(seconds: 2), (timer) async {
  //     await Future.error("fsfdsf");
  //     print("=====================================timer");
  //   });
  // }

  futureTimer() async {
    await Future.delayed(Duration(seconds: 2), () {
      print("========================future");
    });
    print("=====================================afterfuture");
  }

  @override
  void onInit() {
    // testTimer();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // timer!.cancel();
    // TODO: implement onClose
    super.onClose();
  }
}
