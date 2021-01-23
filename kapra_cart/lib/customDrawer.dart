import 'package:flutter/material.dart';
import 'package:kapra_cart/constant.dart';
import 'package:kapra_cart/loginScreen.dart';
import 'package:kapra_cart/varable.dart';

class customDrawer extends StatefulWidget {
  @override
  _customDrawerState createState() => _customDrawerState();
}

class _customDrawerState extends State<customDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: buttonColor,
            height: MediaQuery.of(context).size.height / 2 - 150,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: appbarColor,
                      borderRadius: BorderRadius.circular(50)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("UserName",
                      style: TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ),
                Text("Email address",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          ListTile(
            leading: Text("Your Profile"),
            trailing: Icon(Icons.supervised_user_circle),
          ),
          ListTile(
            leading: Text("Your Profile"),
            trailing: Icon(Icons.supervised_user_circle),
          ),
          ListTile(
            leading: Text("Your Profile"),
            trailing: Icon(Icons.supervised_user_circle),
          ),
          ListTile(
            leading: Text("Your Profile"),
            trailing: Icon(Icons.supervised_user_circle),
          ),
          ListTile(
            onTap: () {
              constants.sharedPreferences.clear();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => loginScreen(),
                  ));
            },
            leading: Text("Sign out"),
            trailing: Icon(Icons.supervised_user_circle),
          )
        ],
      ),
    );
  }
}
