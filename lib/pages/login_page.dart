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
          if (state is LoginSuccess) {
 
          Mysnackbar().showSnackbarError(
            context: context,
            title: 'نجاح',
            message: 'تم تسجيل الدخول بنجاح',
            contentType: ContentType.success,  
          );
          Navigator.pushNamed(context, Homepage.id);
        }
        else if (state is LoginFalure) {
          Mysnackbar().showSnackbarError(
            context: context,
            title: 'خطأ',
            message: state.errMessage,
            contentType: ContentType.failure,  
          );
        }
        else if (state is LoginNOinternt) {
   
          Mysnackbar().showSnackbarError(
            context: context,
            title: 'انقطاع اتصال',
            message: 'يرجى التحقق من اتصال الإنترنت ثم المحاولة مجددًا',
            contentType: ContentType.failure,  
          );
        }
        else if (state is LoginWrongPasswordAndPhone) {
        
          Mysnackbar().showSnackbarError(
            context: context,
            title: 'بيانات غير صحيحة',
            message: 'رقم الهاتف أو كلمة المرور غير صحيحة',
            contentType: ContentType.failure,    
          );
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
