import 'package:http/http.dart' as http;
import 'package:kapra_cart/ModelClasses/allServices.dart';
import 'package:kapra_cart/ModelClasses/product.dart';
import 'package:kapra_cart/constant.dart';

Future<List<AllServices>> fetchServices(String t_id) async {
  final response =
      await http.post(basicUrl + "/getAllServices.php", body: {'t_id': t_id});
  return allServicesFromJson(response.body);
}
