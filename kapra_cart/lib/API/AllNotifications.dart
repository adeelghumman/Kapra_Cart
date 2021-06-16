import 'package:http/http.dart' as http;
import 'package:kapra_cart/ModelClasses/AllNotificationsModelclass.dart';
import 'package:kapra_cart/constant.dart';

Future<List<GetNotification>> fetchallnotifications() async {
  final response =
      await http.post(Uri.parse(basicUrl + "/getNotifications.php"));
  return getNotificationFromJson(response.body);
}
