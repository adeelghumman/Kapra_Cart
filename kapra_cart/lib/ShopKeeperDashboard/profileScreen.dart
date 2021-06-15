import 'package:flutter/material.dart';
import 'package:kapra_cart/BuyerDashboard/measurementScreen.dart';
import 'package:kapra_cart/ModelClasses/loginUserModelClass.dart';
import 'package:kapra_cart/constant.dart';
import 'package:kapra_cart/customWidgets/customButton.dart';

class ProfileScreen extends StatefulWidget {
  final loginUserModelClass shopkeeperDetails;
  final String roleStatus;

  const ProfileScreen({Key key, this.shopkeeperDetails, this.roleStatus})
      : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int edit = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: layout(),
    );
  }

  layout() {
    return Column(
      children: [
        toplayout(),
        SizedBox(
          height: 20,
        ),
        midlayout(),
      ],
    );
  }

  toplayout() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40), bottomLeft: Radius.circular(40)),
            child: Image.network(
              "https://cdn.shopify.com/s/files/1/0070/7032/files/trending-products_c8d0d15c-9afc-47e3-9ba2-f7bad0505b9b.png?format=jpg&quality=90&v=1614559651&width=1024",
              height: 100,
              width: 100,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              widget.shopkeeperDetails.name.toUpperCase(),
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: color4,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(80),
              bottomRight: Radius.circular(160))),
    );
  }

  midlayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          borderRadius: BorderRadius.circular(40),
          elevation: 20,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Name",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                edit == 0
                    ? Text(
                        widget.shopkeeperDetails.name,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: TextFeild(
                          name: "Name",
                          hintText: "Name",
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Phone",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                edit == 0
                    ? Text(
                        widget.shopkeeperDetails.phone,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: TextFeild(
                          name: "Phone",
                          hintText: "Phone",
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Address",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                edit == 0
                    ? Text(
                        widget.shopkeeperDetails.address,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: TextFeild(
                          name: "Name",
                          hintText: "Name",
                        ),
                      ),
                endlayout()
              ],
            ),
            decoration: BoxDecoration(
                color: buttonColor, borderRadius: BorderRadius.circular(40)),
            height: 400,
            width: MediaQuery.of(context).size.width - 40,
          ),
        ),
      ],
    );
  }

  endlayout() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  edit = 1;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.brown[200],
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Text("Edit",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  edit = 0;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.brown[200],
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Text("Done",
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
      ),
    );
  }

  midlayoutEdit() {
    return Container();
  }
}
