import 'package:customer/cubit/home_cubit/home_cubit.dart';
import 'package:customer/cubit/simple_bloc_observer.dart';
import 'package:customer/pages/change_password_page.dart';
import 'package:customer/pages/home_page.dart';
import 'package:customer/pages/login_page.dart';
import 'package:customer/pages/my_payment_page.dart';
import 'package:customer/pages/my_report.dart';
import 'package:customer/pages/chat_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 Bloc.observer=MyBlocObserver();
  SharedPreferences shared = await SharedPreferences.getInstance();
  bool check = shared.getInt('customerID') != null;
  runApp(CustomerApp(isLogin: check));
}

class CustomerApp extends StatelessWidget {
  const CustomerApp({super.key, required this.isLogin});

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return     
       BlocProvider(
         create: (context) => HomeCubit(),
         child: MaterialApp(
               debugShowCheckedModeBanner: false,
               routes: {
                 LoginPage.id: (context) => const LoginPage(),
                 Homepage.id: (context) => const Homepage(),
                 Report.id: (context) => const Report(),
                 Chatpage.id: (context) => const Chatpage(),
                 ChangePasswordPage.id: (context) => const ChangePasswordPage(),
                 Paymentpage.id: (context) => Paymentpage()
               },
               initialRoute: isLogin ? Homepage.id : LoginPage.id,
             ),
       );
    
  }
}
