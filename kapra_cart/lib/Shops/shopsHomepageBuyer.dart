import 'package:flutter/material.dart';
import 'package:kapra_cart/API/allShopsApi.dart';
import 'package:kapra_cart/API/productApi.dart';
import 'package:kapra_cart/ModelClasses/allShopsModelClass.dart';
import 'package:kapra_cart/ModelClasses/product.dart';

import '../constant.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          products(widget.shopDetails),
          SizedBox(
              height: MediaQuery.of(context).size.height - 400,
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
                        ShopDetails shopDetails = snapshot.data[index];

                        return ItemCard();
                      },
                    );
                  }
                  return CircularProgressIndicator();
                },
              ))
        ],
      ),
    );
  }

  products(ShopDetails shopDetails) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 6.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShopsHomepage_forBuyer(
                  shopDetails: shopDetails,
                ),
              ));
        },
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
      ),
    );
  }

  middleLayout() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: .75),
        itemBuilder: (context, index) => ItemCard(),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 180,
          width: 160,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(16)),
          child: Image.asset(
            "Asset/01.jpg",
          ),
        ),
        Text(
          "Name",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(
          "\$20",
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
