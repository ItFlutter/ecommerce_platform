import 'package:ecommerce/linkapi.dart';

import '../../../core/class/crud.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData(String userid) async {
    var response = await crud.postData(AppLink.homepage, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var response = await crud.postData(AppLink.searchItems, {'search': search});
    return response.fold((l) => l, (r) => r);
  }
}
