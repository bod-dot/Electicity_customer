import 'package:customer/helper/screen_size.dart';
import 'package:customer/pages/my_drawer.dart';
import 'package:customer/pages/no_internt.dart';
import 'package:customer/widgets/main_electricity_bill_card.dart';
import 'package:flutter/material.dart';
import '../helper/my_constans.dart';
import '../models/my_reading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/home_cubit/home_cubit.dart';
import '../widgets/body_home_page.dart';



class Homepage extends StatefulWidget {
  const Homepage({super.key});

  static String id = "HomePage";

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Screensize screen = Screensize();
  bool isFirstLook = true;

  List<ReadingsModel> liReading = [];
  int indextofReading = 0;
  bool hasData = true;
  String? customerName;

  String? electronicMeterID;

  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).getDataForHomePage();
    super.initState();
  }

 

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        
        
        return Scaffold(
          
          backgroundColor: kColorPrimer,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kColorPrimer,
            centerTitle: true,
            title: Text(
             "الرئيسية",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: screen.sizeScreen(context, 0.03, 0.05),
                  fontWeight: FontWeight.bold),
            ),
          ),
          endDrawer: MyDrawer(
            many: liReading.isNotEmpty
                ? liReading[liReading.length - 1].getTotalBill()
                : 0,
            readings: liReading,
          ),
         
          body: 
          
                 Column(
                   children: [
                    if(state is HomeSuccess)
                    SizedBox(
                    height: Screensize().sizeScreen(context, 0.898, 0.9),
                    child:const    BodyHomePage(),
                    )
                   else if(state is HomeLoading)
                    SizedBox(
                      
                      height:Screensize().sizeScreen(context, 0.4, 0.5),
           
                    
                      child: const  Center( child: CircularProgressIndicator(),))
                  else if(state is HomeFaluir)
                   Center(child: Text(state.errMessage),)
                   else if(state is HomeNoData)
                   Mainelectricitybillcard(reading: ReadingsModel(totalDuesInThisReading: 0.0, previousReading: 0.0, currentReading: 0.0, date: DateTime.now(), customerTotalDues: 0.0, priceOfKilo: 0, readingID: 0))
                   else if(state is HomeNoInternt)
                           SizedBox(
                            height:Screensize().sizeScreen(context, 0.898, 0.9) ,
                            child: Center(child: NoEnterntScreen(onPressed: (){})))
                   ],
                 ),
        );
      },
    );
  }
}
