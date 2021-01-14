import 'package:flutter/material.dart';
import 'package:kapra_cart/constant.dart';

class customAppbar extends StatefulWidget {
  @override
  _customAppbarState createState() => _customAppbarState();
}

class _customAppbarState extends State<customAppbar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      child: Container(
        color: appbarColor,
        height: MediaQuery.of(context).size.height / 9,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            children: <Widget>[
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(Icons.menu),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  enabled: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.white,
                      hintText: "Search",
                      hintStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300)),
                ),
              )),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(Icons.add_shopping_cart),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
