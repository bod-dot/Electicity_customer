import 'package:customer/cubit/home_cubit/home_cubit.dart';
import 'package:customer/helper/my_constans.dart';
import 'package:customer/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
class NoEnterntScreen extends StatelessWidget {
  const NoEnterntScreen({super.key, required this.onPressed});
 final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // رسوم متحركة لإضافة لمسة عصرية
              Lottie.asset(
                'assets/images/NotAllow.json',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),

              // رسالة الخطأ
            const  Text(
                "لا يوجد انترنت",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),

              // وصف إضافي
             const Text(
                "يرجى التأكد من أن لديك  انترنت في جهازك ",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // زر المحاولة مرة أخرى
          MyButton(text: "فحص الاتصال", action: (){
            BlocProvider.of<HomeCubit>(context).getDataForHomePage();
          }, color: kColorPrimer, width: 90, height: 10, fontSize: 20,colorFont: Colors.white,)
            ],
          ),
        ),
      ),
    );
  }
}
