import 'package:flutter/material.dart';
import 'package:gui/util/constant/constant.dart';

Color selectColor(String buttonText) {
  final isOperand = buttonText == addition ||
      buttonText == subtraction ||
      buttonText == multiplication ||
      buttonText == division ||
      buttonText == equals;

  if (isOperand) {
    return Colors.orange;
  }
  if (buttonText == dot || buttonText == allClear) {
    return Colors.grey;
  }

  final result = int.tryParse(buttonText);

  return result != null ? Colors.grey : Colors.orange;
}
