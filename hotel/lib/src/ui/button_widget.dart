import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Widget? page;
  final String? text;

  ButtonWidget(this.page, this.text);

  @override
  Widget build(BuildContext context) {
    return _buildButton(context, page, text!);
  }

  Widget _buildButton (BuildContext context, page, String text){
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_)=> page)
        ),
        child: Text(text,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500)),

        style: ElevatedButton.styleFrom(
          minimumSize: Size(100, 48),
          backgroundColor: Color.fromRGBO(13, 114, 255, 1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}