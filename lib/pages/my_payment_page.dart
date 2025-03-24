import 'package:flutter/material.dart';

import '../helper/my_constans.dart';
import '../helper/screen_size.dart';
import '../widgets/my_button.dart';
import '../widgets/my_icon.dart';
import '../widgets/text_input.dart';


class Paymentpage extends StatelessWidget {
     Paymentpage({super.key  });


static     String id="PaymentPage";
 final  Screensize screen = Screensize();

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
        backgroundColor: kColorThreed,
        appBar: AppBar(
          title: Text(
            "  صفحة الدفع الكتروني",
            style: TextStyle(
              fontSize: screen.sizeScreen(context, 0.03, 0.05),
              fontWeight: FontWeight.bold,
              color: Colors.black,
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
                        heigthContainer: screen.sizeScreen(context, 0.19, 0.5),
                        widthContainer: screen.sizeScreen(context, 0.19, 0.45),
                        icon:const  Icon(Icons.payments_outlined),
                        color: kColorPrimer,
                        size: screen.sizeScreen(context, 0.15, 0.3)),
                    const SizedBox(height: 20),

                    MyTextinput(


                    typeText: TextInputType.number,
                      colorInFocuse: Colors.white,
                      text: "  رقم حسابك",
                      texticon:
                      const Icon(Icons.edit_outlined, color: kColorwhite),

                      controller: cntraccountNumber,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    MyTextinput(

                    typeText: TextInputType.number,
                      colorInFocuse: Colors.white,
                      text: "  المبلغ المراد تسديده",
                      texticon: const Icon(Icons.check_circle_outline,
                          color: kColorwhite),

                      controller: cntrmony,
                    ),
                    const SizedBox(height: 20),
                    MyButton(
                        text: "  موافق",
                        action: () {
                         // Navigator.pushReplacementNamed(context, LoginPage.id);

                        },
                        color: kColorPrimer,
                        width: screen.sizeScreen(context, 0.09, 0.7),
                        height: screen.sizeScreen(context, 0.02, 0.05),
                        fontSize: screen.sizeScreen(context, 0.025, 0.045)),
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
