import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  ButtonCustom(
      {required this.bgColor,
        required this.bgColorPress,
        required this.textButton,
        this.imageUrl = "",
        this.handleFunction,
        required this.textStyle,
        required this.borderRadius,
        required this.edgeInsets});

  final Color bgColor, bgColorPress;
  final double borderRadius;
  final EdgeInsets edgeInsets;
  final String textButton, imageUrl;
  final TextStyle textStyle;
  final void Function()? handleFunction;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: handleFunction,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(4),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) return bgColorPress;
              return bgColor; // Defer to the widget's default.
            }),
        padding: MaterialStateProperty.all<EdgeInsets>(edgeInsets),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            )),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textButton,
            style: textStyle,
          ),
          if (imageUrl != "")
            SizedBox(
              width: 4,
            ),
          if (imageUrl != "")
            Image(
              image: AssetImage(imageUrl),
              height: 24,
            ),
        ],
      ),
    );
  }
}
