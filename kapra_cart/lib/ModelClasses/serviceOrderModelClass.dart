import 'dart:convert';

List<ServicesOrderDetails> servicesOrderDetailsFromJson(String str) =>
    List<ServicesOrderDetails>.from(
        json.decode(str).map((x) => ServicesOrderDetails.fromJson(x)));

String servicesOrderDetailsToJson(List<ServicesOrderDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServicesOrderDetails {
  ServicesOrderDetails({
    this.seOrderId,
    this.buyerId,
    this.tailorShopId,
    this.seId,
    this.measurements,
    this.seDiscription,
  });

  String seOrderId;
  String buyerId;
  String tailorShopId;
  String seId;
  String measurements;
  String seDiscription;

  factory ServicesOrderDetails.fromJson(Map<String, dynamic> json) =>
      ServicesOrderDetails(
        seOrderId: json["se_orderId"],
        buyerId: json["buyerId"],
        tailorShopId: json["tailorShopId"],
        seId: json["se_id"],
        measurements: json["measurements"],
        seDiscription: json["se_discription"],
      );

  Map<String, dynamic> toJson() => {
        "se_orderId": seOrderId,
        "buyerId": buyerId,
        "tailorShopId": tailorShopId,
        "se_id": seId,
        "measurements": measurements,
        "se_discription": seDiscription,
      };
}
