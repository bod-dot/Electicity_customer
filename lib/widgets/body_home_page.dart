import 'package:customer/helper/screen_size.dart';
import 'package:customer/models/my_payment.dart';
import 'package:flutter/material.dart';
import 'package:customer/pages/my_payment_page.dart';
import 'package:customer/pages/my_report.dart';

import 'package:customer/widgets/electricity_bill_cards.dart';
import 'package:customer/widgets/main_electricity_bill_card.dart';
import 'package:customer/widgets/my_text_out.dart';
import 'package:customer/widgets/chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/home_cubit/home_cubit.dart';
import '../helper/my_constans.dart';
import '../models/my_reading.dart';

class BodyHomePage extends StatefulWidget {
  const BodyHomePage({super.key});

  @override
  State<BodyHomePage> createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<BodyHomePage> {
    List<ReadingsModel> liReading = [];
    int indextofReading = 0;
    double? many;

    @override
  void initState() {
   liReading= BlocProvider.of<HomeCubit>(context).liReading;
  
   
   indextofReading = liReading.length - 1;
   many=null;

  getmanyData();
    super.initState();
  }

  void getmanyData()
  {
     List<PaymentModel>liPayment=BlocProvider.of<HomeCubit>(context).liPayment;
  final DateTime targetDate = liReading.last.date;
  final List<double> paidAmounts = liPayment
  .where((e) =>
    e.date.isAfter(targetDate) ||
    e.date.isAtSameMomentAs(targetDate)
  )
  .map((e) => e.customerMovementPaiedAmount)
  .toList();
  paidAmounts.isNotEmpty?many=0:null;
  for(int i=0;i<paidAmounts.length;i++)
  {
    
    many= many!+ paidAmounts[i];
  }


   BlocProvider.of<HomeCubit>(context).many= many == null ?liReading[liReading.length - 1]
  .getTotalBill(isListOne: true).toString():(liReading[liReading.length - 1].customerTotalDues.toString());
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
                  onRefresh: () async {
                    BlocProvider.of<HomeCubit>(context).getDataForHomePage();

                  
                    await Future.delayed(const Duration(seconds: 1));
                   
                  },
                  child: ListView(
                    children: [
                      Container(
                        height: Screensize().sizeScreen(context, 0.7, 1),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(50))),
                        child:  Mainelectricitybillcard(
                        many: many,
                                onTop: () {
                                  Navigator.pushNamed(context, Paymentpage.id,
                                      arguments: liReading[liReading.length - 1]
                                          .getTotalBill(isListOne:indextofReading == liReading.length - 1 ));
                                },
                                checkIsListOn:
                                    indextofReading == liReading.length - 1,
                                reading: liReading[indextofReading],
                              ),
                      ),
                     
                           SizedBox(
                                // height: 100,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(100)),
                                      color: Colors.white,
                                    ),
                                    height: 230,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 8),
                                          child: Row(
                                            children: [
                                              const MytextLable(
                                                value: "اخر القراءات",
                                                style: TextStyle(
                                                    color: kColorPrimer,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const Spacer(),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                      context, Report.id,
                                                      arguments: liReading);
                                                },
                                                child: const Row(
                                                  children: [
                                                    MytextLable(
                                                      value: "لتفاصيل اكثر  ",
                                                      style: TextStyle(
                                                          color: kColorPrimer,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    Icon(
                                                        Icons
                                                            .arrow_forward_outlined,
                                                        color: kColorPrimer),
                                                    SizedBox(width: 30),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 185,
                                      //    width: double.infinity,
                                          child: Expanded(
                                            
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15),
                                              child: ListView.builder(
                                                //reverse: true,
                                                scrollDirection: Axis.horizontal,
                                                itemCount: liReading.length > 6
                                                    ? 6
                                                    : liReading.length,
                                                itemBuilder: (context, index) {
                                                  int reversedIndex =
                                                      liReading.length -
                                                          1 -
                                                          index;
                                          
                                                  return InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        indextofReading =
                                                            reversedIndex;
                                                     
                                                      });
                                                    },
                                                    child: Expanded(
                                                      child: Electricitybillcard(
                                                        history:
                                                            "${liReading[reversedIndex].date.day}/${liReading[reversedIndex].date.month}/${liReading[reversedIndex].date.year}",
                                                        consumption:
                                                            liReading[reversedIndex]
                                                                .getUsageKilo(),
                                                        money: (liReading[
                                                                        reversedIndex]
                                                                    .currentReading -
                                                                liReading[
                                                                        reversedIndex]
                                                                    .previousReading) *
                                                            liReading[reversedIndex]
                                                                .priceOfKilo,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        
                                      ],
                                    ),
                                  ),
                                
                                  Container(
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        const Divider(
                                          color: kColorPrimer,
                                          thickness: 2,
                                          indent: 40,
                                          endIndent: 40,
                                          height: 30,
                                        ),
                                       const  Padding(
                                          padding:  EdgeInsets.all(8.0),
                                          child: Text('استهلاك الطاقة لكل شهر',style: TextStyle(color: kColorSecond,fontSize: 18),),
                                        ),
                                        Chart(
                                          reads: liReading,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                         
                    ],
                  ),
                );
  }
}