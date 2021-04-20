// To parse this JSON data, do
//
//     final shopDetails = shopDetailsFromJson(jsonString);

import 'dart:convert';

List<ShopDetails> shopDetailsFromJson(String str) => List<ShopDetails>.from(
    json.decode(str).map((x) => ShopDetails.fromJson(x)));

String shopDetailsToJson(List<ShopDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShopDetails {
  ShopDetails({
    this.sId,
    this.sName,
    this.sAddress,
    this.sPhone,
    this.sCity,
    this.sCategory,
    this.sImage,
    this.sDescription,
    this.skId,
  });

  String sId;
  String sName;
  String sAddress;
  String sPhone;
  String sCity;
  String sCategory;
  String sImage;
  String sDescription;
  String skId;

  factory ShopDetails.fromJson(Map<String, dynamic> json) => ShopDetails(
        sId: json["s_id"],
        sName: json["s_name"],
        sAddress: json["s_address"],
        sPhone: json["s_phone"],
        sCity: json["s_city"],
        sCategory: json["s_Category"],
        sImage: json["s_image"],
        sDescription: json["s_description"],
        skId: json["sk_id"],
      );

  Map<String, dynamic> toJson() => {
        "s_id": sId,
        "s_name": sName,
        "s_address": sAddress,
        "s_phone": sPhone,
        "s_city": sCity,
        "s_Category": sCategory,
        "s_image": sImage,
        "s_description": sDescription,
        "sk_id": skId,
      };
}
