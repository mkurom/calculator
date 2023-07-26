import 'package:gui/util/constant/constant.dart';

String calculate(String num1, String num2, String operand) {
  try {
    final _num1 = double.parse(num1);
    final _num2 = double.parse(num2);
    var _answer = zero;
    if (operand == addition) {
      _answer = (_num1 + _num2).toString();
    }
    if (operand == subtraction) {
      _answer = (_num1 - _num2).toString();
    }
    if (operand == multiplication) {
      _answer = (_num1 * _num2).toString();
    }
    if (operand == division) {
      if ((_num1 / _num2).isInfinite) {
        return calcurateError;
      }
      _answer = (_num1 / _num2).toStringAsFixed(16);
    }

    if (double.parse(_answer) % 1 == 0) {
      return double.parse(_answer).toInt().toString();
    } else {
      return double.parse(_answer).toString();
    }
  } catch (e) {
    return calcurateError;
  }
}

bool isOperand(String text) {
  return text == addition ||
      text == subtraction ||
      text == multiplication ||
      text == division;
}
