import 'package:flutter/material.dart';
import 'package:kapra_cart/API/cartProducts.dart';
import 'package:kapra_cart/BuyerDashboard/Shops/shopsHomepageBuyer.dart';
import 'package:kapra_cart/Constants/light_color.dart';
import 'package:kapra_cart/Constants/theme.dart';
import 'package:kapra_cart/ModelClasses/allShopsModelClass.dart';
import 'package:kapra_cart/ModelClasses/loginUserModelClass.dart';
import 'package:kapra_cart/ModelClasses/product.dart';
import 'package:kapra_cart/customWidgets/title_text.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';
import 'cart.dart';

class CartScreen extends StatefulWidget {
  final List cartItemsIds;
  final ShopDetails shopDetails;
  final Cart cart;
  final loginUserModelClass userDetails;

  const CartScreen(
      {Key key,
      this.cartItemsIds,
      this.shopDetails,
      this.cart,
      this.userDetails})
      : super(key: key);
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int noOfDisplay = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onBackPressed(); // Action to perform on back pressed
        return false;
      },
      child: Scaffold(
        body: layout(),
      ),
    );
  }

  layout() {
    return Container(
      child: Column(
        children: [
          Container(
              child: ListView.builder(
            itemCount: widget.cart.products.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, index) {
              return cartItems(widget.cart.products[index], index);
            },
          )),
          lowerlayout(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [_price(), _submitButton(context)],
              ),
            ),
          ),
        ],
      ),
    );
  }

  cartItems(product, index) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 20),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    child: Image.network(
                      imageUrl + "${product[3]}",
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
                      child: Text(product[1].toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
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
                          Text("PKR " + product[2].toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              )),
                          Container(
                            width: 20.0,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.cart.removeFromCart(
                                  widget.cart.products[index][0]);
                            });
                          },
                          child: Container(
                            child: Center(child: Text("Discard")),
                            height: 25,
                            width: 75,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
    ;
  }

  Widget _price() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TitleText(
          text: " " + widget.cart.products.length.toString() + " Items",
          color: LightColor.grey,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        TitleText(
          text: "PKR " + widget.cart.totalBill().toString(),
          fontSize: 18,
        ),
      ],
    );
  }

  Widget _submitButton(BuildContext context) {
    return FlatButton(
        onPressed: () {
          uploadOrderDetails();
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: LightColor.orange,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 12),
          width: AppTheme.fullWidth(context) * .7,
          child: TitleText(
            text: 'Next',
            color: LightColor.background,
            fontWeight: FontWeight.w500,
          ),
        ));
  }

  void onBackPressed() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ShopsHomepage_forBuyer(
            shopDetails: widget.shopDetails,
          ),
        ));
  }

  lowerlayout() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Payment Methods ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3 + 10,
              ),
              Expanded(
                  child: Image(
                image: AssetImage(
                  "Asset/check.png",
                ),
                width: 30,
                height: 30,
              ))
            ],
          ),
          Divider(
            height: 20,
            thickness: 1,
          ),
          Row(
            children: [
              Image(
                image: AssetImage("Asset/gpay2.png"),
                height: 30,
                width: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Text("Google Pay ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          Divider(
            height: 20,
            thickness: 1,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Image(
                  image: AssetImage("Asset/paypal4.png"),
                  height: 30,
                  width: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("PayPal",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Divider(
            height: 20,
            thickness: 1,
          ),
        ],
      ),
    );
  }

  void uploadOrderDetails() async {
    final response = await http.post(basicUrl + "OrderDetails.php", body: {
      'buyerId': int.parse(widget.userDetails.id),
      'shopId': int.parse(widget.shopDetails.sId),
      'ProductsBill': widget.cart.totalBill(),
      'ProductIds': "21",
      'PaymentMethod': "COD"
    });
    print(response.body);
  }
}
