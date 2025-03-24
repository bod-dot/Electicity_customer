


import 'package:customer/helper/my_constans.dart';

import '../helper/my_api.dart';

class Changepassword {
  Future<bool> changePasswordMeth(
      {required int customerID,
      required String oldPassword,
      required String newPassword})
  async {
    
    dynamic data = await Api().post(url: '${urlAll}ChangePassword.php', body: {
      'customerID':customerID.toString(),
      'OldPassword':oldPassword,
      'NewPassword':newPassword
    });

  return  data['message']=='Success';

    
    }
}
