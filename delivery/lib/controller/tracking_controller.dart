import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/sevices/sevices.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../core/class/statuscode.dart';
import '../core/functions/getPolyline.dart';
import '../core/functions/getdecodePolyline.dart';
import '../data/model/ordersmodel.dart';
import 'orders/accepted_controller.dart';

class TrackingController extends GetxController {
  OrdersAcceptedController ordersAcceptedController =
      Get.put(OrdersAcceptedController());
  Timer? timer;
  MyServices myServices = Get.find();
  Set<Polyline> polylineSet = {};

  GoogleMapController? gmc;
  late OrdersModel ordersModel;
  CameraPosition? cameraPosition;
  double? currentlat;
  double? currentlong;
  late double destlat;
  late double destlong;

  StatusRequest statusRequest = StatusRequest.none;
  Set<Marker> markers = {};

  StreamSubscription<Position>? positionStream;
  donedelivery() async {
    // statusRequest = StatusRequest.loading;
    // update();
    await ordersAcceptedController.doneDelivery(
        ordersModel.ordersId!, ordersModel.ordersUsersid!);
    Get.offAllNamed(AppRoute.homepage);
    // statusRequest = StatusRequest.none;
    // update();
  }

  getCurrentLocation() async {
    // statusRequest = StatusRequest.loading;
    // update();
    // await Future.delayed(Duration(seconds: 2));
    // destlat = double.parse(ordersModel.addressLat!);
    // destlong = double.parse(ordersModel.addressLong!);
    cameraPosition =
        CameraPosition(target: LatLng(destlat, destlong), zoom: 12.4746);
    markers.add(Marker(
        markerId: const MarkerId("dest"),
        position: LatLng(destlat, destlong),
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure)));
    // statusRequest = StatusRequest.none;
    // update();
    positionStream =
        Geolocator.getPositionStream().listen((Position? position) {
      currentlat = position!.latitude;
      currentlong = position.longitude;
      // refreshLocation();
      initPolyline();

      print(
          "==========================latitude&longitude=============================${position}");
      // print(
      //     "==========================longitude=============================${position.longitude}");
      markers.removeWhere(
        (element) => element.markerId == MarkerId("current"),
      );
      markers.add(Marker(
          markerId: const MarkerId("current"),
          position: LatLng(currentlat!, currentlong!)));
      if (gmc != null && Get.currentRoute == "/tracking") {
        gmc!.animateCamera(
            CameraUpdate.newLatLng(LatLng(currentlat!, currentlong!)));
      }
      update();
    });
    print("===================================================afterlisten");
  }

// //===============================================API PREMINM================================================
//   initPolyline() async {
//     // await Future.delayed(Duration(seconds: 2));
//     // destlat = double.parse(ordersModel.addressLat!);
//     // destlong = double.parse(ordersModel.addressLong!);

//     polylineSet = await getPolyLine(currentlat, currentlong, destlat, destlong);
//   }
// //===========================================================================================================
//===============================================API PREMINM================================================
  initPolyline() async {
    // await Future.delayed(Duration(seconds: 2));
    // destlat = double.parse(ordersModel.addressLat!);
    // destlong = double.parse(ordersModel.addressLong!);

    polylineSet =
        await showPolyLine(currentlat, currentlong, destlat, destlong);
  }
//===========================================================================================================

  refreshLocation() async {
    print(
        "=================================================================StartFirestore");
    // await Future.delayed(const Duration(seconds: 2));
    timer = Timer.periodic(Duration(seconds: 10), (timer) {
      FirebaseFirestore.instance
          .collection("delivery")
          .doc(ordersModel.ordersId)
          .set({
        "lat": currentlat,
        "long": currentlong,
        "deliveryid": myServices.sharedPreferences.getString("id"),
      });
      print(
          "=================================================================Firestore");
    });
  }

  @override
  void onInit() {
    if (Get.previousRoute == "/ordersdetails") {
      ordersModel = Get.arguments['ordresmodel'];
    } else {
      ordersModel = Get.find();
    }
    destlat = double.parse(ordersModel.addressLat!);
    destlong = double.parse(ordersModel.addressLong!);
    getCurrentLocation();

    // initPolyline();

    refreshLocation();

    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    positionStream!.cancel();
    timer!.cancel();
    gmc!.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}
