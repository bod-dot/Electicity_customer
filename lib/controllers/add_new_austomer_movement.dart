

import 'package:customer/helper/my_api.dart';
import 'package:customer/helper/my_constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddNewAustomerMovement
{
  Future<bool>   addNewCustomerMovment({required String many, required int  manyAfterpay, })
 async {
  SharedPreferences shared = await SharedPreferences.getInstance();
  int customerID = shared.getInt('customerID')!;
  int electronicMeterID = shared.getInt('ElectronicMeterID')!;


    dynamic data = await Api().post(url: "${urlAll}Add_New_CustomerMovement.php", body: {
    'CustomerMovementOaiedAmount':many,
'TotalDuesAfterPaying':manyAfterpay.toString(),
'CustomerMovementNote':'تم الدفع الالكترونيا',
'CustomerID':customerID.toString(),
'ElectronicMeterID':electronicMeterID.toString()
    });
          
  if(data['Message']=="  تم التاثير في الصفوف")
  {
    return true;
  }
  return false;
  }
}