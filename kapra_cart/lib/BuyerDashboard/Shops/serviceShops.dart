import 'package:flutter/material.dart';
import 'package:kapra_cart/API/allTailorShopsApi.dart';
import 'package:kapra_cart/BuyerDashboard/Shops/tailorHomepage_forBuyer.dart';
import 'package:kapra_cart/ModelClasses/allTailorShopDetails.dart';
import 'package:kapra_cart/ModelClasses/loginUserModelClass.dart';
import 'package:kapra_cart/customWidgets/customAppbar.dart';
import 'package:kapra_cart/customWidgets/customDrawer.dart';

import '../../constant.dart';

import 'backgroundCurveLayout.dart';

class serviceShops extends StatefulWidget {
  loginUserModelClass userDetails;
  final int availBothService;
  final String lastProductOrderPlcedId;

  serviceShops(
      {this.userDetails, this.availBothService, this.lastProductOrderPlcedId});
  @override
  _serviceShopsState createState() => _serviceShopsState();
}

class _serviceShopsState extends State<serviceShops> {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroundCurveLayout(
          height: 500.0,
        ),
        Scaffold(
          key: _scaffoldState,
          drawer: customDrawer(
            userDetails: widget.userDetails,
          ),
          backgroundColor: Colors.transparent,
          appBar: customAppbar(
            height: 80,
            ontap: () {
              _scaffoldState.currentState.openDrawer();
            },
          ),
          body: bodyLayout(),
        )
      ],
    );
  }

  bodyLayout() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 14, bottom: 10),
              child: GestureDetector(
                onTap: () {
                  print(widget.availBothService);
                },
                child: Text(
                  'Browse Shops',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )),
          Container(
            height: 20.0,
          ),
          topBrands(),
          Container(
            height: 10.0,
          ),
          shoplist(),
        ],
      ),
    );
  }

  topBrands() {
    return SizedBox(
        height: 130,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (_, index) {
            return topBrandItem(index);
          },
        ));
  }

  topBrandItem(int index) {
    return Container(
      margin: EdgeInsets.only(left: (index == 0 ? 10 : 5.0)),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(18.0)),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.red,
              child: Image.asset('Asset/11.png'),
            ),
            Container(
              height: 15.0,
            ),
            Text(
              "Saved",
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  shoplist() {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0),
      child: SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: FutureBuilder(
            future: fetchAllTailorShops(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    AllTailorsShopDetails shoAllTailorsShopDetailspDetails =
                        snapshot.data[index];

                    return shops(shoAllTailorsShopDetailspDetails);
                  },
                );
              }
              return CircularProgressIndicator();
            },
          )),
    );
  }

  shops(AllTailorsShopDetails shopDetails) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 6.0),
      child: GestureDetector(
        onTap: () {
          print(widget.userDetails.id);
          ////////////////////////////////////////////////////////////////////////////////////
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => TailorHomepage_forBuyer(
                    tailorshopDetails: shopDetails,
                    userDetails: widget.userDetails,
                    availBothService: widget.availBothService,
                    lastProductOrderPlcedId: widget.lastProductOrderPlcedId),
              ));
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [appbarColor, buttonColor],
              begin: FractionalOffset(0, 0),
              end: FractionalOffset(1, 0),
              stops: [0, 1],
            ),
            borderRadius: BorderRadius.circular(0.0),
          ),
          height: 120.0,
          child: Stack(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        basicUrl + "${shopDetails.tsImage}",
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
                        child: Text(shopDetails.tsName.toUpperCase(),
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
                            Text(shopDetails.tsDescription,
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
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
