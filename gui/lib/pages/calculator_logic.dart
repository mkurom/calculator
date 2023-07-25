import 'package:gui/util/constant/constant.dart';

String calculate(String output, String operand) {
  try {
    double num1 = 0.0;
    double num2 = 0.0;
    List<String> numbers = output.split(operand);
    num1 = double.parse(numbers[0]);
    num2 = double.parse(numbers[1]);

    if (operand == addition) {
      return (num1 + num2).toString();
    }
    if (operand == subtraction) {
      return (num1 - num2).toString();
    }
    if (operand == multiplication) {
      return (num1 * num2).toString();
    }
    if (operand == division) {
      if (num2 == 0) {
        return calcurateError;
      }

      return (num1 / num2).toString();
    }
  } catch (e) {
    return calcurateError;
  }

  return output;
}
