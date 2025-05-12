import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/functions/validinput.dart';
import 'package:admin/core/shared/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/delivery/add_controller.dart';
import '../../../core/shared/customtextformglobal.dart';

class DeliveryAdd extends StatelessWidget {
  const DeliveryAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DeliveryAddController());
    return Scaffold(
        appBar: AppBar(title: Text("206".tr)),
        body: GetBuilder<DeliveryAddController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Form(
                    key: controller.formState,
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CustomTextFormGlobal(
                              hinttext: "199".tr,
                              labeltext: "198".tr,
                              iconData: Icons.edit,
                              mycontroller: controller.name,
                              valid: (val) {
                                return validInput(val!, 1, 50, "username");
                              },
                              isNumber: false),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CustomTextFormGlobal(
                              hinttext: "201".tr,
                              labeltext: "200".tr,
                              iconData: Icons.vpn_key,
                              mycontroller: controller.password,
                              valid: (val) {
                                return validInput(val!, 3, 255, "");
                              },
                              isNumber: false),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CustomTextFormGlobal(
                              hinttext: "203".tr,
                              labeltext: "202".tr,
                              iconData: Icons.email,
                              mycontroller: controller.email,
                              valid: (val) {
                                return validInput(val!, 5, 255, "email");
                              },
                              isNumber: false),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CustomTextFormGlobal(
                              hinttext: "205".tr,
                              labeltext: "204".tr,
                              iconData: Icons.call,
                              mycontroller: controller.phone,
                              valid: (val) {
                                return validInput(val!, 4, 50, "phone");
                              },
                              isNumber: true),
                        ),
                        CustomButton(
                          text: "105".tr,
                          onPressed: () {
                            controller.addData();
                          },
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
//discount