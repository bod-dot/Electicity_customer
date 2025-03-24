import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const  MyButton({
    super.key,
    required this.text,
    required this.action,
    required this.color,
    required this.width,
    required this.height,
    required this.fontSize,
    this.colorFont=Colors.black,
    this.isLoading=false,

  });

  final String text;
  final VoidCallback action;
  final Color color;
  final double width;
  final double height;
  final double fontSize;
  final Color colorFont;
final bool isLoading;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5,

        backgroundColor: color,
        padding: EdgeInsets.symmetric(
          horizontal: width,
          vertical: height,


        ),
      ),
      onPressed:!isLoading ?action:null,
      child:isLoading? const    CircularProgressIndicator(): Text(
        text,
        style: TextStyle(fontSize: fontSize,color: colorFont,fontWeight: FontWeight.bold),
      ),
    );
  }
}
