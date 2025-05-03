
import 'package:customer/cubit/payment/payment_cubit.dart';
import 'package:customer/widgets/paymant_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../helper/my_constans.dart';
import '../helper/screen_size.dart';

class Paymentpage extends StatefulWidget {
const  Paymentpage({super.key});

  static String id = "PaymentPage";

  @override
  State<Paymentpage> createState() => _PaymentpageState();
}

class _PaymentpageState extends State<Paymentpage> {
  
  
    final Screensize screen = Screensize();


  @override
  
 

  @override
  Widget build(BuildContext context) {
   


    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
             resizeToAvoidBottomInset: true,     
            
            backgroundColor: kColorThreed,
            appBar: AppBar(
            
              automaticallyImplyLeading: false,
              actions: [
                IconButton(onPressed: (){
                 // FocusScope.of(context).unfocus();
                  Navigator.pop(context);
                }, icon:const  Directionality(
                  textDirection: TextDirection.ltr,
                  child:   Icon(Icons.arrow_back,color: Colors.white,)))
              ],
              title: Text(
                "صفحة الدفع الإلكتروني",
                style: TextStyle(
                  fontSize: screen.sizeScreen(context, 0.03, 0.05),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              toolbarHeight: screen.sizeScreen(context, 0.10, 0.2),
              backgroundColor: kColorPrimer,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              elevation: 5,
            ),
      
      
      
            
            body:const  PaymantBody()
          ),
    );
  }
}
