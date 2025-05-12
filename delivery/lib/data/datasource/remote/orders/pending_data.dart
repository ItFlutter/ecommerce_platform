import 'package:delivery/core/class/crud.dart';
import 'package:delivery/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewPendingOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  approveOrder(String orderid, String userid, String deliveryid) async {
    var response = await crud.postData(AppLink.approveOrder, {
      "ordersid": orderid,
      "usersid": userid,
      "deliveryid": deliveryid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
