import 'package:flutter/material.dart';
import 'features/hotel/hotel_page.dart';

class HotelApp extends StatelessWidget{
  const HotelApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.black),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromRGBO(255, 255, 255, 1)
        ),

        fontFamily: 'SF Pro Display',
      ),
      debugShowCheckedModeBanner: false,
      home: HotelPage(),
    );
  }
}