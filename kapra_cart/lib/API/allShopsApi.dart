import 'package:http/http.dart' as http;
import 'package:kapra_cart/ModelClasses/allShopsModelClass.dart';
import 'package:kapra_cart/constant.dart';

Future<List<ShopDetails>> fetchAllShops() async {
  final response = await http.post(basicUrl + "/getShops.php");
  return shopDetailsFromJson(response.body);
}
