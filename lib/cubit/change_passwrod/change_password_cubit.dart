
import 'package:bloc/bloc.dart';
import 'package:customer/helper/my_api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/change_password.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  void changePassword({required TextEditingController newPassword ,required TextEditingController confirmPassword,required TextEditingController oldPassword,})
 async {
  emit(ChangePasswordLoading());
  bool checkInternet = await Api().checkInternet();
  if(checkInternet)
  {
getData(newPassword: newPassword, confirmPassword: confirmPassword, oldPassword: oldPassword);
  }
  else
  {
    emit(ChangePasswordNoInternt());
  }
   
}

void getData({required TextEditingController newPassword ,required TextEditingController confirmPassword,required TextEditingController oldPassword,})
async{
  try{
   SharedPreferences share = await SharedPreferences.getInstance();
    int customerID = share.getInt('customerID')!;


     if (newPassword.text == confirmPassword.text) {

    if (await Changepassword().changePasswordMeth(
        customerID: customerID,
        oldPassword: oldPassword.text,
        newPassword: newPassword.text)) {
        newPassword.text='';
        confirmPassword.text='';
        oldPassword.text='';
          emit(ChangePasswordSuccess());

    }
    else
    {
      emit(ChangePasswordWrongPassword());
    }
    
  }
  else
  {
    emit(ChangePasswordNoteEqual());
  }

  }catch(e)
  {
    emit(ChangePasswordFailur(errMessage: e.toString()));
  }
}
}

