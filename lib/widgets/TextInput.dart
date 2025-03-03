import 'package:customer/helper/Constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextinput extends StatefulWidget {
  MyTextinput(
      {super.key,
      required this.text,
      required this.Texticon,
      this.obscureText = false,
      this.enable = true,
      this.controller,
      this.onTop,
      this.readOnly = false,
      this.colorInFocuse = KColorPrimer,
      this.isPasswrod = false,
      this.typeText});

  final Icon Texticon;
  final String text;
  bool obscureText;
  final bool enable;
  TextEditingController? controller;
  VoidCallback? onTop;
  bool readOnly;
  Color colorInFocuse;

  bool isPasswrod;
  TextInputType? typeText;

  @override
  State<MyTextinput> createState() => _MyTextinputState();
}

class _MyTextinputState extends State<MyTextinput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'يرجو تعبة الحقل ';
        } else {
          if (int.tryParse(data) == null &&
              widget.typeText == TextInputType.number) {
            return 'يرجاء تعبة الحقل ارقام فقط';
          }
        }
      },
      keyboardType: widget.typeText,
      readOnly: widget.readOnly,
      onTap: widget.onTop,
      controller: widget.controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
          labelText: widget.text,
          labelStyle: TextStyle(color: Colors.black),
          prefixIcon: widget.Texticon,
          suffix: widget.isPasswrod
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.obscureText = widget.obscureText ? false : true;
                    });
                  },
                  child: widget.obscureText
                      ? Icon(Icons.visibility_outlined)
                      : Icon(Icons.visibility_off_outlined),
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
