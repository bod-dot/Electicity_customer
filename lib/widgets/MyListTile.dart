import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.text,
    required this.icon,
    required this.fontSize,
    required this.circular,
    this.backgroundColor = const Color(0xFFF5F5F5),
    required this.iconColor ,
    this.textColor = Colors.black,
    this.shadowColor = Colors.grey,
    this.action ,
  });

  final String text;
  final Icon icon;
  final double fontSize;
  final double circular;
  final Color backgroundColor;
  final Color iconColor;
  final Color textColor;
  final Color shadowColor;
  final VoidCallback ? action;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(circular),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.3),
            blurRadius: 7,
          //  spreadRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        onTap: action,
        title: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
              color: textColor,
            ),
          ),
        ),
        leading: Icon(
          icon.icon,
          color: iconColor,
          size: fontSize + 10,
        ),

      ),
    );
  }
}
