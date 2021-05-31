import 'package:http/http.dart' as http;

import 'package:kapra_cart/ModelClasses/oderModelClass.dart';
import 'package:kapra_cart/ModelClasses/serviceOrderModelClass.dart';
import 'package:kapra_cart/constant.dart';

Future<List<ServicesOrderDetails>> fetchAllServicesOrders(
    String tailorshopId) async {
  final response = await http.post(basicUrl + "/getServicesOrders.php",
      body: {"tailorShopId": tailorshopId});
  return servicesOrderDetailsFromJson(response.body);
}
