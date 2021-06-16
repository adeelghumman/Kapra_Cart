import 'package:flutter/material.dart';
import 'package:kapra_cart/API/allShopsApi.dart';
import 'package:kapra_cart/API/productApi.dart';
import 'package:kapra_cart/BuyerDashboard/cart.dart';
import 'package:kapra_cart/BuyerDashboard/cartScreen.dart';
import 'package:kapra_cart/Constants/light_color.dart';

import 'package:kapra_cart/ModelClasses/allShopsModelClass.dart';
import 'package:kapra_cart/ModelClasses/loginUserModelClass.dart';
import 'package:kapra_cart/ModelClasses/product.dart';

import '../../constant.dart';
import '../productDetailsPage.dart';

class ShopsHomepage_forBuyer extends StatefulWidget {
  final ShopDetails shopDetails;
  final loginUserModelClass userDetails;
  final int servicer;

  const ShopsHomepage_forBuyer(
      {Key key, this.shopDetails, this.userDetails, this.servicer})
      : super(key: key);

  @override
  _ShopsHomepage_forBuyerState createState() => _ShopsHomepage_forBuyerState();
}

class _ShopsHomepage_forBuyerState extends State<ShopsHomepage_forBuyer> {
  int noOfCartItems = 0;

  Cart cart = new Cart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: layout(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => CartScreen(
                    cart: cart,
                    shopDetails: widget.shopDetails,
                    userDetails: widget.userDetails,
                    servicer: widget.servicer),
              ));
        },
        backgroundColor: LightColor.orange,
        child: Column(
          children: [
            Text(noOfCartItems.toString()),
            Icon(Icons.shopping_basket,
                color: Theme.of(context)
                    .floatingActionButtonTheme
                    .backgroundColor),
          ],
        ),
      ),
    );
  }

  layout() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 10,
            ),
            products(widget.shopDetails),
            SizedBox(
                height: MediaQuery.of(context).size.height,
                child: FutureBuilder(
                  future: fetchProducts("none", widget.shopDetails.sId),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: .75),
                        // scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index) {
                          Product shopDetails = snapshot.data[index];

                          return itemCard(
                            shopDetails,
                          );
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

  products(ShopDetails shopDetails) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30), topRight: Radius.circular(30)),
          gradient: LinearGradient(
            colors: [appbarColor, buttonColor],
            begin: FractionalOffset(0, 0),
            end: FractionalOffset(1, 0),
            stops: [0, 1],
          ),
        ),
        height: 120.0,
        child: Stack(
          children: [
            Row(
              children: [
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
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    child: Image.network(
                      basicUrl + "${shopDetails.sImage}",
                      height: 100,
                      width: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  itemCard(Product shopDetails) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(
                    shopDetails: shopDetails,
                  ),
                ));
          },
          child: Container(
              height: 180,
              width: 160,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16)),
              child: Image.network(basicUrl + "${shopDetails.pImage}")),
        ),
        Row(
          children: [
            Column(
              children: [
                Text(
                  shopDetails.pName.toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  shopDetails.pPrice.toString(),
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  noOfCartItems++;
                  cart.addProductInCart(shopDetails.pId, shopDetails.pName,
                      shopDetails.pPrice, shopDetails.pImage);
                  print(cart.products);
                });
              },
              child: Container(
                child: Center(child: Text("Cart me")),
                height: 25,
                width: 75,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
