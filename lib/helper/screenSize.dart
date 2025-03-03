import 'package:flutter/material.dart';

class Screensize{

double SizeScreen(BuildContext context, double isHeith,double isWidth)
{
  var Hieght =MediaQuery.of(context).size.height;
  var Width =MediaQuery.of(context).size.width;
  if(Hieght> Width)
    return isHeith*Hieght ;
  else
    return isWidth*Hieght;
}

}