import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:customer/cubit/payment/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_cubit/home_cubit.dart';
import '../helper/my_constans.dart';
import '../helper/screen_size.dart';
import 'my_button.dart';
import 'my_icon.dart';
import 'my_snackbar.dart';
import 'text_input.dart';

class PaymantBody extends StatefulWidget {
  const PaymantBody({super.key});

  @override
  State<PaymantBody> createState() => _PaymantBodyState();
}

class _PaymantBodyState extends State<PaymantBody> {
  final TextEditingController cntraccountNumber = TextEditingController();

  final TextEditingController cntrmony = TextEditingController();
  TextEditingController code = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  final Screensize screen = Screensize();
  Mysnackbar snackbar = Mysnackbar();
  @override
  void initState() {
    cntraccountNumber.text = '3011730174';
    cntrmony.text = BlocProvider.of<HomeCubit>(context).many!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocListener<PaymentCubit, PaymentState>(
        listener: (context, state) {
          if (state is PaymentNoInernt) {
            code.clear();
            Navigator.pop(context);
            snackbar.showSnackbarError(
              context: context,
              title: 'لا يوجد اتصال بالإنترنت',
              message: 'يرجى التحقق من الاتصال',
              contentType: ContentType.failure,
            );
          } else if (state is PaymentFaulier) {
            code.clear();
            Navigator.pop(context);
            snackbar.showSnackbarError(
              context: context,
              title: 'خطأ',
              message: state.errMessage,
              contentType: ContentType.warning,
            );
          } else if (state is PaymentNoRowEffect) {
            code.clear();
            Navigator.pop(context);
            snackbar.showSnackbarError(
              context: context,
              title: 'خطأ',
              message: 'لم تتم عملية نقل الأموال',
              contentType: ContentType.warning,
            );
          } else if (state is PaymentWrongCode) {
            code.clear();
            Navigator.pop(context);
            snackbar.showSnackbarError(
              context: context,
              title: 'رمز التأكيد',
              message: 'رمز التأكيد غير صحيح، يرجى المحاولة مرة أخرى',
              contentType: ContentType.help,
            );
          } else if (state is PaymentSuccessfully) {
            code.clear();
            BlocProvider.of<HomeCubit>(context).getDataForHomePage();
            Navigator.pop(context);
            snackbar.showSnackbarError(
              context: context,
              title: 'تمت العملية بنجاح',
              message: 'تم نقل الأموال بنجاح',
              contentType: ContentType.success,
            );
          }
        },
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Form(
            key: formKey,
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
                        icon: const Icon(Icons.payments_outlined),
                        color: kColorPrimer,
                        size: screen.sizeScreen(context, 0.15, 0.3),
                      ),
                      const SizedBox(height: 20),
                      MyTextinput(
                        enable: false,
                        labelStyle: const TextStyle(color: Colors.white),
                        controller: cntraccountNumber,
                        typeText: TextInputType.number,
                        colorInFocuse: Colors.white,
                        text: "رقم حساب المحطة",
                        texticon:
                            const Icon(Icons.edit_outlined, color: kColorwhite),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      MyTextinput(
                        labelStyle: const TextStyle(color: Colors.white),
                        controller: cntrmony,
                        typeText: TextInputType.number,
                        colorInFocuse: Colors.white,
                        text: "المبلغ المراد تسديده",
                        texticon: const Icon(Icons.check_circle_outline,
                            color: kColorwhite),
                      ),
                      const SizedBox(height: 12),
                      // Instruction text for payment method
                      Text(
                        'طريقة الدفع: عبر بنك الكريمي',
                        style: TextStyle(
                          fontSize: screen.sizeScreen(context, 0.022, 0.04),
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      MyButton(
                        colorFont: Colors.white,
                        text: "اعتماد الطلب",
                        action: () {
                          if (formKey.currentState!.validate()) {
                            alert();
                          }
                        },
                        color: kColorPrimer,
                        width: screen.sizeScreen(context, 0.09, 0.7),
                        height: screen.sizeScreen(context, 0.02, 0.05),
                        fontSize: screen.sizeScreen(context, 0.025, 0.045),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  void alert() {
    GlobalKey<FormState> fromKeyalert= GlobalKey();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          elevation: 16,
          backgroundColor: Colors.white,
          titlePadding: const EdgeInsets.only(top: 24, left: 24, right: 24),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          title: Form(
            key: fromKeyalert,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.attach_money,
                  color: Colors.green.shade700,
                  size: 56,
                ),
                const SizedBox(height: 12),
                Text(
                  'يرجى إدخال رمز التعريف الخاص بالدفع الإلكتروني\n(يمكنك الحصول عليه من تطبيق بنك الكريمي)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade800,
                  ),
                ),
              ],
            ),
          ),
          content: MyTextinput(
            labelStyle:const TextStyle(color: Colors.black) ,
            style: const TextStyle(color: Colors.black),
            controller: code,
            typeText: TextInputType.number,
            text: 'أدخل الرمز',
            texticon: const Icon(
              Icons.lock,
              color: Colors.green,
            ),
          ),
          actionsPadding:
              const EdgeInsets.only(bottom: 16, right: 24, left: 24),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: 100,
                    child: BlocBuilder<PaymentCubit, PaymentState>(
                      builder: (context, state) {
                        return MyButton(
                          isLoading: state is PaymentLoading,
                          text: 'تأكيد',
                          action: () {
                            if(fromKeyalert.currentState!.validate()) {
                              BlocProvider.of<PaymentCubit>(context).paymanets(
                                code: code.text,
                                many: cntrmony.text,
                                allMayn:
                                    BlocProvider.of<HomeCubit>(context).many!);
                            }
                          },
                          color: Colors.green.shade700,
                          colorFont: Colors.white,
                          fontSize: 18,
                          height: 10,
                          width: 20,
                        );
                      },
                    )),
                const SizedBox(
                  width: 10,
                ),
                MyButton(
                  text: 'الغاء',
                  action: () {
                    Navigator.of(context).pop();
                  },
                  color: Colors.red.shade700,
                  colorFont: Colors.white,
                  fontSize: 18,
                  height: 11,
                  width: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
