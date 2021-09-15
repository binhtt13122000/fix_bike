import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  TextFieldInput(
      {required this.labelText,
        required this.prefixText,
        this.textEditingController,
        this.initialValue = null,
        this.textInputType,
        this.isVisibleText = true,
        this.validator,
        this.isErrorField = false});

  String labelText;
  String prefixText;
  String? initialValue;
  TextEditingController? textEditingController;
  TextInputType? textInputType;
  bool isVisibleText;
  bool? isErrorField;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: TextFormField(
        initialValue: initialValue,
        validator: validator,
        textAlignVertical: TextAlignVertical.center,
        controller: textEditingController,
        keyboardType: textInputType,
        obscureText: !isVisibleText,
        enableSuggestions: isVisibleText,
        autocorrect: isVisibleText,
        style: TextStyle(
          fontSize: 20.0,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixText: prefixText,
          prefixStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}