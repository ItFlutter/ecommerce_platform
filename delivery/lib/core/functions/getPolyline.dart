import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<Set<Polyline>> showPolyLine(lat, long, destlat, destlong) async {
  Map<PolylineId, Polyline> polylines = {};
  Set<Polyline> polylinesSet = {};
  List<LatLng> polylineCoordinates = [];
  // PolylinePoints polylinePoints = PolylinePoints();
  // String googleAPiKey = "AIzaSyDqLLE19QhjqQI5D_PtFndsUKbkWif8q9I";
  // PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //   googleAPiKey,
  //   PointLatLng(lat, long),
  //   PointLatLng(destlat, destlong),
  //   travelMode: TravelMode.driving,
  // );
  // print(
  //     "===================================================================result");
  // print(result.errorMessage);
  // //=========================================================================================
  // if (result.points.isNotEmpty) {
  //   result.points.forEach((PointLatLng point) {
  //     polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //   });
  // }
  //=========================================================================================
  polylineCoordinates.add(LatLng(lat, long));
  polylineCoordinates.add(LatLng(destlat, destlong));

  PolylineId id = PolylineId("poly");
  Polyline polyline = Polyline(
      polylineId: id, color: Colors.red, points: polylineCoordinates, width: 5);
  polylines[id] = polyline;
  polylinesSet = Set.of(polylines.values);
  return polylinesSet;
}
