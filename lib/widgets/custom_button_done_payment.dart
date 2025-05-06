import 'package:flutter/material.dart';

class CustomButtonDonePayment extends StatelessWidget {
  const CustomButtonDonePayment({super.key, required this.isLoading, this.onPressed, required this.checkLength});
  final bool isLoading;
  final bool checkLength;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5,

        backgroundColor: Colors.green,
        padding:const  EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,


        ),
      ),
      onPressed:(checkLength && !isLoading) ? onPressed : null,
      child:isLoading? const    CircularProgressIndicator():const  Text(
        'تاكيد',
        style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),
      ),
    );
  }
}