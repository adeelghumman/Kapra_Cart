import 'dart:convert';

List<BuyerModelClass> buyerModelClassFromJson(String str) =>
    List<BuyerModelClass>.from(
        json.decode(str).map((x) => BuyerModelClass.fromJson(x)));

String buyerModelClassToJson(List<BuyerModelClass> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BuyerModelClass {
  BuyerModelClass({
    this.bId,
    this.bName,
    this.bEmail,
    this.bPassword,
    this.bPhone,
    this.pAddress,
    this.bImage,
  });

  String bId;
  String bName;
  String bEmail;
  String bPassword;
  String bPhone;
  String pAddress;
  String bImage;

  factory BuyerModelClass.fromJson(Map<String, dynamic> json) =>
      BuyerModelClass(
        bId: json["b_id"],
        bName: json["b_name"],
        bEmail: json["b_email"],
        bPassword: json["b_password"],
        bPhone: json["b_phone"],
        pAddress: json["p_address"],
        bImage: json["b_image"],
      );

  Map<String, dynamic> toJson() => {
        "b_id": bId,
        "b_name": bName,
        "b_email": bEmail,
        "b_password": bPassword,
        "b_phone": bPhone,
        "p_address": pAddress,
        "b_image": bImage,
      };
}
