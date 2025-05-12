import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewPendingOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  approveOrder(String orderid, String userid) async {
    var response = await crud.postData(AppLink.approveOrder, {
      "ordersid": orderid,
      "usersid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
