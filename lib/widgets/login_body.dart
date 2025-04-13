import 'package:customer/cubit/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../helper/my_constans.dart';
import '../helper/screen_size.dart';
import 'package:customer/widgets/my_button.dart';
import 'package:customer/widgets/my_text_out.dart';
import 'package:customer/widgets/text_input.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  Screensize screen = Screensize();
  AutovalidateMode autovalidateMode =AutovalidateMode.always;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Form(
        autovalidateMode: autovalidateMode,
        key: formKey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100),
              child: ClipOval(
                child: Image.asset(
                  kImage,
                  width: 150,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const MytextLable(value: "مرحبا بك في محطة لتوليد الكهرباء"),
            Container(
                width: double.infinity,
                height: screen.sizeScreen(context, 0.5, 0.8),
                margin: EdgeInsets.only(top: screenHeight * 0.12),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40)),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        "تسجيل الدخول",
                        style: TextStyle(
                            color: kColorBlack,
                            fontSize: screen.sizeScreen(context, 0.03, 0.05),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: screen.sizeScreen(context, 0.05, 0.05),
                      ),
                      MyTextinput(
                        typeText: TextInputType.phone,
                        controller: phone,
                        text: "رقم الهاتف",
                        texticon: const Icon(
                          Icons.phone_android_outlined,
                          color: kColorPrimer,
                        ),
                        obscureText: false,
                      ),
                      SizedBox(
                        height: screen.sizeScreen(context, 0.02, 0.05),
                      ),
                      MyTextinput(
                        isPasswrod: true,
                        controller: password,
                        text: "كلمة السر",
                        texticon: const Icon(
                          Icons.lock_open_rounded,
                          color: kColorPrimer,
                        ),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: screen.sizeScreen(context, 0.05, 0.05),
                      ),
                      BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          return MyButton(
                            isLoading: state is LoginLoading,
                            text: "تسجيل الدخول",
                            action: () async {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<LoginCubit>(context).login(
                                    phone: phone.text, password: password.text);
                              }
                            },
                            color: kColorPrimer,
                            width: screen.sizeScreen(context, 0.14, 0.3),
                            height: screen.sizeScreen(context, 0.02, 0.04),
                            fontSize: screen.sizeScreen(context, 0.02, 0.05),
                          );
                        },
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
