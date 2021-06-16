import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kapra_cart/API/AllNotifications.dart';
import 'package:kapra_cart/ModelClasses/AllNotificationsModelclass.dart';
import 'package:kapra_cart/constant.dart';

class Notifications extends StatefulWidget {
  final int comingStatus;
  const Notifications({Key key, this.comingStatus}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: layout(),
    );
  }

  layout() {
    return SingleChildScrollView(
      child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
            future: fetchallnotifications(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    GetNotification allnotifications = snapshot.data[index];

                    return an(allnotifications);
                  },
                );
              }
              return Center(child: Text("No New Promotion Notifications"));
            },
          )),
    );
  }

  an(GetNotification notifications) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 12.0, right: 12.0, top: 10, bottom: 6.0),
      child: GestureDetector(
        onTap: () {
          //////////////////
          ///allnotifications
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                widget.comingStatus == 2
                    ? Colors.blue[400]
                    : widget.comingStatus == 3
                        ? Colors.brown[400]
                        : Colors.red,
                Colors.black
              ],
              begin: FractionalOffset(0, 0),
              end: FractionalOffset(1, 0),
              stops: [0, 1],
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          height: 120.0,
          child: Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(notifications.notifications,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          )),
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
}
