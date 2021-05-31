import 'package:flutter/material.dart';
import 'package:kapra_cart/API/allShopsApi.dart';
import 'package:kapra_cart/BuyerDashboard/Shops/shopsHomepageBuyer.dart';

import 'package:kapra_cart/ModelClasses/allShopsModelClass.dart';
import 'package:kapra_cart/ModelClasses/loginUserModelClass.dart';

import 'package:kapra_cart/constant.dart';
import 'package:kapra_cart/customWidgets/customAppbar.dart';
import 'package:kapra_cart/customWidgets/customDrawer.dart';
import 'package:kapra_cart/BuyerDashboard/productDetailsPage.dart';

import 'dart:ui';

import 'backgroundCurveLayout.dart';

class productShop extends StatefulWidget {
  loginUserModelClass userDetails;
  productShop({this.userDetails});
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
          drawer: customDrawer(
            userDetails: widget.userDetails,
          ),
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
    return Padding(
      padding: const EdgeInsets.only(top: 22.0),
      child: SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: FutureBuilder(
            future: fetchAllShops(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    ShopDetails shopDetails = snapshot.data[index];

                    return shops(shopDetails);
                  },
                );
              }
              return CircularProgressIndicator();
            },
          )),
    );
  }

  shops(ShopDetails shopDetails) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 6.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ShopsHomepage_forBuyer(
                  shopDetails: shopDetails,
                  userDetails: widget.userDetails,
                ),
              ));
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [appbarColor, buttonColor],
              begin: FractionalOffset(0, 0),
              end: FractionalOffset(1, 0),
              stops: [0, 1],
            ),
            borderRadius: BorderRadius.circular(0.0),
          ),
          height: 120.0,
          child: Stack(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        basicUrl + "${shopDetails.sImage}",
                        height: 100,
                        width: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    height: 30.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(shopDetails.sName.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
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
                            Text(shopDetails.sDescription,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
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
      ),
    );
  }
}
