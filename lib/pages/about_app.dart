import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../helper/my_constans.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {

  @override
 
  void initState() {
    // TODO: implement initState
    super.initState();
     SystemChrome.setSystemUIOverlayStyle(
      const   SystemUiOverlayStyle(
          statusBarColor: Colors.black, // اللون المطلوب
          statusBarIconBrightness: Brightness.light, // لون الأيقونات (فاتح/داكن)
          systemNavigationBarColor: Colors.white, // لون شريط التنقل (اختياري)
        ),
      );
  }
   @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                    gradient:const LinearGradient(
                      colors: [kColorSecond, kColorPrimer],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                    const  Icon(Icons.bolt, color: kColorFoured, size: 30),
                      const SizedBox(width: 15),
                      Text(
                        'فاتورتي',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 2,
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(1, 1),
                            ),
                         
                          ],
                        ),
                        
                      ),
                     const  Spacer(),
                         Directionality(
                          textDirection: TextDirection.ltr,
                          child: IconButton(onPressed: (){
                            Navigator.pop(context);
                          }, icon:const  Icon(Icons.arrow_back,color: Colors.white,)))
                    ],
                  ),
                ),
      
                const SizedBox(height: 30),
      
                // About Content
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: kColorFoured, width: 1.5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     const Text(
                        'عن التطبيق',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: kColorPrimer,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 15),
                      RichText(
                        textAlign: TextAlign.right,
                        text:const TextSpan(
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            height: 1.6,
                          ),
                          children: [
                            TextSpan(
                              text: 'تطبيق "فاتورتي" يُعد بوابتك الذكية لإدارة استهلاك الطاقة الكهربائية بشكل فعّال وآمن.\n\n',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: kColorPrimer,
                                fontSize: 17,
                              ),
                            ),
                            TextSpan(
                              text: 'المميزات الرئيسية:\n',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kColorSecond,
                              ),
                            ),
                            WidgetSpan(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                FeatureText(text: 'متابعة  لاستهلاك الكهرباء'),
                                FeatureText(text: 'إشعارات تنبيهية  بالفواتير'),
                                FeatureText(text: 'دفع إلكتروني آمن وميسر'),
                                FeatureText(text: 'أرشيف منظم لقراءات العداد'),
                                FeatureText(text: 'توثيق مرئي لقراءات العدادات'),
                              ],
                            )),
                             TextSpan(text: '\n'),
                            TextSpan(
                              text: 'نسعى لتمكين المستخدمين من خلال:\n',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kColorSecond,
                              ),
                            ),
                            WidgetSpan(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                FeatureText(text: 'واجهة بسيطة تلائم جميع الفئات'),
                                FeatureText(text: 'بيانات دقيقة وشفافة'),
                                FeatureText(text: 'تحديثات آنية'),
                                FeatureText(text: 'حماية المعلومات الشخصية'),
                              ],
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
      
                const SizedBox(height: 25),
      
                // Features Grid
               const  Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  alignment: WrapAlignment.center,
                  children:  [
                    FeatureCard(
                      
                      icon: Icons.bolt,
                      title: 'متابعة الاستهلاك',
                      subtitle: 'مراقبة  لاستهلاك الكهرباء',
                    ),
                    FeatureCard(
                      icon: Icons.notifications_active,
                      title: 'التنبيهات',
                      subtitle: 'إشعارات  بالفواتير',
                    ),
                    FeatureCard(
                      icon: Icons.payment,
                      title: 'دفع إلكتروني',
                      subtitle: 'سداد آمن عبر منصة بنك الكريمي',
                    ),
                    FeatureCard(
                      icon: Icons.history,
                      title: 'سجل القراءات',
                      subtitle: 'أرشيف منظم للقراءات السابقة',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FeatureText extends StatelessWidget {
  final String text;

  const FeatureText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      '• $text',
      style: TextStyle(
        color: Colors.grey[800],
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.right,
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        width: 170,height: 150,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: kColorFoured.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: kColorFoured.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(icon, size: 30, color: kColorPrimer),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.right,
              style:const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: kColorSecond,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
