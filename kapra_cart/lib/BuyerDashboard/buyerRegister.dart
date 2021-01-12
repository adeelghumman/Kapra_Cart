import 'package:flutter/material.dart';

class buyerRegiterScreen extends StatefulWidget {
  @override
  _buyerRegiterScreenState createState() => _buyerRegiterScreenState();
}

class _buyerRegiterScreenState extends State<buyerRegiterScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("Asset/register.png"),
        fit: BoxFit.fill,
      )),
    );
  }

  layout() {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[],
      ),
    );
  }
}
