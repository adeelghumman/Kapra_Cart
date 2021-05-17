import 'package:flutter/material.dart';
import 'package:kapra_cart/TailorDashboard/profile.dart';
//import 'package:tailor_app/profile.dart';

import 'history.dart';
import 'order.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var screens = [OrderScreen(), HistoryScreen(), ProfileScreen()];

  var activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
        currentIndex: activeIndex,
        items: [
          customBottomBar(
            title: "Orders",
            icon: Icon(Icons.wysiwyg),
          ),
          customBottomBar(
            title: "History",
            icon: Icon(Icons.history),
          ),
          customBottomBar(
            title: "Profile",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }

  customBottomBar({String title, Icon icon}) {
    return BottomNavigationBarItem(
      icon: icon,
      label: title,
    );
  }
}
