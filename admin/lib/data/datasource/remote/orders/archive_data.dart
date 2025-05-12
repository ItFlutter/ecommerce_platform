import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewArchiveOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  // rating(String ordersid, String rating, String comment) async {
  //   var response = await crud.postData(AppLink.rating, {
  //     'id': ordersid,
  //     "rating": rating,
  //     "comment": comment,
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }
}
