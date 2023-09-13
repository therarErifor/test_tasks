import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomTextFormField extends StatelessWidget {
  final String content;
  final KeyboardType keyboardType;
  // final String

  var maskFormatter = new MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var dataMask = new MaskTextInputFormatter(
      mask: '##.##.####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var  passportMask = new MaskTextInputFormatter(
      mask: '## #######',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  CustomTextFormField(this.content, this.keyboardType);

  @override
  Widget build(BuildContext context) {
    if(_getKeyboardType() == TextInputType.phone) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
    padding: EdgeInsets.symmetric(horizontal: 20),
    decoration: const BoxDecoration(
    color: Color.fromRGBO(246, 246, 249, 1),
    borderRadius: BorderRadius.all(Radius.circular(10))),
    child:    TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
                inputFormatters: [maskFormatter],
              validator: (value) {
                  if (maskFormatter.isFill())
                  {return null;}
                  },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  label: Text(content),
                  labelStyle: TextStyle(
                      color: Color.fromRGBO(169, 171, 183, 1),
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                  focusedErrorBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.blue, width: 0.0),
                  ),
                ),

                textInputAction: TextInputAction.next,
                keyboardType: _getKeyboardType(),
              ));
        }
        if(_getKeyboardType() == TextInputType.emailAddress){
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
                color: Color.fromRGBO(246, 246, 249, 1),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child:  TextFormField(
            inputFormatters: [],
            validator: (value){
              if (isEmailValid(value)){
                null;
              }
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              label: Text(content),
              labelStyle: TextStyle(
                  color: Color.fromRGBO(169, 171, 183, 1),
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
              alignLabelWithHint: false,
            ),
            textInputAction: TextInputAction.next,
            keyboardType: _getKeyboardType(),
          ));
        }

        return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
    padding: EdgeInsets.symmetric(horizontal: 20),
    decoration: const BoxDecoration(
    color: Color.fromRGBO(246, 246, 249, 1),
    borderRadius: BorderRadius.all(Radius.circular(10))),
    child:  TextFormField(
             // validator: ,
              decoration: InputDecoration(
                border: InputBorder.none,
                label: Text(content),
                labelStyle: TextStyle(
                    color: Color.fromRGBO(169, 171, 183, 1),
                    fontSize: 17,
                    fontWeight: FontWeight.w400),
                alignLabelWithHint: false,
              ),
              textInputAction: TextInputAction.next,
              keyboardType: _getKeyboardType(),
            ));
    }

  TextInputType _getKeyboardType() {
    switch (keyboardType) {
      case KeyboardType.text:
        return TextInputType.text;
      case KeyboardType.email:
        return TextInputType.emailAddress;
      case KeyboardType.phoneNumber:
        return TextInputType.phone;
      case KeyboardType.password:
        return TextInputType.visiblePassword;
      case KeyboardType.number:
        return TextInputType.number;
    }
  }

}

bool isEmailValid(email) {
  bool valid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  return valid;
}

enum KeyboardType { text, email, phoneNumber, password, number }