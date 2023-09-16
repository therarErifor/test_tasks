import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../repositories/fact_repository/fact_entities/fact_data.dart';


class FactDetailedPage extends StatelessWidget {
  final FactData _factData;

  FactDetailedPage(FactData factData) : _factData = factData;

  @override
  Widget build(BuildContext context, ) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(_factData.title),
        ),
        body: SingleChildScrollView( child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Color.fromRGBO(28, 28, 28, 1),
              borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child:  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset("assets/images/№${_factData.id}.jpg", height: 300, fit: BoxFit.cover, )),
                ),
                SizedBox(height: 10),
                Text(_factData.content, style: TextStyle(
                 fontSize: 18,
                  color: Colors.white,
                )),
                SizedBox(height: 10),
                Wrap(
                  children: _factData.tags.map((item) {
                    return Row( mainAxisSize: MainAxisSize.min,
                        children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(
                            left: 0, right: 8, top: 8, bottom: 0),
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(50, 80, 128, 1),
                            borderRadius:
                            BorderRadius.all(Radius.circular(5))),
                        child: Text(
                          '$item',
                          style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ]);
                  }).toList(),
                ),
              ]
          ),
        )
      ));

  }
}