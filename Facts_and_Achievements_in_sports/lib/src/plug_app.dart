import 'package:facts_and_achievements_in_sports/src/presentation/fact_page/fact_page.dart';
import 'package:flutter/material.dart';

class PlugApp extends StatelessWidget {
  const PlugApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            appBarTheme:
                AppBarTheme(backgroundColor: Color.fromRGBO(28, 28, 28, 1))),
        debugShowCheckedModeBanner: false,
        home: FactPage());
  }
}
