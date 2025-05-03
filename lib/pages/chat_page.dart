import 'dart:async';
import 'package:customer/controllers/get_all_message.dart';
import 'package:customer/controllers/send_new_message.dart';
import 'package:customer/helper/screen_size.dart';
import 'package:customer/models/meeage_model.dart';
import 'package:customer/widgets/chat_buble.dart';
import 'package:customer/widgets/chat_buble_from_freinds.dart';
import 'package:flutter/material.dart';

import '../helper/my_constans.dart';

class Chatpage extends StatefulWidget {
const   Chatpage({super.key, required this.customerID});
final int customerID;

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
 

  @override
  void initState() {
    super.initState();

    getID();
    _timer = Timer.periodic(const  Duration(seconds: 1), (timer) {
 getMessages.getMessage(customerID: widget.customerID);
    });
  }

  Future<void> getID() async {
   // SharedPreferences share = await SharedPreferences.getInstance();
   
    
      getMessages.getMessage(customerID: widget.customerID);

    

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
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
            iconTheme:const  IconThemeData(color: Colors.white),
          shape:const  RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
          toolbarHeight: screen.sizeScreen(context, 0.09, 0.12),
          title: Text(
            "صفحة المراسلة",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screen.sizeScreen(context, 0.03, 0.05),
                color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: kColorPrimer,
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
                          return messages[indext].empID == 0
                              ? Chatbuble(message: messages[indext].message)
                              : Chatbublefromfreinds(
                                  message: messages[indext].message);
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
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
                                      await getMessages.getMessage(customerID: widget.customerID!);
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
                              borderSide: const BorderSide(color: kColorPrimer),
                              borderRadius: BorderRadius.circular(20),
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screen.sizeScreen(context, 0.01, 0.02),
                  )
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
