import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  TextFieldInput(
      {required this.labelText,
        required this.icon,
        this.textEditingController,
        this.textInputType,
        this.isVisibleText = true,
        this.validator,
        this.isErrorField = false});

  final String labelText;
  final IconData icon;
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
        validator: validator,
        textAlignVertical: TextAlignVertical.center,
        controller: textEditingController,
        keyboardType: textInputType,
        obscureText: !isVisibleText,
        enableSuggestions: isVisibleText,
        autocorrect: isVisibleText,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            icon,
            color: (isErrorField != null && isErrorField!)
                ? Colors.redAccent
                : Colors.lightBlueAccent.shade400,
          ),
        ),
      ),
    );
  }
}