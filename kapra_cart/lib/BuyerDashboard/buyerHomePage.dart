import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:kapra_cart/Shops/productShop.dart';
import 'package:kapra_cart/Shops/serviceShops.dart';
import 'package:kapra_cart/constant.dart';
import 'package:kapra_cart/customAppbar.dart';

class buyerHomePage extends StatefulWidget {
  @override
  _buyerHomePageState createState() => _buyerHomePageState();
}

class _buyerHomePageState extends State<buyerHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: customAppbar(),
            ),
            homepageSlider(),
            choiceContainer(),
            shopListingSlider(),
            serviceListingSlider()
          ],
        ),
      ),
    );
  }

  //////////////////////////////////////////////////// below this Methods are Define
  homepageSlider() {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Carousel(
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
    );
  }

  choiceContainer() {
    return Container(
      color: appbarColor,
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
                      builder: (context) => productShop(),
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
          Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Icon(
                      Icons.supervised_user_circle,
                      size: 35,
                      color: Colors.white,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => serviceShops(),
                            ));
                      },
                      child: Text("Tailors",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                    )
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
                      tileMode: TileMode.clamp)))
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
                          builder: (context) => productShop(),
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
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return shop("Asset/homepageSlider3.jpg");
                },
                itemCount: 4,
              ),
            )
          ],
        ),
      ),
    );
  }

  shop(String image) {
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
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(80)),
                  child: Image.asset(
                    image,
                    height: 80,
                    width: 230,
                    fit: BoxFit.fill,
                  ),
                ),
                Text("Shop name ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                      " Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum",
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
              width: MediaQuery.of(context).size.width - 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return shop("Asset/homepageSlider2.jpg");
                },
                itemCount: 4,
              ),
            ),
            SizedBox(
              height: 200,
              width: 90,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => serviceShops(),
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
}
