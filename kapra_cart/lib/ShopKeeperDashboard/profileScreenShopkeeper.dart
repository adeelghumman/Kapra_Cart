import 'package:flutter/material.dart';
import 'package:kapra_cart/ModelClasses/loginUserModelClass.dart';
import 'package:kapra_cart/constant.dart';

class ProfileScreenShopkeeper extends StatefulWidget {
  final loginUserModelClass shopkeeperDetails;

  const ProfileScreenShopkeeper({Key key, this.shopkeeperDetails})
      : super(key: key);
  @override
  _ProfileScreenShopkeeperState createState() =>
      _ProfileScreenShopkeeperState();
}

class _ProfileScreenShopkeeperState extends State<ProfileScreenShopkeeper> {
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
        midlayout()
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
                    "Email",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  widget.shopkeeperDetails.email,
                  style: TextStyle(fontSize: 20, color: Colors.white),
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
                Text(
                  widget.shopkeeperDetails.phone,
                  style: TextStyle(fontSize: 20, color: Colors.white),
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
                Text(
                  widget.shopkeeperDetails.address,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
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
}
