import 'package:customer/helper/Constans.dart';
import 'package:flutter/material.dart';





class Chatbublefromfreinds extends StatelessWidget {
  const Chatbublefromfreinds({super.key,required this.message });

  final String message ;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(


        padding: EdgeInsets.symmetric(horizontal:20,vertical:25),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: KColorBlack,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
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
