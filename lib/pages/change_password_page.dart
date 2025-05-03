import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:customer/cubit/change_passwrod/change_password_cubit.dart';
import 'package:customer/widgets/change_passwrod_body.dart';
import 'package:customer/widgets/my_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../helper/my_constans.dart';
import '../helper/screen_size.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  static String id = "changePasswrod";

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  Screensize screen = Screensize();

  @override
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) => ChangePasswordCubit(),
        child: BlocListener<ChangePasswordCubit, ChangePasswordState>(
          listener: (context, state) {
           if(state is ChangePasswordFailur)
           {
            Mysnackbar().showSnackbarError(context: context, title: "خطاء", message: state.errMessage, contentType: ContentType.warning);
           }
           else if(state is ChangePasswordNoInternt)
           {
             Mysnackbar().showSnackbarError(context: context, title: "الانترنت", message: "يرجاء التاكد من الانترنت", contentType: ContentType.failure);
           }
           else if(state is ChangePasswordNoteEqual)
           {
            Mysnackbar().showSnackbarError(context: context, title: "كلمة السر", message:"كلمة السر غير الجديده متطابقة", contentType: ContentType.failure);
           }
           else if(state is ChangePasswordSuccess)
           {
             Mysnackbar().showSnackbarError(context: context, title: " تم بنجاح", message:"تم بغيير كلمة السر بنجاح", contentType: ContentType.success);
           }
           else if(state is ChangePasswordWrongPassword)
           {
            Mysnackbar().showSnackbarError(context: context, title: "كلمة السر", message: "كلمة السر غير صحيحة", contentType: ContentType.failure);
           }
          },
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
                backgroundColor: kColorThreed,
                appBar: AppBar(
                    iconTheme:const  IconThemeData(color: Colors.white),
                  title: Text(
                    "تغيير كلمة السر",
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
                body: const ChangePasswrodBody()),
          ),
        ),
      ),
    );
  }
}
