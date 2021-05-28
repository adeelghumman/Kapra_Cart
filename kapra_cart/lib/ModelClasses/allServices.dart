import 'dart:convert';

List<AllServices> allServicesFromJson(String str) => List<AllServices>.from(
    json.decode(str).map((x) => AllServices.fromJson(x)));

String allServicesToJson(List<AllServices> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllServices {
  AllServices({
    this.seId,
    this.seName,
    this.seDescription,
    this.sePrice,
    this.seImage,
    this.tId,
  });

  String seId;
  String seName;
  String seDescription;
  String sePrice;
  String seImage;
  String tId;

  factory AllServices.fromJson(Map<String, dynamic> json) => AllServices(
        seId: json["se_id"],
        seName: json["se_name"],
        seDescription: json["se_description"],
        sePrice: json["se_price"],
        seImage: json["se_image"],
        tId: json["t_id"],
      );

  Map<String, dynamic> toJson() => {
        "se_id": seId,
        "se_name": seName,
        "se_description": seDescription,
        "se_price": sePrice,
        "se_image": seImage,
        "t_id": tId,
      };
}
