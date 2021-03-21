import 'package:flutter/material.dart';

import '../constant.dart';

class CustomButton extends StatefulWidget {
  final String buttonName;

  const CustomButton({Key key, this.buttonName}) : super(key: key);
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(50)),
      child: Center(
        child: Text(widget.buttonName,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
      ),
    );
  }
}
