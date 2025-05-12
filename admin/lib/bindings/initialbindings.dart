import 'package:get/get.dart';

import '../core/class/crud.dart';

// import 'controller/auth/signup_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    Get.put(Crud());
  }
}
