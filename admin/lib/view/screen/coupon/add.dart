import 'package:admin/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/coupon/add_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/validinput.dart';
import '../../../core/shared/custombutton.dart';
import '../../../core/shared/customtextformglobal.dart';

class CouponAdd extends StatelessWidget {
  const CouponAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CouponAddController());
    return Scaffold(
        appBar: AppBar(title: Text("188".tr)),
        body: GetBuilder<CouponAddController>(builder: (controller) {
          return HandlingDataView(
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
                        hinttext: "187".tr,
                        labeltext: "186".tr,
                        iconData: Icons.local_offer,
                        mycontroller: controller.name,
                        valid: (val) {
                          return validInput(val!, 1, 50, "");
                        },
                        isNumber: false),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomTextFormGlobal(
                        hinttext: "173".tr,
                        labeltext: "172".tr,
                        iconData: Icons.category,
                        mycontroller: controller.count,
                        valid: (val) {
                          return validInput(val!, 1, 11, "");
                        },
                        isNumber: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomTextFormGlobal(
                        hinttext: "178".tr,
                        labeltext: "177".tr,
                        iconData: Icons.money_off,
                        mycontroller: controller.discount,
                        valid: (val) {
                          return validInput(val!, 1, 6, "");
                        },
                        isNumber: true),
                  ),
                  if (controller.expireDate != null)
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "190".tr + " ",
                            style: const TextStyle(
                                color: AppColor.black,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            controller.expireDate.toString(),
                            style:
                                const TextStyle(color: AppColor.secondryColor),
                          )
                        ],
                      ),
                    ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: MaterialButton(
                      // height: 50,
                      onPressed: () {
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate:
                                DateTime.now().add(const Duration(days: 720)),
                            builder: ((context, child) {
                              return Theme(
                                  data: ThemeData().copyWith(
                                      colorScheme: const ColorScheme.light(
                                          primary: AppColor.primaryColor)),
                                  child: child!);
                            })).then((value) {
                          if (value != null) {
                            print("===================================");
                            value =
                                value.add(Duration(hours: DateTime.now().hour));
                            value = value
                                .add(Duration(minutes: DateTime.now().minute));
                            value = value
                                .add(Duration(seconds: DateTime.now().second));
                            value = value.add(Duration(
                                microseconds: DateTime.now().microsecond));
                            value = value.add(Duration(
                                milliseconds: DateTime.now().millisecond));
                            print(value);
                            print("press ok");
                            print(DateTime.now());
                            print("===================================");
                            controller.setExpireDate(value);
                          }
                        });
                      },
                      color: AppColor.primaryColor,
                      textColor: AppColor.backgroundcolor,
                      child: Text(
                        "189".tr,
                        // textAlign: TextAlign.center,
                        // style: const TextStyle(fontSize: 15),
                      ),
                    ),
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
          );
        }));
  }
}
