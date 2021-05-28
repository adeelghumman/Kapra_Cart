import 'dart:convert';

List<AllTailorsShopDetails> allTailorsShopDetailsFromJson(String str) =>
    List<AllTailorsShopDetails>.from(
        json.decode(str).map((x) => AllTailorsShopDetails.fromJson(x)));

String allTailorsShopDetailsToJson(List<AllTailorsShopDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllTailorsShopDetails {
  AllTailorsShopDetails({
    this.tsId,
    this.tsName,
    this.tsAddress,
    this.tsPhone,
    this.tsCity,
    this.tsImage,
    this.tsDescription,
    this.tId,
  });

  String tsId;
  String tsName;
  String tsAddress;
  String tsPhone;
  String tsCity;
  String tsImage;
  String tsDescription;
  String tId;

  factory AllTailorsShopDetails.fromJson(Map<String, dynamic> json) =>
      AllTailorsShopDetails(
        tsId: json["ts_id"],
        tsName: json["ts_name"],
        tsAddress: json["ts_address"],
        tsPhone: json["ts_phone"],
        tsCity: json["ts_city"],
        tsImage: json["ts_image"],
        tsDescription: json["ts_description"],
        tId: json["t_Id"],
      );

  Map<String, dynamic> toJson() => {
        "ts_id": tsId,
        "ts_name": tsName,
        "ts_address": tsAddress,
        "ts_phone": tsPhone,
        "ts_city": tsCity,
        "ts_image": tsImage,
        "ts_description": tsDescription,
        "t_Id": tId,
      };
}
