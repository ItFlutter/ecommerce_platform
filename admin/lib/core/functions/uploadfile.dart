import 'dart:io';

import 'package:admin/core/constant/color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

imageUploadCamera() async {
  final PickedFile? file = await ImagePicker()
      .getImage(source: ImageSource.camera, imageQuality: 100);
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

fileUploadGallery([isSvg = false]) async {
  final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: isSvg
          ? ["svg", "SVG"]
          : ["png", "PNG", "jpg", "JPG", "jpeg", "JPEG", "gif", "GIF"]);
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

showBottomMenu(Function() imageUploadCamera, Function() fileUploadGallery) {
  Get.bottomSheet(
      backgroundColor: AppColor.backgroundcolor,
      SizedBox(
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "163".tr,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            // Container(
            //   alignment: Alignment.topLeft,
            //   child: Text(
            //     "Choose Image:",
            //     style: TextStyle(fontWeight: FontWeight.bold),
            //   ),
            // ),
            InkWell(
              onTap: () {
                imageUploadCamera();
                Get.back();
              },
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 10.0),
                    child: Icon(
                      Icons.photo_camera,
                      color: AppColor.grey2,
                    ),
                  ),
                  Text(
                    "175".tr,
                    style: const TextStyle(
                        color: AppColor.black, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 0.9,
            ),
            InkWell(
              onTap: () {
                fileUploadGallery();
                Get.back();
              },
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 10.0),
                    child: Icon(
                      Icons.image,
                      color: AppColor.grey2,
                    ),
                  ),
                  Text(
                    "176".tr,
                    style: const TextStyle(
                        color: AppColor.black, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ));
}
/*

  MaterialButton(
                      onPressed: () async {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 150,
                                child: Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20),
                                      child: Text(
                                        "Please Choose",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        XFile? xfile = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.camera);
                                        Navigator.of(context).pop();
                                        setState(() {});
                                        myfile = File(xfile!.path);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.camera,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "From Camera",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        XFile? xfile = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.gallery);
                                        Navigator.of(context).pop();
                                        setState(() {});
                                        myfile = File(xfile!.path);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 8.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.image,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "From Gallery",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Text("Choose Image"),
                      textColor: Colors.white,
                      color: myfile == null ? Colors.blue : Colors.green,
                    ),
*/