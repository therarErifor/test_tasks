import 'package:facts_and_achievements_in_sports/src/presentation/plug_page/plug_page.dart';
import 'package:flutter/material.dart';

class PlugApp extends StatelessWidget{
  const PlugApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.blueGrey)
      ),
      debugShowCheckedModeBanner: false,
      home: PlugPage(),
    );
  }
}