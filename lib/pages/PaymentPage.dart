import 'package:flutter/material.dart';

import '../helper/Constans.dart';
import '../helper/screenSize.dart';
import '../widgets/MyButton.dart';
import '../widgets/MyIcon.dart';
import '../widgets/TextInput.dart';
import 'LoginPage.dart';


class Paymentpage extends StatelessWidget {
   Paymentpage({super.key,  });


   static String Id="PaymentPage";
  Screensize screen = Screensize();

   final TextEditingController cntraccountNumber = TextEditingController();
   final TextEditingController cntrmony = TextEditingController();
  @override
  Widget build(BuildContext context) {
  final  double many=ModalRoute.of(context)!.settings.arguments as double ;
    cntrmony.text=many.toString();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: KColorThreed,
        appBar: AppBar(
          title: Text(
            "  صفحة الدفع الكتروني",
            style: TextStyle(
              fontSize: screen.SizeScreen(context, 0.03, 0.05),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          toolbarHeight: screen.SizeScreen(context, 0.10, 0.2),
          backgroundColor: KColorPrimer,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          elevation: 5,
        ),
        body: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //   colors: [KColorSecond, KColorThreed],
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            // ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Myicon(
                        HeigthContainer: screen.SizeScreen(context, 0.19, 0.5),
                        WidthContainer: screen.SizeScreen(context, 0.19, 0.45),
                        icon: Icon(Icons.payments_outlined),
                        color: KColorPrimer,
                        size: screen.SizeScreen(context, 0.15, 0.3)),
                    const SizedBox(height: 20),

                    MyTextinput(


                    typeText: TextInputType.number,
                      colorInFocuse: Colors.white,
                      text: "  رقم حسابك",
                      Texticon:
                      const Icon(Icons.edit_outlined, color: KColorwhite),

                      controller: cntraccountNumber,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    MyTextinput(

                    typeText: TextInputType.number,
                      colorInFocuse: Colors.white,
                      text: "  المبلغ المراد تسديده",
                      Texticon: const Icon(Icons.check_circle_outline,
                          color: KColorwhite),

                      controller: cntrmony,
                    ),
                    const SizedBox(height: 20),
                    Mybutton(
                        text: "  موافق",
                        action: () {
                         // Navigator.pushReplacementNamed(context, LoginPage.id);

                        },
                        color: KColorPrimer,
                        width: screen.SizeScreen(context, 0.09, 0.7),
                        height: screen.SizeScreen(context, 0.02, 0.05),
                        fontSize: screen.SizeScreen(context, 0.025, 0.045)),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
