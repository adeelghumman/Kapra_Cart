import 'package:http/http.dart' as http;
import 'package:kapra_cart/ModelClasses/itemModelClass.dart';

import 'package:kapra_cart/constant.dart';

Future<List<ItemModelClass>> fetchAllitems(String orderId) async {
  final response = await http.post(basicUrl + "/AllOrderItemsOfProduct.php",
      body: {"orderId": orderId});
  return itemModelClassFromJson(response.body);
}
