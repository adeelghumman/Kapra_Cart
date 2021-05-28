import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:kapra_cart/API/allShopsApi.dart';
import 'package:kapra_cart/API/allTailorShopsApi.dart';
import 'package:kapra_cart/ModelClasses/allShopsModelClass.dart';
import 'package:kapra_cart/ModelClasses/allTailorShopDetails.dart';
import 'package:kapra_cart/ModelClasses/loginUserModelClass.dart';

import 'package:kapra_cart/constant.dart';
import 'package:kapra_cart/customWidgets/customAppbar.dart';
import 'package:kapra_cart/customWidgets/customDrawer.dart';

import 'Shops/productShop.dart';
import 'Shops/serviceShops.dart';

class buyerHomePage extends StatefulWidget {
  loginUserModelClass userDetails;
  buyerHomePage({this.userDetails});
  @override
  _buyerHomePageState createState() => _buyerHomePageState();
}

class _buyerHomePageState extends State<buyerHomePage> {
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        height: 80,
        ontap: () {
          _scaffoldkey.currentState.openDrawer();
        },
      ),
      drawer: customDrawer(
        userDetails: widget.userDetails,
      ),
      key: _scaffoldkey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            homepageSlider(),
            choiceContainer(),
            shopListingSlider(),
            serviceListingSlider()
          ],
        ),
      ),
    );
  }

  ////////////////////////////////////////////////////  Methods are Define
  homepageSlider() {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Carousel(
            boxFit: BoxFit.fill,
            dotSize: 3,
            dotSpacing: 8,
            indicatorBgPadding: 5,
            dotBgColor: Colors.transparent,
            images: [
              AssetImage("Asset/homepageSlider1.jpg"),
              AssetImage("Asset/homepageSlider2.jpg"),
              AssetImage("Asset/homepageSlider3.jpg"),
            ],
          ),
        ),
      ),
    );
  }

  choiceContainer() {
    return Container(
      //color: appbarColor,
      height: 170,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          productShop(userDetails: widget.userDetails),
                    ));
              },
              child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Icon(
                          Icons.shopping_bag,
                          size: 35,
                          color: Colors.white,
                        ),
                        Text("Products",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                  width: MediaQuery.of(context).size.width / 3,
                  height: 100,
                  decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(50)),
                      gradient: LinearGradient(
                          colors: [appbarColor, buttonColor],
                          begin: FractionalOffset(0, 0),
                          end: FractionalOffset(1, 0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp))),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => serviceShops(
                      userDetails: widget.userDetails,
                    ),
                  ));
            },
            child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Icon(
                        Icons.supervised_user_circle,
                        size: 35,
                        color: Colors.white,
                      ),
                      Text("Tailors",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
                width: MediaQuery.of(context).size.width / 3,
                height: 100,
                decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(50)),
                    gradient: LinearGradient(
                        colors: [appbarColor, buttonColor],
                        begin: FractionalOffset(1, 0),
                        end: FractionalOffset(0, 0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp))),
          )
        ],
      ),
    );
  }

  shopListingSlider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: 210,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), bottomLeft: Radius.circular(50)),
            color: appbarColor,
            gradient: LinearGradient(
                begin: FractionalOffset(0, 0),
                end: FractionalOffset(1, 0),
                stops: [0, 1],
                colors: [buttonColor, color4],
                tileMode: TileMode.clamp)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 200,
              width: 80,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => productShop(
                            userDetails: widget.userDetails,
                          ),
                        ));
                  },
                  child: Text("SHOPS",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            SizedBox(
                height: 150,
                width: MediaQuery.of(context).size.width - 80,
                child: FutureBuilder(
                  future: fetchAllShops(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index) {
                          ShopDetails shopDetails = snapshot.data[index];

                          return shop(shopDetails);
                        },
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ))
          ],
        ),
      ),
    );
  }

  shop(ShopDetails shopDetails) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        width: MediaQuery.of(context).size.width / 3 + 80,
        height: 160,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(80)),
            gradient: LinearGradient(
                begin: FractionalOffset(0, 0),
                end: FractionalOffset(1, 0),
                stops: [0, 1],
                colors: [color4, buttonColor],
                tileMode: TileMode.clamp)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 30),
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imageUrl + "${shopDetails.sImage}",
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(shopDetails.sName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(shopDetails.sDescription,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  serviceListingSlider() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 210,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50)),
            color: appbarColor,
            gradient: LinearGradient(
                begin: FractionalOffset(0, 0),
                end: FractionalOffset(1, 0),
                stops: [0, 1],
                colors: [color4, buttonColor],
                tileMode: TileMode.clamp)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                height: 150,
                width: MediaQuery.of(context).size.width - 100,
                child: FutureBuilder(
                  future: fetchAllTailorShops(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index) {
                          AllTailorsShopDetails
                              shopDeAllTailorsShopDetailstails =
                              snapshot.data[index];

                          return tailorshop(shopDeAllTailorsShopDetailstails);
                        },
                      );
                    }
                    return CircularProgressIndicator();
                  },
                )),
            SizedBox(
              height: 200,
              width: 90,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => serviceShops(
                            userDetails: widget.userDetails,
                          ),
                        ));
                  },
                  child: Text("SERVICES",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  tailorshop(AllTailorsShopDetails shopDetails) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        width: MediaQuery.of(context).size.width / 3 + 80,
        height: 160,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(80)),
            gradient: LinearGradient(
                begin: FractionalOffset(0, 0),
                end: FractionalOffset(1, 0),
                stops: [0, 1],
                colors: [color4, buttonColor],
                tileMode: TileMode.clamp)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 30),
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    basicUrl + "${shopDetails.tsImage}",
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(shopDetails.tsName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(shopDetails.tsDescription,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
