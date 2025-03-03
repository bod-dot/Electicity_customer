
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class Api
{
  //dynamic
  Future<dynamic> post ({required String Url,required dynamic body})
  async {

   http.Response response =await http.post(Uri.parse(Url),body: body);

   if(response.statusCode==200)
     {

       return jsonDecode(response.body);

     }
   else
     {


       throw Exception("three is a brablem the status Code is ${response.statusCode} and the body is ${jsonDecode(response.body)}");
     }
  }
}