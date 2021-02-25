import 'package:flutter/material.dart';
import 'Route_Pages/loading.dart';
import 'Route_Pages/home.dart';
void main() => runApp(MaterialApp(
    initialRoute: '/loading',
    routes: {
      '/home':(context) => Home(),
      '/loading':(context) => Loading(),
    },
  ));

