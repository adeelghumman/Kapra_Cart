import 'package:http/http.dart' as http;
import 'package:kapra_cart/ModelClasses/product.dart';
import 'package:kapra_cart/constant.dart';

Future<List<Product>> cartProducts(String p_id, String shopId) async {
  final response = await http.post(basicUrl + "/cartProducts.php",
      body: {'p_id': p_id, 's_id': shopId});
  return productFromJson(response.body);
}
