import 'package:flutter/material.dart';
import 'package:kapra_cart/constant.dart';

class customAppbar extends StatefulWidget with PreferredSizeWidget {
  final VoidCallback ontap;
  final double height;

  const customAppbar({Key key, this.ontap, this.height}) : super(key: key);
  @override
  _customAppbarState createState() => _customAppbarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _customAppbarState extends State<customAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: appbarColor,
      height: widget.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 5),
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                widget.ontap();
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(left: 8, right: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 2, color: buttonColor)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  enabled: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey,
                      hintText: "Search",
                      hintStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w300)),
                ),
              ),
            )),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: buttonColor, borderRadius: BorderRadius.circular(10)),
              child: Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
