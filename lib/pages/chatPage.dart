import 'dart:async';
import 'package:customer/controllers/Get_All_message.dart';
import 'package:customer/controllers/Send_New_Message.dart';
import 'package:customer/helper/screenSize.dart';
import 'package:customer/models/MeeageModel.dart';
import 'package:customer/widgets/chatBuble.dart';
import 'package:customer/widgets/chatBubleFromFreinds.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helper/Constans.dart';

class Chatpage extends StatefulWidget {
  Chatpage({super.key});

  static String id = 'chatPage';

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  Timer? _timer;
  Screensize screen = Screensize();
  final _controller = ScrollController();
  final GetMessages getMessages = GetMessages();

  TextEditingController message = TextEditingController();
  int? customerID;

  @override
  void initState() {
    super.initState();

    GetID();
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {

    });
  }

  Future<void> GetID() async {
    SharedPreferences share = await SharedPreferences.getInstance();
    customerID = share.getInt('customerID');
    if (customerID != null) {
      getMessages.getMessage(customerID: customerID!);

    }

  }

  @override
  void dispose() {
    getMessages.dispose();
    _timer?.cancel();
    super.dispose();
  }

  List<MessageModel> messages = [];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          shape:const  RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
          toolbarHeight: screen.SizeScreen(context, 0.09, 0.12),
          title: Text(
            "صفحة المراسلة",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screen.SizeScreen(context, 0.03, 0.05)),
          ),
          centerTitle: true,
          backgroundColor: KColorPrimer,
        ),
        body: StreamBuilder(
          stream: getMessages.streamController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
           else if (snapshot.hasData) {
              messages = [];
              for (int i = 1; i < snapshot.data!.length; i++) {
                messages = snapshot.data!;
              }
              messages = messages.reversed.toList();
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        controller: _controller,
                        reverse: true,
                        itemCount: messages.length,
                        itemBuilder: (context, indext) {
                          return messages[indext].EmpID == 0
                              ? Chatbuble(message: messages[indext].Message)
                              : Chatbublefromfreinds(
                                  message: messages[indext].Message);
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      onChanged: (data) {
                        setState(() {});
                      },
                      controller: message,
                      decoration: InputDecoration(
                          hintText: "الرسالة",
                          labelStyle: const TextStyle(color: Colors.black),
                          suffix: message.text.isNotEmpty
                              ? GestureDetector(
                                  onTap: () async {
                                    SendNewMessage().sendMessage(
                                        message: message.text, customerID: 5);
                                    message.clear();
                                    await getMessages.getMessage(customerID: customerID!);
                                    _controller.jumpTo(0);
                                  },
                                  child: const Icon(
                                    Icons.send_outlined,
                                    size: 20,
                                  ))
                              : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: KColorPrimer),
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: screen.SizeScreen(context, 0.01, 0.02),
                  )
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
