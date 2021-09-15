import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  TextFieldInput(
      {required this.labelText,
        required this.prefixText,
        this.textEditingController,
        this.initialValue,
        this.textInputType,
        this.isVisibleText = true,
        this.validator,
        this.isErrorField = false});

  final String labelText;
  final String prefixText;
  final String? initialValue;
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;
  final bool isVisibleText;
  final bool? isErrorField;
  final String? Function(String?)? validator;

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