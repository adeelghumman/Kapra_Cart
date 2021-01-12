import 'package:flutter/material.dart';
import 'package:kapra_cart/ModelClasses/roleOfUser.dart';

class loginScreen extends StatefulWidget {
  roleOfUser userRole;
  loginScreen({this.userRole});
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: layout());
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
                  decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10),
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
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
                    elevation: 200,
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue,
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
                )
              ],
            )),
          )
        ],
      ),
    );
  }
}
