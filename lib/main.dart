import 'package:flutter/material.dart';
import 'Pages/loading.dart';
import 'Pages/location.dart';
import 'Pages/home.dart';

void main() => runApp(MaterialApp(

  initialRoute: '/',

  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => Location()
  },
));