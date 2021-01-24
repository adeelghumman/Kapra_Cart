import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:kapra_cart/ModelClasses/roleOfUser.dart';
import '../constant.dart';

class buyerRegiterScreen extends StatefulWidget {
  roleOfUser userRole;
  buyerRegiterScreen({this.userRole});
  @override
  _buyerRegiterScreenState createState() => _buyerRegiterScreenState();
}

class _buyerRegiterScreenState extends State<buyerRegiterScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  Future<File> file;
  String base64Image;
  File tempFile;
  String status = "";
  String errormessage = "Error in uploading image";

  void pickimage() {
    file = ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("Asset/register.png"),
        fit: BoxFit.fill,
      )),
      child: Scaffold(
        key: _scaffoldkey,
        backgroundColor: Colors.transparent,
        body: layout(),
      ),
    );
  }

  layout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,

            //color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 2 - 250,
                ),
                Row(
                  children: [
                    Container(
                      width: 200,
                      child: Text("Register yourself to Explore, ",
                          style: TextStyle(
                            fontSize: 30,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        pickimage();
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.width / 4,
                        width: MediaQuery.of(context).size.width / 4,
                        decoration: BoxDecoration(
                            color: appbarColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                            child: file == null
                                ? Text("Pick image",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ))
                                : Container(
                                    // decoration: BoxDecoration(
                                    //     borderRadius: BorderRadius.circular(50),
                                    //     image: DecorationImage(
                                    //       image: FileImage(file),
                                    //       fit: BoxFit.fill,
                                    //     )),
                                    child: showimage())),
                      ),
                    )
                  ],
                ),
                TextField(
                  controller: name,
                  decoration: InputDecoration(
                      hintText: "Name",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                TextField(
                  controller: email,
                  decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                TextField(
                  controller: password,
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                TextField(
                  controller: phone,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Phone",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                TextField(
                  controller: address,
                  decoration: InputDecoration(
                      hintText: "Address",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 30),
                  child: Material(
                    elevation: 20,
                    borderRadius: BorderRadius.circular(50),
                    child: GestureDetector(
                      onTap: () {
                        if (name.text == "" ||
                            email.text == "" ||
                            password.text == "" ||
                            phone.text == "" ||
                            address.text == "" ||
                            file == null) {
                          _scaffoldkey.currentState.showSnackBar(SnackBar(
                              content: Text("Complete your details first")));
                          return;
                        } else {
                          startUploadImage(); /////// upload image and Register image
                        }
                      },
                      child: Container(
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text("Register",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showimage() {
    return FutureBuilder<File>(
      future: file,
      builder: (context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          tempFile = snapshot.data;
          base64Image = base64Encode(snapshot.data.readAsBytesSync());
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                  image: FileImage(snapshot.data),
                  fit: BoxFit.fill,
                )),
          );
        } else if (null != snapshot.error) {
          return Text("Error in picking");
        } else {
          return Text("Pick image",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ));
        }
      },
    );
  }

  void setstatus(String message) {
    status = message;
  }

  startUploadImage() {
    setstatus("Uploading image.... ");
    if (null == tempFile.path) {
      setstatus(errormessage);
      return;
    }
    String filename = tempFile.path.split('/').last;
    upload(filename);
    registerBuyer(name.text, email.text, password.text, phone.text,
        address.text, filename, widget.userRole.currentRoleOfUser);
  }

  void upload(String filename) {
    http.post("http://10.0.2.2/KapraCartScript/uploadImage.php",
        body: {"image": base64Image, "name": filename}).then((value) {
      setstatus(value.statusCode == 200 ? value.body : errormessage);
    }).catchError((error) {
      setstatus(error);
    });
  }

  void registerBuyer(String name, String email, String password, String phone,
      String address, String filename, String table) {
    http.post("http://10.0.2.2/KapraCartScript/registerUser.php", body: {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'address': address,
      'image': filename,
      'table': table
    }).then((value) => print(value.body));
    _scaffoldkey.currentState
        .showSnackBar(SnackBar(content: Text("Registration Complete")));
  }
}
