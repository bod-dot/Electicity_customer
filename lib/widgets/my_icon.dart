
import 'package:flutter/material.dart';

class Myicon extends StatelessWidget {
 const  Myicon({
    super.key,
    required this.icon,
    required this.color,
    required this.size,
    this.heigthContainer,
    this.widthContainer,
  });

  final Icon icon;
  final Color color;
  final double size;
 final double? heigthContainer;
 final double? widthContainer;


  @override
  Widget build(BuildContext context) {


    return Container(
      height: heigthContainer,
      width: widthContainer,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 10,
              offset:const   Offset(0, 3),
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
