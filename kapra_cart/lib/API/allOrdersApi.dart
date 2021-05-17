import 'package:http/http.dart' as http;

import 'package:kapra_cart/ModelClasses/oderModelClass.dart';
import 'package:kapra_cart/constant.dart';

Future<List<OrderDetails>> fetchAllOrders(String shopId) async {
  final response =
      await http.post(basicUrl + "/getOrders.php", body: {"shopId": shopId});
  return orderDetailsFromJson(response.body);
}
