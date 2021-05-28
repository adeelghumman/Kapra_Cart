class TailorShopDetailsModelClass {
  var ts_id;
  var ts_name;
  var ts_address;
  var ts_phone;
  var ts_city;
  var ts_image;
  var ts_description;
  var t_id;

  TailorShopDetailsModelClass(
      this.ts_id,
      this.ts_name,
      this.ts_address,
      this.ts_phone,
      this.ts_city,
      this.ts_image,
      this.ts_description,
      this.t_id);

  TailorShopDetailsModelClass.fromjson(json) {
    ts_id = json['ts_id'];
    ts_name = json['ts_name'];
    ts_address = json['ts_address'];
    ts_phone = json['ts_phone'];
    ts_city = json['ts_city'];
    ts_image = json['ts_image'];
    ts_description = json['ts_description'];
    t_id = json['t_id'];
  }
}
