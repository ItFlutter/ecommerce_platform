import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class CouponData {
  Crud crud;
  CouponData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.couponview, {});
    return response.fold((l) => l, (r) => r);
  }

  addData(String name, String count, String discount, String expiredate) async {
    var response = await crud.postData(AppLink.couponadd, {
      "name": name,
      "count": count,
      "discount": discount,
      "expiredate": expiredate,
    });
    return response.fold((l) => l, (r) => r);
  }

  editData(String name, String count, String discount, String id,
      [String? expiredate]) async {
    var response;
    if (expiredate == null) {
      response = await crud.postData(AppLink.couponedit,
          {"name": name, "count": count, "discount": discount, "id": id});
    } else {
      response = await crud.postData(AppLink.couponedit, {
        "name": name,
        "count": count,
        "discount": discount,
        "expiredate": expiredate,
        "id": id
      });
    }

    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id) async {
    var response = await crud.postData(AppLink.coupondelete, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
