import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ordersLayout(),
      ),
    );
  }

  ordersLayout() {
    return Container(
      margin: EdgeInsets.only(top: 57, left: 12, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'New Orders',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Container(
            height: 16,
          ),
          newOrderLayout(),
          Text(
            'Active Orders',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          activeOrderLayout(),
        ],
      ),
    );
  }

  newOrderLayout() {
    return SizedBox(
      height: 210,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return orderItem(index);
        },
      ),
    );
  }

  activeOrderLayout() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top: 20),
          itemCount: 10,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            return orderItem(index, expand: true);
          },
        ),
      ],
    );
  }

  orderItem(int index, {bool expand = false}) {
    return Container(
      width: expand ? MediaQuery.of(context).size.width : 200,
      margin: EdgeInsets.only(right: expand ? 0 : 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5.0)]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                "assets/cloth.jpeg",
                fit: BoxFit.fill,
                width: expand ? MediaQuery.of(context).size.width : 200,
                height: expand ? 200 : 120,
              ),
            ),
          ),
          Container(
            height: 10,
          ),
          Text(
            'Arabic Lawn Suit',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('Customer:- ' + 'Hadia Hashmi'),
          Text('Collected On:- ' + '03/05/2021'),
          Container(
            height: 20,
          ),
        ],
      ),
    );
  }
}
