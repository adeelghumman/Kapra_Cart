import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kapra_cart/roleOptScreen.dart';
import 'package:kapra_cart/splashScreen.dart';

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
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => roleOptScreen(),
          ));
    });
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
