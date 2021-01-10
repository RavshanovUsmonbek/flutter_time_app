import 'package:flutter/material.dart';
import 'package:time_app/pages/choose_location.dart';
import 'package:time_app/pages/loading.dart';
import 'package:time_app/pages/home.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },  
));
