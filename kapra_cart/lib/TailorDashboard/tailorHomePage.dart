import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kapra_cart/ModelClasses/loginUserModelClass.dart';
import 'package:kapra_cart/ModelClasses/tailorShopDetailsModelClass.dart';
import 'package:kapra_cart/TailorDashboard/allServiceScreen.dart';
import 'package:kapra_cart/customWidgets/clayContainer.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';
import '../roleOptScreen.dart';
import 'addServices.dart';

class TailorHomePage extends StatefulWidget {
  final loginUserModelClass tailordetails;

  TailorHomePage({this.tailordetails});
  @override
  _TailorHomePageState createState() => _TailorHomePageState();
}

class _TailorHomePageState extends State<TailorHomePage> {
  static TailorShopDetailsModelClass shopDetails;
  String tailorshopId;
  String t_id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentShopID();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Asset/tailorhome.png"), fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: Drawer(
            child: Column(
              children: [
                Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.tailordetails.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        Text(
                          widget.tailordetails.email,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  color: Colors.blue,
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.height,
                ),
                SizedBox(
                  height: 2,
                ),
                ListTile(
                  trailing: Icon(Icons.verified_user, color: Colors.white),
                  tileColor: Colors.blue,
                  leading: Text(
                    "Profile",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => ProfileScreenShopkeeper(
                    //         shopkeeperDetails: widget.shopkeeperDetails,
                    //       ),
                    //     ));
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
        ));
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
        //color: Colors.brown[400],
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50), topRight: Radius.circular(150)),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            widget.tailordetails.name,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
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
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => OrdersScrren(
                //         shopId: shopId,
                //       ),
                //     ));
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
                                builder: (context) => AddService(
                                  t_id: t_id,
                                  ts_id: tailorshopId,
                                ),
                              ));
                        },
                        child: Text("Add new Servics ",
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
            padding: const EdgeInsets.only(top: 10.0, bottom: 30),
            child: Row(
              children: [
                Expanded(
                  child: Material(
                    borderRadius: BorderRadius.circular(30),
                    elevation: 10,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ServicesScreen(tailorId: t_id),
                            ));
                      },
                      child: Container(
                        child: Center(
                            child: Text(
                          "Services",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: buttonColor,
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
    final response = await http.post(basicUrl + "tailorShopDetails.php", body: {
      't_id': widget.tailordetails.id,
    });

    shopDetails =
        TailorShopDetailsModelClass.fromjson(jsonDecode(response.body));
    print("thoisdnjs djjjjjjjjjjjjjjnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn" +
        shopDetails.t_id);
    tailorshopId = shopDetails.ts_id;
    t_id = shopDetails.t_id;
    print("thoisdnjs djjjjjjjjjjjjjjnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn" +
        shopDetails.ts_id);
  }
}
