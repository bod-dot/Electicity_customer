import 'package:customer/helper/API.dart';
import 'package:customer/helper/Constans.dart';

class Login
{
  Future<dynamic> LoginMeth({required String phone,required String password})
 async {
    dynamic data = await Api().post(Url: "${UrlAll}Login_Customer.php", body: {
      'phone':phone,
      'password':password
    });
    return data;
  }
}