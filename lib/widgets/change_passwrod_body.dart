import 'package:customer/cubit/change_passwrod/change_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../helper/my_constans.dart';
import '../helper/screen_size.dart';
import '../widgets/text_input.dart';
import '../widgets/my_button.dart';
import '../widgets/my_icon.dart';
import 'my_snackbar.dart';
class ChangePasswrodBody extends StatefulWidget {
  const ChangePasswrodBody({super.key});

  @override
  State<ChangePasswrodBody> createState() => _ChangePasswrodBodyState();
}

class _ChangePasswrodBodyState extends State<ChangePasswrodBody> {
  Mysnackbar mysnackbar = Mysnackbar();
   Screensize screen = Screensize();

  final TextEditingController oldPassword = TextEditingController();

  final TextEditingController newPassword = TextEditingController();

  final TextEditingController confirmPassword = TextEditingController();
  GlobalKey<FormState>formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
     final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return  Form(
      key: formKey,
      child: Container(
            width: screenWidth,
            height: screenHeight,
            decoration: const BoxDecoration(
      
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
                          icon:const Icon(Icons.lock_outline),
                          color: kColorPrimer,
                          size: screen.sizeScreen(context, 0.15, 0.3)),
                      const SizedBox(height: 20),
                      MyTextinput(
                        isPasswrod: true,
                        colorInFocuse: Colors.white,
                        text: "كلمة السر القديمة",
                        texticon: const Icon(Icons.lock_open_outlined,
                            color: kColorwhite),
                        obscureText: true,
                        controller: oldPassword,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      MyTextinput(
                        isPasswrod: true,
                        colorInFocuse: Colors.white,
                        text: "كلمة السر الجديدة",
                        texticon:
                            const Icon(Icons.edit_outlined, color: kColorwhite),
                        obscureText: true,
                        controller: newPassword,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      MyTextinput(
                        isPasswrod: true,
                        colorInFocuse: Colors.white,
                        text: "تأكيد كلمة السر",
                        texticon: const Icon(Icons.check_circle_outline,
                            color: kColorwhite),
                        obscureText: true,
                        controller: confirmPassword,
                      ),
                      const SizedBox(height: 20),
                      BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                        builder: (context, state) {
                          return MyButton(
                            isLoading:state is ChangePasswordLoading ,
                              text: "تغيير كلمة السر",
                              action: () async {
                                if (formKey.currentState!.validate()) {
                                    
                                 BlocProvider.of<ChangePasswordCubit>(context).changePassword(newPassword: newPassword, confirmPassword: confirmPassword, oldPassword: oldPassword);
                                
                                }
                              },
                              color: kColorPrimer,
                              width: screen.sizeScreen(context, 0.09, 0.7),
                              height: screen.sizeScreen(context, 0.02, 0.05),
                              fontSize: screen.sizeScreen(context, 0.025, 0.045));
                        },
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }
}