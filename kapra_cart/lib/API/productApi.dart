import 'package:http/http.dart' as http;
import 'package:kapra_cart/ModelClasses/product.dart';
import 'package:kapra_cart/constant.dart';

Future<List<Product>> fetchProducts(String category, String shopId) async {
  final response = await http.post(basicUrl + "/getProducts.php",
      body: {'category': category, 's_id': shopId});
  return productFromJson(response.body);
}
