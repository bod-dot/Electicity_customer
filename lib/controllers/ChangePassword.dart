import 'package:customer/helper/API.dart';
import 'package:customer/helper/Constans.dart';

class Changepassword {
  Future<bool> ChangePasswordMeth(
      {required int CustomerID,
      required String OldPassword,
      required String NewPassword})
  async {
    
    dynamic data = await Api().post(Url: '${UrlAll}ChangePassword.php', body: {
      'customerID':CustomerID.toString(),
      'OldPassword':OldPassword,
      'NewPassword':NewPassword
    });

  return  data['message']=='Success';

    
    }
}
