import 'package:flutter/material.dart';
import 'package:kapra_cart/API/allOrderItemsproduct.dart';
import 'package:kapra_cart/ModelClasses/itemModelClass.dart';
import 'package:kapra_cart/ModelClasses/oderModelClass.dart';
import 'package:kapra_cart/constant.dart';
import 'package:kapra_cart/customWidgets/clayContainer.dart';

class ItemDetailScren extends StatefulWidget {
  final OrderDetails orderDetails;
  const ItemDetailScren({Key key, this.orderDetails}) : super(key: key);

  @override
  _ItemDetailScrenState createState() => _ItemDetailScrenState();
}

class _ItemDetailScrenState extends State<ItemDetailScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: layout(),
    );
  }

  layout() {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              clayContainer(
                borderRadius: 75,
                color: Colors.white,
                height: 130,
                width: 130,
                child: Center(
                    child: Text(
                  "Items",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.3,
                child: Container(
                  child: FutureBuilder(
                    future: fetchAllitems(widget.orderDetails.orderId),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, index) {
                            ItemModelClass itemModelClass =
                                snapshot.data[index];

                            return allitems(itemModelClass, index + 1);
                          },
                        );
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  allitems(ItemModelClass itemdetails, count) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        elevation: 20,
        child: GestureDetector(
          onTap: () {},
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 130,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(30)),
            child: Row(
              children: [
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 5),
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(40),
                //     child: Image.network(
                //       "http://192.168.18.13/kapraCartScript/${product.pImage}",
                //       height: 100,
                //       width: 100,
                //       fit: BoxFit.fill,
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        itemdetails.productName.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                            letterSpacing: 2),
                      ),
                      Flexible(
                        child: Text(
                          "Item # " + count.toString(),
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              color: buttonColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "PKR  " + itemdetails.price,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                    letterSpacing: 2),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
