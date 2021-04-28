import 'package:flutter/material.dart';
import 'package:kapra_cart/constant.dart';

class backgroundCurveLayout extends StatelessWidget {
  final height;

  const backgroundCurveLayout({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.grey[200],
        ),
        Positioned(
          top: -180,
          left: -40,
          height: height,
          width: MediaQuery.of(context).size.width * 1.2,
          child: Container(
            //height: height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [appbarColor, buttonColor],
                  begin: FractionalOffset(0, 0),
                  end: FractionalOffset(1, 0),
                  stops: [0, 1],
                ),
                borderRadius: BorderRadius.circular(220)),
          ),
        ),
      ],
    );
  }
}
