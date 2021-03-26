import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kapra_cart/ModelClasses/loginUserModelClass.dart';
import 'package:kapra_cart/constant.dart';

class GetShopKeeperDetails {
  var shopKeeperId;
  GetShopKeeperDetails(this.shopKeeperId);

  Future<String> getShopKeeperDetails(shopKeeperId) async {
    var response = await http.post(basicUrl + "getShopKeeperDetails.php",
        body: {'sk_id': shopKeeperId});
    loginUserModelClass shopkeeperDetails =
        loginUserModelClass.fromjson(jsonDecode(response.body));
    return shopkeeperDetails.id;
  }
}
