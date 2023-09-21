import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/src/presentations/first_page.dart';

class ThreePagesApp extends StatelessWidget{
  const ThreePagesApp({super.key});

  @override build(BuildContext context){
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}