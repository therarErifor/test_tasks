import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextWidget extends StatelessWidget {
  final String? textType;
  final dynamic text;

  TextWidget(this.textType, this.text);


  @override
  Widget build(BuildContext context) {
    return _buildTextWidget(context, textType!, text);
  }

  Widget _buildTextWidget (BuildContext context,String textType, text){
    switch(textType) {
      case 'HeaderMinimalPriceText':
        return Text('от ${NumberFormat.currency(locale: 'ru_RU', symbol: '₽', decimalDigits: 0).format(
            text)}',
          style: const TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontSize: 30,
              fontWeight: FontWeight.w600),
        );
      case 'headerPriceText':
        return Text(NumberFormat.currency(locale: 'ru_RU', symbol: '₽', decimalDigits: 0).format(text),
          style: const TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontSize: 30,
              fontWeight: FontWeight.w600),
        );
      case 'simplePriceText':
        return Text(NumberFormat.currency(locale: 'ru_RU', symbol: '₽', decimalDigits: 0).format(text),
          style: const TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontSize: 16,
              fontWeight: FontWeight.w400),
        );
      case 'header':
        return Text(text,
            style: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 22,
                fontWeight: FontWeight.w500)
        );
      case 'addressText':
        return Text(text,
            style: const TextStyle(
                color: Color.fromRGBO(13, 114, 255, 1),
                fontSize: 14,
                fontWeight: FontWeight.w500)
        );
      default:
        return Text(text,
            style: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 16,
                fontWeight: FontWeight.w400)
        );
    }
  }
}