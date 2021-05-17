import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class WorldTime{

  String zone = "Asia/Kolkata";
  String time = "";
  String pic = "day.jpg";
  Color? col = Colors.cyan;

  WorldTime({required this.zone});

  Future<void> getData() async{
    try{
      Response res = await get(Uri.parse("https://worldtimeapi.org/api/timezone/$zone"));
      Map data = jsonDecode(res.body);

      String datetime = data["datetime"];
      String offset = data["utc_offset"];
      String sign = offset[0];
      int hrsoff = int.parse(offset.substring(1,offset.indexOf(":")));
      int minoff = int.parse(offset.substring(offset.indexOf(":")+1));

      DateTime now = DateTime.parse(datetime);
      if(sign == "+"){
        now = now.add(Duration(hours: hrsoff, minutes: minoff));
      }else if(sign == "-"){
        now = now.subtract(Duration(hours: hrsoff, minutes: minoff));
      }

      if(now.hour >= 19 || (now.hour >=0 && now.hour < 4)){
        pic = "night.jpg";
        col = Colors.purple[700];
      }else{
        pic = "day.jpg";
        col = Colors.cyan;
      }

      time = DateFormat.jm().format(now);
    }catch(e){
      time = "Problemo";
    }
    finally{
      print(time);
    }
  }

}