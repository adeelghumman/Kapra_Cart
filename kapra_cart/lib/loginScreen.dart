import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kapra_cart/BuyerDashboard/buyerHomePage.dart';
import 'package:kapra_cart/BuyerDashboard/buyerRegister.dart';
import 'package:kapra_cart/ModelClasses/loginUserModelClass.dart';
import 'package:kapra_cart/ModelClasses/roleOfUser.dart';
import 'package:kapra_cart/ShopKeeperDashboard/shopkeeperHomePage.dart';
import 'package:kapra_cart/TailorDashboard/tailorHomePage.dart';
import 'package:kapra_cart/constant.dart';
import 'package:http/http.dart' as http;

import 'TailorDashboard/addTailorShopDetails.dart';

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
                        if (email.text == "" || password.text == "") {
                          _scaffoldkey.currentState.showSnackBar(
                              SnackBar(content: Text("Complete your details")));
                        } else {
                          if (widget.userRole.currentRoleOfUser == "Buyer") {
                            login("buyer");
                          }
                          if (widget.userRole.currentRoleOfUser ==
                              "ShopKeeper") {
                            login("shopkeeper");
                          }
                          if (widget.userRole.currentRoleOfUser == "Tailor") {
                            login("tailor");
                          }
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  buyerRegiterScreen(userRole: widget.userRole),
                            ));
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

  void login(String tablename) async {
    var response = await http.post(basicUrl + "checkUser.php", body: {
      'email': email.text,
      'password': password.text,
      'table': tablename
    });

    loginUserModelClass user =
        loginUserModelClass.fromjson(jsonDecode(response.body));

    print(user.message);
    if (user.message == "true" && tablename == "buyer") {
      constants.sharedPreferences.setBool('buyerlogin', true);
      constants.sharedPreferences.setString('email', user.email);
      constants.sharedPreferences.setString('password', user.password);

      if (tablename == "buyer") {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => buyerHomePage(userDetails: user),
            ));
      }
    }
    /////////////////////////////// for shop Keeper

    if (user.message == "true" && tablename == "shopkeeper") {
      constants.sharedPreferences.setBool('shopkeeper', true);
      constants.sharedPreferences.setString('email', user.email);
      constants.sharedPreferences.setString('password', user.password);

      if (tablename == "shopkeeper") {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShopkeeperHomePage(
                shopkeeperDetails: user,
              ),
            ));
      }
    }
    if (user.message == "true" && tablename == "tailor") {
      constants.sharedPreferences.setBool('tailor', true);
      constants.sharedPreferences.setString('email', user.email);
      constants.sharedPreferences.setString('password', user.password);

      if (tablename == "tailor") {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TailorHomePage(
                tailordetails: user,
              ),
            ));
      }
    } else {
      _scaffoldkey.currentState
          .showSnackBar(SnackBar(content: Text("User Not Found")));
    }
    constants.sharedPreferences.setString("table", tablename);
    constants.sharedPreferences
        .setString("userRole", widget.userRole.currentRoleOfUser);
  }
}
