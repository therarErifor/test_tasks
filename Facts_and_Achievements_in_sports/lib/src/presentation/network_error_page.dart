import 'package:flutter/material.dart';

class NetworkErrorPage extends StatelessWidget {
  const NetworkErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.network_cell_rounded,
                size: 50,
              ),
              SizedBox(height: 10),
              Text("Network access is required for the application to work",
                  style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
