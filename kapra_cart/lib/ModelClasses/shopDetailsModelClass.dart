class ShopDetailsModelClass {
  var s_id;
  var s_name;
  var s_address;
  var s_phone;
  var s_city;
  var s_image;
  var s_description;
  var sk_id;

  ShopDetailsModelClass(this.s_id, this.s_name, this.s_address, this.s_phone,
      this.s_city, this.s_image, this.s_description, this.sk_id);

  ShopDetailsModelClass.fromjson(json) {
    s_id = json['s_id'];
    s_name = json['s_name'];
    s_address = json['s_address'];
    s_phone = json['s_phone'];
    s_city = json['s_city'];
    s_image = json['s_image'];
    s_description = json['s_description'];
    sk_id = json['sk_id'];
  }
}
