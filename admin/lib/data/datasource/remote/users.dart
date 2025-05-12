import 'package:admin/core/class/crud.dart';
import 'package:admin/linkapi.dart';

class UsersData {
  Crud crud;
  UsersData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.usersview, {});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id) async {
    var response = await crud.postData(AppLink.usersdelete, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
