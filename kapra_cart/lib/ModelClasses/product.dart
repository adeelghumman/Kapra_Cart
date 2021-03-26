// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.pId,
    this.pName,
    this.pDescription,
    this.pPrice,
    this.pImage,
    this.sId,
    this.pCategory,
  });

  String pId;
  String pName;
  String pDescription;
  String pPrice;
  String pImage;
  String sId;
  String pCategory;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        pId: json["p_id"],
        pName: json["p_name"],
        pDescription: json["p_description"],
        pPrice: json["p_price"],
        pImage: json["p_image"],
        sId: json["s_id"],
        pCategory: json["p_category"],
      );

  Map<String, dynamic> toJson() => {
        "p_id": pId,
        "p_name": pName,
        "p_description": pDescription,
        "p_price": pPrice,
        "p_image": pImage,
        "s_id": sId,
        "p_category": pCategory,
      };
}
