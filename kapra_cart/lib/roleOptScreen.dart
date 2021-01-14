import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kapra_cart/ModelClasses/roleOfUser.dart';
import 'package:kapra_cart/constant.dart';

import 'loginScreen.dart';

class roleOptScreen extends StatefulWidget {
  @override
  _roleOptScreenState createState() => _roleOptScreenState();
}

class _roleOptScreenState extends State<roleOptScreen> {
  List<String> roles = ["Buyer", "ShopKeeper", "Tailor"];
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("Asset/register.png"),
        fit: BoxFit.fill,
      )),
      child: Scaffold(
        key: _scaffoldkey,
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 170),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return layout(roles[index], index);
            },
            itemCount: roles.length,
          ),
        ),
      ),
    );
  }

  layout(String role, int index) {
    return GestureDetector(
      onTap: () {
        roleOfUser currentRole = roleOfUser(roles[index]);
        _scaffoldkey.currentState.showSnackBar(SnackBar(
            content:
                Text(currentRole.currentRoleOfUser + " Mode is Activated")));
        print(currentRole.currentRoleOfUser);
        Timer(Duration(seconds: 2), () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => loginScreen(userRole: currentRole),
              ));
        });
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Material(
                elevation: 20,
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(50)),
                  height: 60,
                  width: 280,
                  child: Center(
                    child: Text(role,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
