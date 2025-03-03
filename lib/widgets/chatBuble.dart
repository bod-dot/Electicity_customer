import 'package:customer/helper/Constans.dart';
import 'package:flutter/material.dart';





class Chatbuble extends StatelessWidget {
  const Chatbuble({super.key,required this.message });

final String message ;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(


        padding: EdgeInsets.symmetric(horizontal:20,vertical:25),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: KColorPrimer,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(32),
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32)
          ),
        ),

        child: Text(
         message ,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
