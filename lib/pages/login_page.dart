import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:customer/cubit/login/login_cubit.dart';
import 'package:customer/helper/my_constans.dart';
import 'package:customer/pages/home_page.dart';
import 'package:customer/widgets/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/my_snackbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String id = "LoginePage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if(state is LoginSuccess) {
              Navigator.pushNamed(context, Homepage.id,);
            }
            else if(state is LoginFalure)
            {
               Mysnackbar().showSnackbarError(
                    context: context,
                    message:
              state.errMessage,contentType: ContentType.failure,title: 'خطاء');
            }
            else if(state is LoginNOinternt)
            {
                Mysnackbar().showSnackbarError(
                    context: context,
                    message:
              'تحقق من وجود الانترنت',contentType: ContentType.failure,title: 'خطاء');
            }
            else if (state is LoginWrongPasswordAndPhone)
            {
              Mysnackbar().showSnackbarError(
                    context: context,
                    message:
              "كلمة السر او رقم الهاتف خاطئة",contentType: ContentType.failure,title: 'خطاء');
            }


          },
          child:
              const Scaffold(backgroundColor: kColorPrimer,
               body: LoginBody()),
        ),
      ),
    );
  }
}
