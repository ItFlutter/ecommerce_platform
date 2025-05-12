import 'package:delivery/core/class/crud.dart';
import 'package:delivery/linkapi.dart';

class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);
  getData(String deliveryid) async {
    var response =
        await crud.postData(AppLink.viewAcceptedOrders, {"id": deliveryid});
    return response.fold((l) => l, (r) => r);
  }

  doneDelivery(String ordersid, String usersid, String deliveryid) async {
    var response = await crud.postData(AppLink.doneOrders,
        {"ordersid": ordersid, "usersid": usersid, "deliveryid": deliveryid});
    return response.fold((l) => l, (r) => r);
  }
}
