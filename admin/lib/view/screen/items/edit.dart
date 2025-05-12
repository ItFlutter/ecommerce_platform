import 'package:admin/controller/items/edit_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/functions/validinput.dart';
import 'package:admin/core/shared/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../core/shared/customdropdownsearch.dart';
import '../../../core/shared/customtextformglobal.dart';

class ItemsEdit extends StatelessWidget {
  const ItemsEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsEditController());
    return Scaffold(
        appBar: AppBar(title: Text("181".tr)),
        body: GetBuilder<ItemsEditController>(
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
                              hinttext: "167".tr + " " + "(" + "3".tr + ")",
                              labeltext: "168".tr + " " + "(" + "3".tr + ")",
                              iconData: Icons.interests,
                              mycontroller: controller.name,
                              valid: (val) {
                                return validInput(val!, 1, 50, "");
                              },
                              isNumber: false),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CustomTextFormGlobal(
                              hinttext: "167".tr + " " + "(" + "2".tr + ")",
                              labeltext: "168".tr + " " + "(" + "2".tr + ")",
                              iconData: Icons.interests,
                              mycontroller: controller.namear,
                              valid: (val) {
                                return validInput(val!, 1, 50, "");
                              },
                              isNumber: false),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CustomTextFormGlobal(
                              hinttext: "171".tr + " " + "(" + "3".tr + ")",
                              labeltext: "170".tr + " " + "(" + "3".tr + ")",
                              iconData: Icons.description,
                              mycontroller: controller.desc,
                              valid: (val) {
                                return validInput(val!, 1, 200, "");
                              },
                              isNumber: false),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CustomTextFormGlobal(
                              hinttext: "171".tr + " " + "(" + "2".tr + ")",
                              labeltext: "170".tr + " " + "(" + "2".tr + ")",
                              iconData: Icons.description,
                              mycontroller: controller.descar,
                              valid: (val) {
                                return validInput(val!, 1, 200, "");
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
                                return validInput(val!, 1, 30, "");
                              },
                              isNumber: true),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CustomTextFormGlobal(
                              hinttext: "174".tr,
                              labeltext: "97".tr,
                              iconData: Icons.attach_money,
                              mycontroller: controller.price,
                              valid: (val) {
                                return validInput(val!, 1, 30, "");
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
                                return validInput(val!, 1, 30, "");
                              },
                              isNumber: true),
                        ),
                        CustomDropdownSearch(
                            title: "179".tr,
                            listdata: controller.dropdownlist,
                            dropdownSelectedName: controller.catname,
                            dropdownSelectedID: controller.catid),
                        Row(
                          children: [
                            Expanded(
                              child: RadioListTile(
                                  activeColor: AppColor.primaryColor,
                                  title: Text("183".tr),
                                  value: "0",
                                  groupValue: controller.active,
                                  onChanged: (val) {
                                    controller.changeStatusActive(val);
                                  }),
                            ),
                            Expanded(
                              child: RadioListTile(
                                  activeColor: AppColor.primaryColor,
                                  title: Text("182".tr),
                                  value: "1",
                                  groupValue: controller.active,
                                  onChanged: (val) {
                                    controller.changeStatusActive(val);
                                  }),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: MaterialButton(
                            // height: 50,
                            onPressed: () {
                              controller.showOptionImage();
                              // controller.chooseImage();
                            },
                            color: AppColor.primaryColor,
                            textColor: AppColor.backgroundcolor,
                            child: Text(
                              "169".tr,
                              // textAlign: TextAlign.center,
                              // style: const TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        if (controller.file != null)
                          Card(
                              child: Container(
                            // width: ,
                            height: 220,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Image.file(
                              controller.file!,
                              fit: BoxFit.contain,
                              // color: AppColor.grey,
                            ),
                          )),
                        CustomButton(
                          text: "37".tr,
                          onPressed: () {
                            controller.editData();
                          },
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
//discount