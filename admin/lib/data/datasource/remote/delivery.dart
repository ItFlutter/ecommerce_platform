import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class DeliveryData {
  Crud crud;
  DeliveryData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.deliveryview, {});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id) async {
    var response = await crud.postData(AppLink.deliverydelete, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  addData(String name, String password, String email, String phone) async {
    var response = await crud.postData(AppLink.deliveryadd, {
      "name": name,
      "password": password,
      "email": email,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }

  editData(String id, String name, String password, String email,
      String phone) async {
    var response = await crud.postData(AppLink.deliveryedit, {
      "id": id,
      "name": name,
      "password": password,
      "email": email,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
