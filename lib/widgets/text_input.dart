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
      this.typeText,
      this.labelStyle,
      this.style, this.maxLength, this.onChanged});

  final Icon texticon;
  final String text;
   bool obscureText;
  final bool enable;
 final TextEditingController? controller;
final  VoidCallback? onTop;
final  bool readOnly;
final  Color colorInFocuse;
final int? maxLength;
 final bool isPasswrod;
 final TextInputType? typeText;
 final TextStyle? labelStyle ;
 final TextStyle? style;
  final  void Function(String)? onChanged;

  @override
  State<MyTextinput> createState() => _MyTextinputState();
}

class _MyTextinputState extends State<MyTextinput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:widget.onChanged ,
      
       maxLength: widget.maxLength,
      validator: (data) {
        if (data?.isEmpty??true) {
          return 'يرجى تعبئة الحقل ';
        } 
        if(widget.typeText==null && data!.length<6)
        {
           return 'يجب ان لا يقل عن 6 احروف وا ارقام';
        }
          if (int.tryParse(data!) == null &&
              widget.typeText == TextInputType.phone) {
            return 'يرجى تعبئة الحقل ارقام فقط';
          }
          if(widget.typeText==TextInputType.phone)
          {
            if(data.length>=2)
            {
             
              int number=int.parse(data.substring(0,2));
             if (number != 77 && number != 78 && number != 71 && number != 73) {
                return 'الرجاء إدخال رقم يبدأ بـ77/78/71/73';
                }
               

             
            }
           
          }
          if(widget.typeText==TextInputType.number )
          {
             if(data.length>=3)
            {
               int number=int.parse(data.substring(0,1));
               if(number==0)
               {
                return "لا يجب ان يبداء 0";
               }
            

            }
             
          }
        
        return null;
      },
      style:widget.style?? const   TextStyle(color: Colors.white),
      keyboardType: widget.typeText,
      readOnly: widget.readOnly,
      onTap: widget.onTop,
      controller: widget.controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        
        
          labelText: widget.text,
          labelStyle: widget.labelStyle ?? const  TextStyle(color: Colors.white),
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
