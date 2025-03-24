import 'package:customer/helper/my_constans.dart';
import 'package:flutter/material.dart';





class Chatbuble extends StatelessWidget {
  const Chatbuble({super.key,required this.message });

final String message ;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(


        padding:const EdgeInsets.symmetric(horizontal:20,vertical:25),
        margin:const EdgeInsets.all(8),
        decoration:const BoxDecoration(
          color: kColorPrimer,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(32),
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32)
          ),
        ),

        child: Text(
         message ,
          style:const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
