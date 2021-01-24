import 'package:flutter/material.dart';
import 'package:kapra_cart/ModelClasses/loginUserModelClass.dart';

class tailorHomePage extends StatefulWidget {
  loginUserModelClass tailorDetails;
  tailorHomePage({this.tailorDetails});
  @override
  _tailorHomePageState createState() => _tailorHomePageState();
}

class _tailorHomePageState extends State<tailorHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tailor dashboard"),
      ),
    );
  }
}
