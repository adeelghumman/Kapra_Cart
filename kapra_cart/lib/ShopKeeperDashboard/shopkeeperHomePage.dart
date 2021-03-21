import 'package:flutter/material.dart';
import 'package:kapra_cart/ModelClasses/loginUserModelClass.dart';
import 'package:kapra_cart/constant.dart';

class ShopkeeperHomePage extends StatefulWidget {
  loginUserModelClass shopkeeperDetails;
  ShopkeeperHomePage({this.shopkeeperDetails});

  @override
  _ShopkeeperHomePageState createState() => _ShopkeeperHomePageState();
}

class _ShopkeeperHomePageState extends State<ShopkeeperHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: layout(),
    );
  }

  layout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [topLayout(), middleLayout()],
    );
  }

  topLayout() {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Text(
            "Shop Name",
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
                        child: Text("-",
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
                        child: Text("-",
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
          ), /////////////////////////////////////2  row
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        child: Center(
                          child: Text("-",
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
                        child: Text("Warnings",
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
                          child: Text("-",
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
                        child: Text("Response Time",
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
          )
        ],
      ),
    );
  }

  middleLayout() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Products",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          Material(
            borderRadius: BorderRadius.circular(15),
            elevation: 10,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
