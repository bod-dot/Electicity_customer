import 'package:customer/controllers/ChangePassword.dart';
import 'package:customer/widgets/MySnackBar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/Constans.dart';
import '../helper/screenSize.dart';
import '../widgets/MyButton.dart';
import '../widgets/MyIcon.dart';
import '../widgets/TextInput.dart';
import 'LoginPage.dart';

class ChangePasswordPage extends StatefulWidget {
  ChangePasswordPage({super.key});

  static String id = "changePasswrod";

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  Screensize screen = Screensize();
  int? CustomerID;

  @override
  void initState() {
    GetCustometID();
    super.initState();
  }

  void GetCustometID() async {
    SharedPreferences share = await SharedPreferences.getInstance();
    CustomerID = share.getInt('customerID');
  }
  Mysnackbar mysnackbar = Mysnackbar();
  final TextEditingController oldPassword = TextEditingController();

  final TextEditingController newPassword = TextEditingController();

  final TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: KColorThreed,
        appBar: AppBar(
          title: Text(
            "تغيير كلمة السر",
            style: TextStyle(
              fontSize: screen.SizeScreen(context, 0.03, 0.05),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          toolbarHeight: screen.SizeScreen(context, 0.10, 0.2),
          backgroundColor: KColorPrimer,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          elevation: 5,
        ),
        body: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(

          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Myicon(
                        HeigthContainer: screen.SizeScreen(context, 0.19, 0.5),
                        WidthContainer: screen.SizeScreen(context, 0.19, 0.45),
                        icon: Icon(Icons.lock_outline),
                        color: KColorPrimer,
                        size: screen.SizeScreen(context, 0.15, 0.3)),
                    const SizedBox(height: 20),
                    MyTextinput(
                      isPasswrod: true,
                      colorInFocuse: Colors.white,
                      text: "كلمة السر القديمة",
                      Texticon: const Icon(Icons.lock_open_outlined,
                          color: KColorwhite),
                      obscureText: true,
                      controller: oldPassword,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    MyTextinput(
                      isPasswrod: true,
                      colorInFocuse: Colors.white,
                      text: "كلمة السر الجديدة",
                      Texticon:
                          const Icon(Icons.edit_outlined, color: KColorwhite),
                      obscureText: true,
                      controller: newPassword,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    MyTextinput(
                      isPasswrod: true,
                      colorInFocuse: Colors.white,
                      text: "تأكيد كلمة السر",
                      Texticon: const Icon(Icons.check_circle_outline,
                          color: KColorwhite),
                      obscureText: true,
                      controller: confirmPassword,
                    ),
                    const SizedBox(height: 20),
                    Mybutton(
                        text: "تغيير كلمة السر",
                        action: () async {
                          if (newPassword.text == confirmPassword.text) {
                            if (await Changepassword().ChangePasswordMeth(
                                CustomerID: CustomerID!,
                                OldPassword: oldPassword.text,
                                NewPassword: newPassword.text)) {

                              oldPassword.text='';
                              newPassword.text='';
                              confirmPassword.text='';
                             mysnackbar.showSnackbarSuccess(context: context, Message: 'تم تغيير كلمة السر بنجاح');

                            }
                            else
                              {
                                mysnackbar.showSnackbarError(context: context, Message: 'كلمة السر خاضئه');
                              }
                          }
                          else
                            {
                              mysnackbar.showSnackbarError(context: context, Message: 'كلمة السر الجديده غير متطابقة  ');
                            }
                        },
                        color: KColorPrimer,
                        width: screen.SizeScreen(context, 0.09, 0.7),
                        height: screen.SizeScreen(context, 0.02, 0.05),
                        fontSize: screen.SizeScreen(context, 0.025, 0.045)),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
