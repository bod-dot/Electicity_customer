import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:customer/cubit/payment/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/home_cubit/home_cubit.dart';
import 'my_button.dart';
import 'text_input.dart';

class Mysnackbar {
  void showSnackbarError(
      {required BuildContext context,
      required String title,
      required String message,
      required ContentType contentType}) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: contentType,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void alertForBay({
    required BuildContext context,
    required TextEditingController many,
  }) {
   
    
  }
}
