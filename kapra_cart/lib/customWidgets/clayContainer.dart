import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';

class clayContainer extends StatefulWidget {
  final Color color;
  final double height;
  final double width;
  final double borderRadius;
  final Widget child;
  final Function ontap;

  const clayContainer(
      {Key key,
      this.color,
      this.height,
      this.width,
      this.borderRadius,
      this.child,
      this.ontap})
      : super(key: key);
  @override
  _clayContainerState createState() => _clayContainerState();
}

class _clayContainerState extends State<clayContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: ClayContainer(
        color: widget.color,
        height: widget.height,
        width: widget.width,
        borderRadius: widget.borderRadius,
        curveType: CurveType.concave,
        child: widget.child,
      ),
    );
  }
}
