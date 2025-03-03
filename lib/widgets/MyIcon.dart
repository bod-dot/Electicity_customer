
import 'package:flutter/material.dart';

class Myicon extends StatelessWidget {
  Myicon({
    super.key,
    required this.icon,
    required this.color,
    required this.size,
    this.HeigthContainer,
    this.WidthContainer,
  });

  final Icon icon;
  final Color color;
  final double size;
  double? HeigthContainer;
  double? WidthContainer;


  @override
  Widget build(BuildContext context) {


    return Container(
      height: HeigthContainer,
      width: WidthContainer,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 3),
            )
          ]),
      child: Icon(
        icon.icon,
        size: size,
        color: color,
      ),
    );
  }
}
