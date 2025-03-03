import 'package:customer/helper/Constans.dart';
import 'package:customer/helper/screenSize.dart';
import 'package:customer/models/Reading.dart';
import 'package:customer/pages/ChangePasswordPage.dart';
import 'package:customer/pages/LoginPage.dart';
import 'package:customer/pages/PaymentPage.dart';
import 'package:customer/pages/Report.dart';
import 'package:customer/pages/chatPage.dart';
import 'package:customer/widgets/MyListTile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MyDrawer extends StatefulWidget {
   MyDrawer({super.key,required this.many,required this.Readings});
    double? many;
    final List<ReadingsModel>Readings;

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Screensize screen = Screensize();
  String? CustomerName;

  String? ElectronicMeterID;

@override
  void initState() {
    // TODO: implement initState
  GetData();
    super.initState();

  }
  void GetData()async
  {
    SharedPreferences share = await SharedPreferences.getInstance();
    CustomerName=share.getString('CustomerName');
    ElectronicMeterID=share.getInt('ElectronicMeterID').toString();
    setState(() {

    });

  }
  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Drawer(
        backgroundColor: Colors.grey[300],
        child: SingleChildScrollView(
          child: Container(
            height:screen.SizeScreen(context, 1,1.8 ) ,
            child: Column(

              children: [
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: KColorPrimer,
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          KImage,
                          width: 100,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(CustomerName??"",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        " رقم العاداد : ${ElectronicMeterID ??""}",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                MyListTile(
                  action: () {
                    Navigator.pushNamed(context, Report.Id,arguments: widget.Readings);
                  },
                  text: "التقارير",
                  icon: Icon(Icons.bar_chart),
                  fontSize: 17,
                  circular: 15,
                  iconColor: KColorPrimer,
                  shadowColor: Colors.black,
                  textColor: KColorPrimer,
                ),

                MyListTile(
                  action: ()
                  {Navigator.pushNamed(context, Paymentpage.Id,arguments: widget.many);},
                  text: " ادفع الان ",
                  icon: Icon(Icons.payments_outlined),
                  fontSize: 17,
                  circular: 15,
                  iconColor: KColorPrimer,
                  shadowColor: Colors.black,
                  textColor: KColorPrimer,
                ),
                MyListTile(
                  action: ()
                  {
                    Navigator.pushNamed(context, ChangePasswordPage.id);
                  },
                  text: "تغيير كلمة المرور",
                  icon: Icon(Icons.lock_open_outlined),
                  fontSize: 17,
                  circular: 15,
                  iconColor: KColorPrimer,
                  shadowColor: Colors.black,
                  textColor: KColorPrimer,
                ),
                MyListTile(
                  action: () {
                    Navigator.pushNamed(context, Chatpage.id,);
                  },
                  text: "الشكاوي",
                  icon: Icon(Icons.chat),
                  fontSize: 17,
                  circular: 15,
                  iconColor: KColorPrimer,
                  shadowColor: Colors.black,
                  textColor: KColorPrimer,
                ),
                MyListTile(
                  action: ()=>launchUrlString('tel://775100552'),

                  text: "اتصل بنا",
                  icon: Icon(Icons.phone_outlined),
                  fontSize: 17,
                  circular: 15,
                  iconColor: KColorPrimer,
                  shadowColor: Colors.black,
                  textColor: KColorPrimer,
                ),
                Spacer(),
                Divider(color: Colors.black54, indent: 30, endIndent: 30),
                MyListTile(
                  action: ()
                  async {
                    SharedPreferences share = await SharedPreferences.getInstance();
                    share.remove('CustomerName');
                    share.remove('ElectronicMeterID');
                    share.remove('customerID');

                    Navigator.pushReplacementNamed(context, LoginPage.id);
                  },
                  text: "تسجيل الخروج",
                  icon: Icon(Icons.exit_to_app),
                  fontSize: 17,
                  circular: 15,
                  iconColor: Colors.red,
                  shadowColor: Colors.black,
                  textColor: Colors.red,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
