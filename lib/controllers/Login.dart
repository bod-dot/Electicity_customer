
import 'package:customer/helper/my_constans.dart';

import '../helper/my_api.dart';

class Login
{
  Future<dynamic> loginMeth({required String phone,required String password})
 async {
    dynamic data = await Api().post(url: "${urlAll}Login_Customer.php", body: {
      'phone':phone,
      'password':password
    });
    return data;
  }
}