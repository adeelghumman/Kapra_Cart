import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:kapra_cart/ModelClasses/loginUserModelClass.dart';
import 'package:kapra_cart/ModelClasses/shopDetailsModelClass.dart';
import 'package:kapra_cart/ShopKeeperDashboard/addProducts.dart';
import 'package:kapra_cart/ShopKeeperDashboard/ordersScreen.dart';
import 'package:kapra_cart/ShopKeeperDashboard/productScreen.dart';
import 'package:kapra_cart/ShopKeeperDashboard/profileScreen.dart';
import 'package:kapra_cart/constant.dart';
import 'package:kapra_cart/customWidgets/clayContainer.dart';

import '../roleOptScreen.dart';

class ShopkeeperHomePage extends StatefulWidget {
  final loginUserModelClass shopkeeperDetails;

  const ShopkeeperHomePage({Key key, this.shopkeeperDetails}) : super(key: key);

  @override
  _ShopkeeperHomePageState createState() => _ShopkeeperHomePageState();
}

class _ShopkeeperHomePageState extends State<ShopkeeperHomePage> {
  static ShopDetailsModelClass shopDetails;
  String shopId;
  String sk_id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentShopID();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.shopkeeperDetails.name.toString().toUpperCase(),
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text(
                      widget.shopkeeperDetails.email,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
              color: buttonColor,
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.height,
            ),
            SizedBox(
              height: 2,
            ),
            ListTile(
              trailing: Icon(Icons.verified_user, color: Colors.white),
              tileColor: appbarColor,
              leading: Text(
                "Profile",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(
                        shopkeeperDetails: widget.shopkeeperDetails,
                        roleStatus: '2',
                      ),
                    ));
              },
            ),
            SizedBox(
              height: 2,
            ),
            ListTile(
              tileColor: appbarColor,
              leading: Text(
                "Sign out",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onTap: () {
                constants.sharedPreferences.clear();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => roleOptScreen(),
                    ));
              },
            ),
          ],
        ),
      ),
      body: layout(),
    );
  }

  layout() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [topLayout(), middleLayout()],
      ),
    );
  }

  topLayout() {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.blue[400],
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50), topRight: Radius.circular(150)),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            widget.shopkeeperDetails.name.toString().toUpperCase(),
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blue[100]),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      child: Center(
                        child: Text("100%",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 3),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Completed oders",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      child: Center(
                        child: Text("0%",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 3),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Cancelled Oders",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    )
                  ],
                ),
              )
            ],
          ),
          /////////////////////////////////////2  row
          Material(
            borderRadius: BorderRadius.circular(30),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrdersScrren(
                        shopId: shopId,
                      ),
                    ));
              },
              child: Container(
                child: Center(
                    child: Text(
                  "Orders",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.green[400]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  middleLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Text("Product",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          currentShopID();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddProducts(
                                  s_id: shopId,
                                  shopKeeperId: sk_id,
                                ),
                              ));
                        },
                        child: Text("New Product",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text("Categories",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: clayContainer(
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductScreen(category: "Men", shopId: shopId),
                          ));
                    },
                    child: Center(
                        child: Text(
                      "Men",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
                    color: Colors.white,
                    height: 150,
                    width: 150,
                    borderRadius: 75,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: clayContainer(
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductScreen(
                                category: "Women", shopId: shopId),
                          ));
                    },
                    child: Center(
                        child: Text(
                      "Women",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
                    color: Colors.white,
                    height: 150,
                    width: 150,
                    borderRadius: 75,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 30),
            child: Row(
              children: [
                Expanded(
                  child: Material(
                    borderRadius: BorderRadius.circular(15),
                    elevation: 10,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductScreen(
                                  category: "Kids", shopId: shopId),
                            ));
                      },
                      child: Container(
                        child: Center(
                            child: Text(
                          "Kids",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void currentShopID() async {
    final response = await http.post(basicUrl + "shopdetails.php", body: {
      'sk_id': widget.shopkeeperDetails.id,
    });

    shopDetails = ShopDetailsModelClass.fromjson(jsonDecode(response.body));
    print("thoisdnjs djjjjjjjjjjjjjjnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn" +
        shopDetails.s_id);
    shopId = shopDetails.s_id;
    sk_id = shopDetails.sk_id;
    print("thoisdnjs djjjjjjjjjjjjjjnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn" +
        shopDetails.sk_id);
  }
}
