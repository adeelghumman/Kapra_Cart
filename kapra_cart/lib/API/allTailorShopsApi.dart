import 'package:http/http.dart' as http;

import 'package:kapra_cart/ModelClasses/allTailorShopDetails.dart';
import 'package:kapra_cart/constant.dart';

Future<List<AllTailorsShopDetails>> fetchAllTailorShops() async {
  final response = await http.post(basicUrl + "/getTailorShops.php");
  return allTailorsShopDetailsFromJson(response.body);
}
