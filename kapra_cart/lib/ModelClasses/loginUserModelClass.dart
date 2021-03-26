class loginUserModelClass {
  var name;
  var email;
  var phone;
  var password;
  var address;
  var id;
  var image;
  var message;

  loginUserModelClass(this.name, this.email, this.phone, this.password,
      this.address, this.image, this.id, this.message);

  loginUserModelClass.fromjson(json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    address = json['address'];
    image = json['image'];
    message = json['message'];
    id = json['id'];
  }
}
