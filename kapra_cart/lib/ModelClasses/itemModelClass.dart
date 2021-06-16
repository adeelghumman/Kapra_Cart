// To parse this JSON data, do
//
//     final itemModelClass = itemModelClassFromJson(jsonString);

import 'dart:convert';

List<ItemModelClass> itemModelClassFromJson(String str) =>
    List<ItemModelClass>.from(
        json.decode(str).map((x) => ItemModelClass.fromJson(x)));

String itemModelClassToJson(List<ItemModelClass> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemModelClass {
  ItemModelClass({
    this.sr,
    this.orderId,
    this.productId,
    this.price,
    this.productName,
    this.quantity,
  });

  String sr;
  String orderId;
  String productId;
  String price;
  String productName;
  String quantity;

  factory ItemModelClass.fromJson(Map<String, dynamic> json) => ItemModelClass(
        sr: json["sr#"],
        orderId: json["orderId"],
        productId: json["productId"],
        price: json["price"],
        productName: json["productName"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "sr#": sr,
        "orderId": orderId,
        "productId": productId,
        "price": price,
        "productName": productName,
        "quantity": quantity,
      };
}
