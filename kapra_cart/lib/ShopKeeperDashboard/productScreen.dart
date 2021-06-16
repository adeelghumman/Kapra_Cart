import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kapra_cart/API/productApi.dart';
import 'package:kapra_cart/ModelClasses/product.dart';
import 'package:kapra_cart/constant.dart';
import 'package:kapra_cart/customWidgets/clayContainer.dart';

class ProductScreen extends StatefulWidget {
  final String category;
  final String shopId;

  const ProductScreen({Key key, this.category, this.shopId}) : super(key: key);
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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
                  widget.category,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
              ),
              Container(
                child: FutureBuilder(
                  future: fetchProducts(widget.category, widget.shopId),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index) {
                          Product product = snapshot.data[index];

                          return allProducts(product);
                        },
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  allProducts(Product product) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        elevation: 20,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 130,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                    basicUrl + "${product.pImage}",
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.pName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          letterSpacing: 2),
                    ),
                    Flexible(
                      child: Text(
                        product.pDescription,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "PKR " + product.pPrice,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              letterSpacing: 2),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
