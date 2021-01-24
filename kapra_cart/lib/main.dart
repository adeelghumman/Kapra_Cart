import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kapra_cart/BuyerDashboard/buyerHomePage.dart';
import 'package:kapra_cart/constant.dart';
import 'package:kapra_cart/roleOptScreen.dart';
import 'package:kapra_cart/splashScreen.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'ModelClasses/loginUserModelClass.dart';

void main() {
  runApp(MaterialApp(
    home: application(),
    debugShowCheckedModeBanner: false,
  ));
}

class application extends StatefulWidget {
  @override
  _applicationState createState() => _applicationState();
}

class _applicationState extends State<application> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    load();
  }

  void load() async {
    //constants.sharedPreferences.clear();
    constants.sharedPreferences = await SharedPreferences.getInstance();

    if (constants.sharedPreferences.getBool('buyerlogin') == true) {
      login(constants.sharedPreferences.getString("email"),
          constants.sharedPreferences.getString("password"));
    } else {
      Timer(Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => roleOptScreen(),
            ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: splachScreen(),
      ),
    );
  }

  void login(email, password) async {
    var response = await http.post(basicUrl + "checkBuyer.php", body: {
      'email': email.text,
      'password': password.text,
      'table': "buyer"
    });

    loginUserModelClass user =
        loginUserModelClass.fromjson(jsonDecode(response.body));
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => buyerHomePage(
              userDetails: user,
            ),
          ));
    });
  }
}
