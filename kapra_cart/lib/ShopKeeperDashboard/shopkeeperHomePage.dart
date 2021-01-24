import 'package:flutter/material.dart';
import 'package:kapra_cart/ModelClasses/loginUserModelClass.dart';

class shopkeeperHomePage extends StatefulWidget {
  loginUserModelClass shopkeeperDetails;
  shopkeeperHomePage({this.shopkeeperDetails});

  @override
  _shopkeeperHomePageState createState() => _shopkeeperHomePageState();
}

class _shopkeeperHomePageState extends State<shopkeeperHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("shopkeeper dashboard"),
      ),
    );
  }
}
