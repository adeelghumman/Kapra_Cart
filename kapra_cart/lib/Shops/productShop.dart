import 'package:flutter/material.dart';
import 'package:kapra_cart/constant.dart';
import 'package:kapra_cart/customAppbar.dart';
import 'package:kapra_cart/customDrawer.dart';
import 'dart:ui';

import 'backgroundCurveLayout.dart';

class productShop extends StatefulWidget {
  @override
  _productShopState createState() => _productShopState();
}

class _productShopState extends State<productShop> {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroundCurveLayout(
          height: 500.0,
        ),
        Scaffold(
          key: _scaffoldState,
          drawer: customDrawer(),
          backgroundColor: Colors.transparent,
          appBar: customAppbar(
            height: 80,
            ontap: () {
              _scaffoldState.currentState.openDrawer();
            },
          ),
          body: bodyLayout(),
        )
      ],
    );
  }

  bodyLayout() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 14, bottom: 10),
              child: Text(
                'Browse Shops',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
          Container(
            height: 20.0,
          ),
          topBrands(),
          Container(
            height: 10.0,
          ),
          shoplist(),
        ],
      ),
    );
  }

  topBrands() {
    return SizedBox(
        height: 130,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (_, index) {
            return topBrandItem(index);
          },
        ));
  }

  topBrandItem(int index) {
    return Container(
      margin: EdgeInsets.only(left: (index == 0 ? 10 : 5.0)),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(18.0)),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.red,
              child: Image.asset('Asset/11.png'),
            ),
            Container(
              height: 15.0,
            ),
            Text(
              "Saved",
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  shoplist() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return shops();
        },
      ),
    );
  }

  shops() {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 6.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [appbarColor, buttonColor],
            begin: FractionalOffset(0, 0),
            end: FractionalOffset(1, 0),
            stops: [0, 1],
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 120.0,
        child: Stack(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                          image: AssetImage(
                            'Asset/02.jpg',
                          ),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                Container(
                  height: 30.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "1988",
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text("Porsche 911",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: 'Cursive',
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Container(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Row(
                        children: [
                          Text(
                            "100k Mi",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            width: 20.0,
                          ),
                          Text("White",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontFamily: 'Cursive',
                              )),
                          Container(
                            width: 20.0,
                          ),
                          Text("\$54,999",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontFamily: 'Cursive',
                              )),
                          Container(
                            width: 20.0,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
