import 'package:flutter/material.dart';

class splachScreen extends StatefulWidget {
  @override
  _splachScreenState createState() => _splachScreenState();
}

class _splachScreenState extends State<splachScreen> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: myclipper(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Text(
            "KAPRA CART",
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class myclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 120);
    path.lineTo(size.width, size.height - 50);

    path.lineTo(size.width, 130);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
