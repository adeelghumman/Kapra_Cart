import 'dart:convert';

List<OrderDetails> orderDetailsFromJson(String str) => List<OrderDetails>.from(
    json.decode(str).map((x) => OrderDetails.fromJson(x)));

String orderDetailsToJson(List<OrderDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderDetails {
  OrderDetails(
      {this.orderId,
      this.buyerId,
      this.shopId,
      this.productsBill,
      this.productIds,
      this.paymentMethod,
      this.completed});

  String orderId;
  String buyerId;
  String shopId;
  String productsBill;
  String productIds;
  String paymentMethod;
  String completed;

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
      orderId: json["orderId"],
      buyerId: json["buyerId"],
      shopId: json["shopId"],
      productsBill: json["ProductsBill"],
      productIds: json["ProductIds"],
      paymentMethod: json["PaymentMethod"],
      completed: json["completed"]);

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "buyerId": buyerId,
        "shopId": shopId,
        "ProductsBill": productsBill,
        "ProductIds": productIds,
        "PaymentMethod": paymentMethod,
        "completed": completed
      };
}
