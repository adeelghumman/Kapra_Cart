import 'package:flutter/material.dart';
import 'package:kapra_cart/API/allShopsApi.dart';
import 'package:kapra_cart/API/productApi.dart';

import 'package:kapra_cart/ModelClasses/allShopsModelClass.dart';
import 'package:kapra_cart/ModelClasses/product.dart';

import '../../constant.dart';
import '../productDetailsPage.dart';

class ShopsHomepage_forBuyer extends StatefulWidget {
  final ShopDetails shopDetails;

  const ShopsHomepage_forBuyer({Key key, this.shopDetails}) : super(key: key);

  @override
  _ShopsHomepage_forBuyerState createState() => _ShopsHomepage_forBuyerState();
}

class _ShopsHomepage_forBuyerState extends State<ShopsHomepage_forBuyer> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
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

                          return ItemCard(
                            shopDetails: shopDetails,
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
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 6.0),
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
}

class ItemCard extends StatelessWidget {
  final Product shopDetails;
  final Product product;
  final Function press;
  const ItemCard({
    Key key,
    this.product,
    this.press,
    this.shopDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
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
              child: Image.network(imageUrl + "${shopDetails.pImage}")),
        ),
        Text(
          shopDetails.pName.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          shopDetails.pPrice.toString(),
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
