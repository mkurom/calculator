import 'package:gui/util/constant/constant.dart';

String calculate(String num1, String num2, String operand) {
  try {
    final _num1 = double.parse(num1);
    final _num2 = double.parse(num2);

    if (operand == addition) {
      return (_num1 + _num2).toString();
    }
    if (operand == subtraction) {
      return (_num1 - _num2).toString();
    }
    if (operand == multiplication) {
      return (_num1 * _num2).toString();
    }
    if (operand == division) {
      if (num2 == zero) {
        return calcurateError;
      }
      return (_num1 / _num2).toStringAsFixed(2);
    }
  } catch (e) {
    return calcurateError;
  }
  return calcurateError;
}

bool isOperand(String text) {
  return text == addition ||
      text == subtraction ||
      text == multiplication ||
      text == division;
}
