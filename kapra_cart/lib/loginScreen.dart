import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kapra_cart/BuyerDashboard/buyerHomePage.dart';
import 'package:kapra_cart/BuyerDashboard/buyerRegister.dart';
import 'package:kapra_cart/ModelClasses/loginUserModelClass.dart';
import 'package:kapra_cart/ModelClasses/roleOfUser.dart';
import 'package:kapra_cart/constant.dart';
import 'package:http/http.dart' as http;
import 'package:kapra_cart/varable.dart';

class loginScreen extends StatefulWidget {
  roleOfUser userRole;
  loginScreen({this.userRole});
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(key: _scaffoldkey, body: layout());
  }

  layout() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("Asset/loginscreen.png"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  child: Text("Welcome To KapraCart, ",
                      style: TextStyle(
                        fontSize: 30,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                TextField(
                  controller: email,
                  decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10),
                  child: Material(
                    elevation: 20,
                    borderRadius: BorderRadius.circular(50),
                    child: GestureDetector(
                      onTap: () {
                        if (widget.userRole.currentRoleOfUser == "Buyer") {
                          login();
                        }
                      },
                      child: Container(
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text("Login",
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
                Center(
                  child: Text("Or",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10),
                  child: Material(
                    elevation: 20,
                    borderRadius: BorderRadius.circular(50),
                    child: GestureDetector(
                      onTap: () {
                        if (widget.userRole.currentRoleOfUser == "Buyer") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => buyerRegiterScreen(),
                              ));
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
                )
              ],
            )),
          )
        ],
      ),
    );
  }

  void login() async {
    var response = await http.post(
        "http://10.0.2.2/KapraCartScript/checkBuyer.php",
        body: {'email': email.text, 'password': password.text});
    loginUserModelClass user =
        loginUserModelClass.fromjson(jsonDecode(response.body));
    print(user.message);
    if (user.message == "true") {
      constants.sharedPreferences.setBool('login', true);
      // print(constants.sharedPreferences.setBool('login', true));
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => buyerHomePage(),
          ));
    } else {
      _scaffoldkey.currentState
          .showSnackBar(SnackBar(content: Text("User Not Found")));
    }
  }
}
