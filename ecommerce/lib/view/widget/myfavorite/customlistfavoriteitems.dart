import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/myfavoritecontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/data/model/myfavorite.dart';
import 'package:ecommerce/linkapi.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class CustomListFavoriteItems extends GetView<MyFavoriteControllerImp> {
  final MyFavoriteModel favoriteModel;
  final ItemsModel itemsModel;
  const CustomListFavoriteItems(
      {Key? key, required this.itemsModel, required this.favoriteModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);
      },
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: favoriteModel.itemsId!,
              child: CachedNetworkImage(
                imageUrl: "${AppLink.imageitems}/${favoriteModel.itemsImage!}",
                width: 150,
                height: 130,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 10),
            Text(
                "${translateDatabase(favoriteModel.itemsNameAr, favoriteModel.itemsName)}",
                style: const TextStyle(
                    fontSize: 15,
                    color: AppColor.black,
                    fontWeight: FontWeight.bold)),
            // Container(
            //   height: 30,
            //   alignment: Alignment.bottomCenter,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         "66".tr,
            //       ),
            //       Row(
            //         children: [
            //           ...List.generate(
            //               5,
            //               (index) => const Padding(
            //                     padding: EdgeInsets.only(top: 7.0),
            //                     child: Icon(
            //                       Icons.star,
            //                       size: 13,
            //                     ),
            //                   ))
            //         ],
            //       )
            //     ],
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${favoriteModel.itemspricediscount!} \$",
                  style: const TextStyle(
                      color: AppColor.primaryColor, fontFamily: "sans"),
                ),
                IconButton(
                  onPressed: () {
                    controller.deleteFromFavorite(favoriteModel.favoriteId!);
                  },
                  icon: const Icon(Icons.delete_outline_outlined),
                  color: AppColor.primaryColor,
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
