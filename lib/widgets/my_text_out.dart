import 'package:flutter/material.dart';

class MytextLable extends StatelessWidget {
const  MytextLable({super.key, required this.value, this.color = Colors.white, this.style});

  final String value;
  final Color color;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      textAlign: TextAlign.center,
      style: style ?? TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        
      ),
      

    );
  }
}
