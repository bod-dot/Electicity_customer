import 'package:customer/controllers/Get_All_Payments.dart';
import 'package:customer/controllers/Get_All_Readings.dart';
import 'package:customer/helper/screenSize.dart';

import 'package:customer/models/Reading.dart';
import 'package:customer/pages/Drawer.dart';
import 'package:customer/pages/PaymentPage.dart';
import 'package:customer/pages/Report.dart';

import 'package:customer/widgets/ElectricityBillCards.dart';
import 'package:customer/widgets/MainElectricityBillCard.dart';
import 'package:customer/widgets/MyTextOut.dart';
import 'package:customer/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helper/Constans.dart';
import '../widgets/MyListTile.dart';
import '../widgets/TotleWidget.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  static String id = "HomePage";

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Screensize screen = Screensize();
  bool isFirstLook = true;

  List<ReadingsModel> LiReading = [];
  int indextofReading = 0;
  bool hasData = true;
  String? CustomerName;

  String? ElectronicMeterID;

  @override
  void initState() {
    // TODO: implement initState

    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    SharedPreferences share = await SharedPreferences.getInstance();

    CustomerName = share.getString('CustomerName');
    ElectronicMeterID = share.getInt('ElectronicMeterID').toString();

    LiReading = await GetAllReadings()
        .getReading(ElectronicMeterID: ElectronicMeterID.toString());
    GetAllPayments().GetPayments(CustomerID: 5);

    indextofReading = LiReading.length - 1;

    setState(() {
      hasData = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColorPrimer,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: KColorPrimer,
        centerTitle: true,
        title: Text(
          CustomerName ?? "",
          style: TextStyle(
              color: Colors.white,
              fontSize: screen.SizeScreen(context, 0.03, 0.05),
              fontWeight: FontWeight.bold),
        ),
      ),
      endDrawer: MyDrawer(
        many: LiReading.isNotEmpty
            ? LiReading[LiReading.length - 1].GetTotalBill()
            : 0,
        Readings: LiReading,
      ),
      body: hasData
          ? RefreshIndicator(
              onRefresh: () async {
                LiReading = await GetAllReadings().getReading(
                    ElectronicMeterID: ElectronicMeterID.toString());

                indextofReading = LiReading.length - 1;
                isFirstLook = true;
                await Future.delayed(const Duration(seconds: 1));
                setState(() {
                  hasData = true;
                });
              },
              child: ListView(
                children: [
                  Container(
                    height: screen.SizeScreen(context, 0.5, 1),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50))),
                    child: isFirstLook
                        ? Totlewidget(
                            onTop: () {
                              Navigator.pushNamed(context, Paymentpage.Id,
                                  arguments: LiReading[LiReading.length - 1]
                                      .CustomerTotalDues);
                            },
                            Totile: LiReading.isNotEmpty
                                ? LiReading[indextofReading].CustomerTotalDues
                                : 0.0)
                        : Mainelectricitybillcard(
                            onTop: () {
                              Navigator.pushNamed(context, Paymentpage.Id,
                                  arguments: LiReading[LiReading.length - 1]
                                      .CustomerTotalDues);
                            },
                            checkIsListOn:
                                indextofReading == LiReading.length - 1,
                            Reading: LiReading[indextofReading],
                          ),
                  ),
                  LiReading.isNotEmpty
                      ? Container(
                          //   height: screen.SizeScreen(context, 1, 1),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(100)),
                                  color: Colors.white,
                                ),
                                height: 220,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      child: Row(
                                        children: [
                                          MytextLable(
                                            value: "كل القراءات",
                                            style: TextStyle(
                                                color: KColorPrimer,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Spacer(),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, Report.Id,
                                                  arguments: LiReading);
                                            },
                                            child: Row(
                                              children: [
                                                MytextLable(
                                                  value: "لتفاصيل اكثر  ",
                                                  style: TextStyle(
                                                      color: KColorPrimer,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Icon(
                                                    Icons
                                                        .arrow_forward_outlined,
                                                    color: KColorPrimer),
                                                SizedBox(width: 30),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 15),
                                        child: ListView.builder(
                                          //reverse: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: LiReading.length>6?6:LiReading.length,
                                          itemBuilder: (context, index) {
                                            int reversedIndex =
                                                LiReading.length - 1 - index;

                                            return InkWell(
                                              onTap: () {
                                                setState(() {
                                                  indextofReading = reversedIndex;
                                                  isFirstLook = false;
                                                });
                                              },
                                              child: Electricitybillcard(
                                                History:
                                                    "${LiReading[reversedIndex].Date}",
                                                Consumption:
                                                    LiReading[reversedIndex]
                                                        .GetUsageKilo(),
                                                money: (LiReading[reversedIndex]
                                                            .CurrentReading -
                                                        LiReading[reversedIndex]
                                                            .PreviousReading) *
                                                    LiReading[reversedIndex]
                                                        .PriceOfKilo,
                                              ),
                                            );
                                          },
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
                                const    Divider(
                                      color: KColorPrimer,
                                      thickness: 2,
                                      indent: 40,
                                      endIndent: 40,
                                      height: 30,
                                    ),
                                    Chart(
                                      reads: LiReading,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      : SizedBox.shrink()
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
