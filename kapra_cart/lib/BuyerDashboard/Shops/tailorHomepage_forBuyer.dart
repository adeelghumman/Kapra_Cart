import 'package:flutter/material.dart';
import 'package:kapra_cart/API/allShopsApi.dart';
import 'package:kapra_cart/API/productApi.dart';
import 'package:kapra_cart/API/servicesApi.dart';
import 'package:kapra_cart/BuyerDashboard/Shops/serviceDetailpage.dart';
import 'package:kapra_cart/BuyerDashboard/cart.dart';
import 'package:kapra_cart/BuyerDashboard/cartScreen.dart';
import 'package:kapra_cart/Constants/light_color.dart';
import 'package:kapra_cart/ModelClasses/allServices.dart';

import 'package:kapra_cart/ModelClasses/allShopsModelClass.dart';
import 'package:kapra_cart/ModelClasses/allTailorShopDetails.dart';
import 'package:kapra_cart/ModelClasses/loginUserModelClass.dart';
import 'package:kapra_cart/ModelClasses/product.dart';

import '../../constant.dart';
import '../productDetailsPage.dart';

class TailorHomepage_forBuyer extends StatefulWidget {
  final AllTailorsShopDetails tailorshopDetails;
  final loginUserModelClass userDetails;

  const TailorHomepage_forBuyer(
      {Key key, this.tailorshopDetails, this.userDetails})
      : super(key: key);

  @override
  _TailorHomepage_forBuyerState createState() =>
      _TailorHomepage_forBuyerState();
}

class _TailorHomepage_forBuyerState extends State<TailorHomepage_forBuyer> {
  int noOfCartItems = 0;

  Cart cart = new Cart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: layout(),
    );
  }

  layout() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 3,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: Text(widget.tailorshopDetails.tsName.toUpperCase(),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ),
            ),

            // products(widget.shopDetails),
            SizedBox(
                height: MediaQuery.of(context).size.height,
                child: FutureBuilder(
                  future: fetchServices(widget.tailorshopDetails.tId),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: .75),
                        // scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index) {
                          AllServices services = snapshot.data[index];

                          return itemCard(
                            services,
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
                      imageUrl + "${shopDetails.sImage}",
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

  itemCard(AllServices service) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            print(widget.userDetails.id);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ServiceDetailPage(
                      serviceDetails: service,
                      tailorshopDetails: widget.tailorshopDetails,
                      userDetails: widget.userDetails),
                ));
          },
          child: Container(
              height: 180,
              width: 160,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16)),
              child: Image.network(imageUrl + "${service.seImage}")),
        ),
        Row(
          children: [
            Column(
              children: [
                Text(
                  service.seName.toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  service.sePrice.toString(),
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            // GestureDetector(
            //   onTap: () {
            //     setState(() {
            //       noOfCartItems++;
            //       cart.addProductInCart(shopDetails.pId, shopDetails.pName,
            //           shopDetails.pPrice, shopDetails.pImage);
            //       print(cart.products);
            //     });
            //   },
            //   child: Container(
            //     child: Center(child: Text("Cart me")),
            //     height: 25,
            //     width: 75,
            //     decoration: BoxDecoration(
            //         border: Border.all(color: Colors.blueAccent),
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(20)),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
