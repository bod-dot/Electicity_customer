import 'package:bloc/bloc.dart';
import 'package:customer/helper/my_api.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/login.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login({required String phone,required String password})
 async {
  emit(LoginLoading());

  bool checkInternet = await Api().checkInternet(); 
  if(checkInternet){
   getData(phone: phone, password: password);
                                
  }
  else
  {
    emit(LoginNOinternt());
  }
 }

 void getData({required String phone,required String password})
 async{
  dynamic data = await Login().loginMeth(
      phone: phone, password: password);
  try
  {


  if (data['message'] == 'No data found') {
    emit(LoginWrongPasswordAndPhone());
     
  } else {
    SharedPreferences share =
        await SharedPreferences.getInstance();
    share.setInt('customerID', data['CustomerID']);
    share.setString('CustomerName',
        data['CustomerName'].toString());
    share.setInt('ElectronicMeterID',
        data['ElectronicMeterID']);
        emit(LoginSuccess());
  }
  

  } catch(e)
  {
    emit(LoginFalure(errMessage: e.toString()));
  }
 }
}
