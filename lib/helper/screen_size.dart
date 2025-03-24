import 'package:flutter/material.dart';

class Screensize{

double sizeScreen(BuildContext context, double isHeith,double isWidth)
{
  var hieght =MediaQuery.of(context).size.height;
  var width =MediaQuery.of(context).size.width;
  if(hieght> width) {
    return isHeith*hieght ;
  } else {
    return isWidth*hieght;
  }
}

}