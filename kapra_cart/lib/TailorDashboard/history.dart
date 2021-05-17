import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: bodyLayout(),
      ),
    );
  }

  bodyLayout() {
    return Padding(
      padding: const EdgeInsets.only(top: 57),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0
                )
              ]
            ),
            child: Center(
              child: Column(
                children: [

                  Text('You have completed 100 projects', style: TextStyle(fontSize: 20),),
                  Text('and generated a revenue of'),
                  Container(height: 14,),
                  Text('Rs. 6000', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),),

                ],
              ),
            ),
          ),

          Container(height: 30,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Orders History',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          orderLayout(),

        ],
      ),
    );
  }

  orderLayout() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
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
      ),
    );
  }
  orderItem(int index, {bool expand = false}) {
    return Container(
      width: expand ? MediaQuery.of(context).size.width : 200,
      margin: EdgeInsets.only(
          right: expand ? 0 : 10
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0
                      )
                    ]
                ),
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

              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 120,
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: (index == 1 || index  == 5 || index == 6) ? Colors.red : Colors.green, width: 3.0,)
                  ),
                  child: Center(
                    child: Text((index == 1 || index  == 5 || index == 6) ? 'Not Completed' : 'Completed', style: TextStyle(
                      color: (index == 1 || index  == 5 || index == 6) ? Colors.red : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
              ),

            ],
          ),
          Container(height: 10,),
          Text('Arabic Lawn Suit', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
          Text('Customer:- ' + 'Hadia Hashmi'),
          Text('Finished On:- ' + '03/05/2021'),
          Container(height: 20,),
        ],
      ),
    );
  }
}
