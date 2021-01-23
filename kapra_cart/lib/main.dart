import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kapra_cart/BuyerDashboard/buyerHomePage.dart';
import 'package:kapra_cart/constant.dart';
import 'package:kapra_cart/roleOptScreen.dart';
import 'package:kapra_cart/splashScreen.dart';
import 'package:kapra_cart/varable.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    //SharedPreferences.setMockInitialValues({});
    constants.sharedPreferences = await SharedPreferences.getInstance();
    print(constants.sharedPreferences.getBool('login'));

    if (constants.sharedPreferences.getBool('login') == true) {
      Timer(Duration(seconds: 3), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => buyerHomePage(),
            ));
      });
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
}
