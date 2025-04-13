import 'package:customer/helper/my_constans.dart';
import 'package:flutter/material.dart';


class MyTextinput extends StatefulWidget {
     MyTextinput(
      {super.key,
      required this.text,
      required this.texticon,
      this.obscureText = false,
      this.enable = true,
      this.controller,
      this.onTop,
      this.readOnly = false,
      this.colorInFocuse = kColorPrimer,
      this.isPasswrod = false,
      this.typeText});

  final Icon texticon;
  final String text;
   bool obscureText;
  final bool enable;
 final TextEditingController? controller;
final  VoidCallback? onTop;
final  bool readOnly;
final  Color colorInFocuse;

 final bool isPasswrod;
 final TextInputType? typeText;

  @override
  State<MyTextinput> createState() => _MyTextinputState();
}

class _MyTextinputState extends State<MyTextinput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
       maxLength: widget.typeText==TextInputType.phone?9:50,
      validator: (data) {
        if (data?.isEmpty??true) {
          return 'يرجو تعبة الحقل ';
        } 
          if (int.tryParse(data!) == null &&
              widget.typeText == TextInputType.phone) {
            return 'يرجاء تعبة الحقل ارقام فقط';
          }
          if(widget.typeText==TextInputType.number ||widget.typeText==TextInputType.phone)
          {
            if(data.length>=2)
            {
             
              int number=int.parse(data.substring(0,2));
             if (number != 77 && number != 78 && number != 71 && number != 73) {
                return 'الرجاء إدخال رقم يبدأ بـ77/78/71/73';
                }
               

             
            }
           
          }
        
        return null;
      },
      keyboardType: widget.typeText,
      readOnly: widget.readOnly,
      onTap: widget.onTop,
      controller: widget.controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
          labelText: widget.text,
          labelStyle:const  TextStyle(color: Colors.black),
          prefixIcon: widget.texticon,
          suffix: widget.isPasswrod
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.obscureText = widget.obscureText ? false : true;
                    });
                  },
                  child: widget.obscureText
                      ?const  Icon(Icons.visibility_outlined)
                      :const  Icon(Icons.visibility_off_outlined),
                )
              : null,
          enabled: widget.enable,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.colorInFocuse),
            borderRadius: BorderRadius.circular(20),
          )),
    );
  }
}
