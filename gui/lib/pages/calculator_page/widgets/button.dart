import 'package:flutter/material.dart';
import 'package:gui/util/extension/context_extension.dart';
import 'package:gui/util/select_color.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const Button({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = selectColor(buttonText);

    return SizedBox(
      width:
          buttonText == '0' ? context.deviceWidth / 3 : context.deviceWidth / 6,
      height: context.deviceWidth / 6,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: buttonText == '0'
              ? const StadiumBorder()
              : CircleBorder(
                  side: BorderSide(
                    color: color,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
