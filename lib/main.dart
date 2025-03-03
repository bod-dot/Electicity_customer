import 'package:customer/pages/ChangePasswordPage.dart';
import 'package:customer/pages/HomePage.dart';
import 'package:customer/pages/LoginPage.dart';
import 'package:customer/pages/PaymentPage.dart';
import 'package:customer/pages/Report.dart';
import 'package:customer/pages/chatPage.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences shared = await SharedPreferences.getInstance();
bool check=shared.getInt('customerID')!=null;
  runApp(CustomerApp(isLogin:check ));
}

class CustomerApp extends StatelessWidget {
  CustomerApp({super.key, required this.isLogin});

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPage.id: (context) => LoginPage(),
        Homepage.id: (context) => Homepage(),
        Report.Id: (context) => Report(),
        Chatpage.id: (context) => Chatpage(),
        ChangePasswordPage.id: (context) => ChangePasswordPage(),
        Paymentpage.Id: (context) => Paymentpage()
      },
      initialRoute: isLogin?Homepage.id:LoginPage.id,
    );
  }
}
