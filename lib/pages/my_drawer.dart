import 'package:customer/cubit/home_cubit/home_cubit.dart';
import 'package:customer/helper/my_constans.dart';
import 'package:customer/helper/screen_size.dart';
import 'package:customer/models/my_reading.dart';
import 'package:customer/pages/about_app.dart';
import 'package:customer/pages/change_password_page.dart';
import 'package:customer/pages/login_page.dart';
import 'package:customer/pages/my_payment_page.dart';
import 'package:customer/pages/my_report.dart';
import 'package:customer/pages/chat_page.dart';
import 'package:customer/widgets/my_listtile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key, required this.readings, required this.customerID});
  
  final List<ReadingsModel> readings;
  final int  customerID ;

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Screensize screen = Screensize();
  String? customerName;

  String? electronicMeterID;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    SharedPreferences share = await SharedPreferences.getInstance();
    customerName = share.getString('CustomerName');
    electronicMeterID = share.getInt('ElectronicMeterID').toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Drawer(
            backgroundColor: Colors.grey[300],
            child: SingleChildScrollView(
              child: SizedBox(
                height: screen.sizeScreen(context, 1, 1.8),
                child: Column(
                  children: [
                    Container(
                      height: 220,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: kColorPrimer,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(30)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              kImage,
                              width: 100,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            customerName ?? "",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            " رقم العاداد : ${electronicMeterID ?? ""}",
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    if((state is HomeSuccess || state is HomeNoData))
                    Column(
                      children: [
                        MyListTile(
                          action: () {
                            Navigator.pushNamed(context, Report.id,
                                arguments: widget.readings);
                          },
                          text: "التقارير",
                          icon: const Icon(Icons.bar_chart),
                          fontSize: 17,
                          circular: 15,
                          iconColor: kColorPrimer,
                          shadowColor: Colors.black,
                          textColor: kColorPrimer,
                        ),
                        MyListTile(
                          action: () {
                            Navigator.pushNamed(context, Paymentpage.id);
                          },
                          text: " ادفع الان ",
                          icon: const Icon(Icons.payments_outlined),
                          fontSize: 17,
                          circular: 15,
                          iconColor: kColorPrimer,
                          shadowColor: Colors.black,
                          textColor: kColorPrimer,
                        ),
                        MyListTile(
                          action: () {
                            Navigator.pushNamed(context, ChangePasswordPage.id);
                          },
                          text: "تغيير كلمة المرور",
                          icon: const Icon(Icons.lock_open_outlined),
                          fontSize: 17,
                          circular: 15,
                          iconColor: kColorPrimer,
                          shadowColor: Colors.black,
                          textColor: kColorPrimer,
                        ),
                        MyListTile(
                          action: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Chatpage(customerID: widget.customerID)
                          
                            ));
                          },
                          text: "الشكاوي",
                          icon: const Icon(Icons.chat),
                          fontSize: 17,
                          circular: 15,
                          iconColor: kColorPrimer,
                          shadowColor: Colors.black,
                          textColor: kColorPrimer,
                        ),
                      ],
                    ),
                    MyListTile(
                      action: () => launchUrlString('tel://775100552'),
                      text: "اتصل بنا",
                      icon: const Icon(Icons.phone_outlined),
                      fontSize: 17,
                      circular: 15,
                      iconColor: kColorPrimer,
                      shadowColor: Colors.black,
                      textColor: kColorPrimer,
                    ),

                       MyListTile(
                      action: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const AboutScreen()));
                      },
                      text: " عن التطبيق",
                      icon: const Icon(Icons.info),
                      fontSize: 17,
                      circular: 15,
                      iconColor: kColorPrimer,
                      shadowColor: Colors.black,
                      textColor: kColorPrimer,
                    ),
                    const Spacer(),
                    const Divider(
                        color: Colors.black54, indent: 30, endIndent: 30),
                    MyListTile(
                      action: () async {
                        SharedPreferences share =
                            await SharedPreferences.getInstance();
                        share.remove('CustomerName');
                        share.remove('ElectronicMeterID');
                        share.remove('customerID');
                    
                        Navigator.pushReplacementNamed(context, LoginPage.id);
                      },
                      text: "تسجيل الخروج",
                      icon: const Icon(Icons.exit_to_app),
                      fontSize: 17,
                      circular: 15,
                      iconColor: Colors.red,
                      shadowColor: Colors.black,
                      textColor: Colors.red,
                      

                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
