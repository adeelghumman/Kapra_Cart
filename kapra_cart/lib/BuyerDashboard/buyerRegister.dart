import 'package:flutter/material.dart';

import '../constant.dart';

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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: layout(),
      ),
    );
  }

  layout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,

            //color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 2 - 250,
                ),
                Container(
                  width: 200,
                  child: Text("Register yourself to Explore, ",
                      style: TextStyle(
                        fontSize: 30,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Name",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Phone",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Address",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 30),
                  child: Material(
                    elevation: 20,
                    borderRadius: BorderRadius.circular(50),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
