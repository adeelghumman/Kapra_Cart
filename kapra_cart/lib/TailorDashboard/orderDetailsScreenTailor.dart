import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kapra_cart/Constants/light_color.dart';
import 'package:kapra_cart/Constants/theme.dart';
import 'package:kapra_cart/ModelClasses/buyerModelClass.dart';
import 'package:kapra_cart/ModelClasses/loginUserModelClass.dart';
import 'package:kapra_cart/ModelClasses/oderModelClass.dart';
import 'package:kapra_cart/ModelClasses/serviceOrderModelClass.dart';
import 'package:kapra_cart/constant.dart';
import 'package:kapra_cart/customWidgets/title_text.dart';
import 'package:kapra_cart/data/data.dart';
import 'package:http/http.dart' as http;

class OderDetailsScreenTailor extends StatefulWidget {
  final int count;
  final ServicesOrderDetails servicesOrderDetails;
  final loginUserModelClass buyer;

  const OderDetailsScreenTailor(
      {Key key, this.count, this.buyer, this.servicesOrderDetails})
      : super(key: key);
  @override
  _OderDetailsScreenTailorState createState() =>
      _OderDetailsScreenTailorState();
}

class _OderDetailsScreenTailorState extends State<OderDetailsScreenTailor>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInToLinear));
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isLiked = true;

  Widget _appBar() {
    return Container(
      padding: AppTheme.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: _icon(Icons.arrow_back_ios,
                color: Colors.black54, size: 15, padding: 12, isOutLine: true),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isLiked = !isLiked;
              });
            },
            child: _icon(isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? LightColor.red : LightColor.lightGrey,
                size: 15,
                padding: 12,
                isOutLine: false),
          )
        ],
      ),
    );
  }

  Widget _icon(IconData icon,
      {Color color = LightColor.iconColor,
      double size = 20,
      double padding = 10,
      bool isOutLine = false}) {
    return Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.all(padding),
      // margin: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: Border.all(
            color: LightColor.iconColor,
            style: isOutLine ? BorderStyle.solid : BorderStyle.none),
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color:
            isOutLine ? Colors.transparent : Theme.of(context).backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Color(0xfff8f8f8),
              blurRadius: 5,
              spreadRadius: 10,
              offset: Offset(5, 5)),
        ],
      ),
      child: Icon(icon, color: color, size: size),
    );
  }

  Widget _productImage() {
    return AnimatedBuilder(
      builder: (context, child) {
        return AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: animation.value,
          child: child,
        );
      },
      animation: animation,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          TitleText(
            text: "Kapra Cart",
            fontSize: 80,
            color: LightColor.lightGrey,
          ),
          // Image.network(
          //     "http://t3.gstatic.com/licensed-image?q=tbn:ANd9GcRhOhUYXfsabtCJ9o62_HqJ7-qnaLHTnud7NLKk-1PRFWZO9ba-38vmPI7oNJHaEHpi2_xuQIy29jqIctZME0A")
        ],
      ),
    );
  }

  Widget _categoryWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0),
      width: AppTheme.fullWidth(context),
      height: 80,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              AppData.showThumbnailList.map((x) => _thumbnail(x)).toList()),
    );
  }

  Widget _thumbnail(String image) {
    return AnimatedBuilder(
        animation: animation,
        //  builder: null,
        builder: (context, child) => AnimatedOpacity(
              opacity: animation.value,
              duration: Duration(milliseconds: 500),
              child: child,
            ),
        child: Container(
          height: 40,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: LightColor.grey,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(13),
            ),
            color: Theme.of(context).backgroundColor,
          ),
          child: Image.asset(image),
        ));
  }

  Widget _detailWidget() {
    return DraggableScrollableSheet(
      maxChildSize: .8,
      initialChildSize: .53,
      minChildSize: .53,
      builder: (context, scrollController) {
        return Container(
          padding: AppTheme.padding.copyWith(bottom: 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(height: 5),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                        color: LightColor.iconColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TitleText(
                          text: "Order # " + widget.count.toString(),
                          fontSize: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          // Row(
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   children: <Widget>[
                          //     TitleText(
                          //       text: "PKR ",
                          //       fontSize: 18,
                          //       color: Colors.blue[400],
                          //     ),
                          //     TitleText(
                          //       text:
                          //           widget.servicesOrderDetails,
                          //       fontSize: 25,
                          //     ),
                          //   ],
                          // ),
                          // Row(
                          //   children: <Widget>[
                          //     Icon(Icons.star,
                          //         color: LightColor.yellowColor, size: 17),
                          //     Icon(Icons.star,
                          //         color: LightColor.yellowColor, size: 17),
                          //     Icon(Icons.star,
                          //         color: LightColor.yellowColor, size: 17),
                          //     Icon(Icons.star,
                          //         color: LightColor.yellowColor, size: 17),
                          //     Icon(Icons.star_border, size: 17),
                          //   ],
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // _availableSize(),
                SizedBox(
                  height: 20,
                ),
                // _availableColor(),
                SizedBox(
                  height: 20,
                ),
                _description(),
                // Padding(
                //   padding: const EdgeInsets.only(top: 8.0),
                //   child: Container(
                //     width: 300,
                //     height: 50,
                //     decoration: BoxDecoration(
                //         color: buttonColor,
                //         borderRadius: BorderRadius.circular(50)),
                //     child: Center(
                //       child: Text("View item details",
                //           style: TextStyle(
                //             fontSize: 17,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white,
                //           )),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _availableSize() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleText(
          text: "Available Size",
          fontSize: 14,
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _sizeWidget("US 6"),
            _sizeWidget("US 7", isSelected: true),
            _sizeWidget("US 8"),
            _sizeWidget("US 9"),
          ],
        )
      ],
    );
  }

  Widget _sizeWidget(String text,
      {Color color = LightColor.iconColor, bool isSelected = false}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
            color: LightColor.iconColor,
            style: !isSelected ? BorderStyle.solid : BorderStyle.none),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color:
            isSelected ? LightColor.orange : Theme.of(context).backgroundColor,
      ),
      child: TitleText(
        text: text,
        fontSize: 16,
        color: isSelected ? LightColor.background : LightColor.titleTextColor,
      ),
    );
  }

  Widget _colorWidget(Color color, {bool isSelected = false}) {
    return CircleAvatar(
      radius: 12,
      backgroundColor: color.withAlpha(150),
      child: isSelected
          ? Icon(
              Icons.check_circle,
              color: color,
              size: 18,
            )
          : CircleAvatar(radius: 7, backgroundColor: color),
    );
  }

  Widget _description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleText(
          text: "Customer Details ",
          fontSize: 20,
          color: Colors.blue[400],
        ),
        SizedBox(height: 20),
        TitleText(
          text: "Customer Name",
          fontSize: 14,
        ),
        Center(child: Text(widget.buyer.name.toString())),
        SizedBox(height: 20),
        TitleText(
          text: "Customer E-mail",
          fontSize: 14,
        ),
        Center(child: Text(widget.buyer.email.toString())),
        SizedBox(height: 20),
        TitleText(
          text: "Customer Phone#",
          fontSize: 14,
        ),
        Center(child: Text(widget.buyer.phone.toString())),
        SizedBox(height: 20),
        TitleText(
          text: "Address",
          fontSize: 14,
        ),
        Center(child: Text(widget.buyer.address.toString())),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            width: 300,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.brown[300],
                borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: Text("View item details",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: GestureDetector(
                onTap: () {
                  updateStatus(
                    "1",
                    widget.servicesOrderDetails.seOrderId,
                  );
                  Navigator.pop(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2 - 30,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: Text("Completed ",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: GestureDetector(
                onTap: () {
                  updateStatus(
                    "0",
                    widget.servicesOrderDetails.seOrderId,
                  );

                  Navigator.pop(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2 - 30,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: Text("Incomplete",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xfffbfbfb),
              Color(0xfff7f7f7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  _appBar(),
                  _productImage(),
                  // _categoryWidget(),
                ],
              ),
              _detailWidget()
            ],
          ),
        ),
      ),
    );
  }

  void updateStatus(status, seorderId) async {
    var response = await http.post(basicUrl + "updateServiceOrderStatus.php",
        body: {"status": status, "se_orderId": seorderId});
  }
}
