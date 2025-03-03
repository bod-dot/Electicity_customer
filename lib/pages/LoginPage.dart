import 'package:customer/controllers/Login.dart';
import 'package:customer/helper/Constans.dart';
import 'package:customer/helper/screenSize.dart';
import 'package:customer/models/CustomerInfo.dart';
import 'package:customer/widgets/MyButton.dart';
import 'package:customer/widgets/MySnackBar.dart';
import 'package:customer/widgets/MyTextOut.dart';
import 'package:customer/widgets/TextInput.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  static String id = "LoginePage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Screensize screen = Screensize();

  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
GlobalKey<FormState> formKey =GlobalKey();
  @override
  Widget build(BuildContext context) {
    final ScreenHeight = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: KColorPrimer,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 100),
                    child: ClipOval(
                      child: Image.asset(
                        KImage,
                        width: 150,
                        height: 220,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  MytextLable(value: "مرحبا بك في محطة لتوليد الكهرباء"),
                  Container(
                      width: double.infinity,
                      height: screen.SizeScreen(context, 0.5, 0.8),
                      margin: EdgeInsets.only(top: ScreenHeight * 0.12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40)),
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text(
                              "تسجيل الدخول",
                              style: TextStyle(
                                  color: KColorBlack,
                                  fontSize:
                                      screen.SizeScreen(context, 0.03, 0.05),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: screen.SizeScreen(context, 0.05, 0.05),
                            ),
                            MyTextinput(
    typeText: TextInputType.number,
                              controller: phone,

                              text: "رقم الهاتف",
                              Texticon: Icon(
                                Icons.phone_android_outlined,
                                color: KColorPrimer,
                              ),
                              obscureText: false,
                            ),
                            SizedBox(
                              height: screen.SizeScreen(context, 0.02, 0.05),
                            ),
                            MyTextinput(
                              isPasswrod: true,
                              controller: password,
                              text: "كلمة السر",
                              Texticon: Icon(
                                Icons.lock_open_rounded,
                                color: KColorPrimer,
                              ),
                              obscureText: true,
                            ),
                            SizedBox(
                              height: screen.SizeScreen(context, 0.05, 0.05),
                            ),
                            Mybutton(
                              text: "تسجيل الدخول",
                              action: () async {

                                if (formKey.currentState!.validate()) {
                                  dynamic data = await Login().LoginMeth(
                                      phone: phone.text, password: password.text);
                                  if (data['message'] == 'No data found') {
                                    Mysnackbar().showSnackbarError(
                                        context: context,
                                        Message:
                                            'رقم الهاتف او كلمة السر  غير صحيحة ');
                                  } else {
                                    SharedPreferences share =
                                        await SharedPreferences.getInstance();
                                    share.setInt('customerID', data['CustomerID']);
                                    share.setString('CustomerName',
                                        data['CustomerName'].toString());
                                    share.setInt('ElectronicMeterID',
                                        data['ElectronicMeterID']);
                                  
                                    Navigator.pushReplacementNamed(
                                        context, Homepage.id);
                                  }
                                }
                              },
                              color: KColorPrimer,
                              width: screen.SizeScreen(context, 0.14, 0.3),
                              height: screen.SizeScreen(context, 0.02, 0.04),
                              fontSize: screen.SizeScreen(context, 0.02, 0.05),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
