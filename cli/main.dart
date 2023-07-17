import 'dart:io';

void handleError(String message) {
  print('エラー： $message');
}

double? calculate(double num1, double num2, String? operator) {
  switch (operator) {
    case '+':
      return num1 + num2;
    case '-':
      return num1 - num2;
    case '*':
      return num1 * num2;
    case '/':
      if (num2 == 0) {
        handleError('0で割ることはできません。');
        return null;
      }

      return num1 / num2;

    default:
      handleError('無効な演算子です。');
      return null;
  }
}

double? checkInput(String? input) {
  if (input == null || input == '') {
    handleError('無効な入力です。');
    return null;
  }

  if (input.length > 16 ||
      (input.contains('.') && input.split('.')[1].length > 16)) {
    handleError('16桁を超える数値は扱えません。');
    return null;
  }
  double? number = double.tryParse(input);
  if (number == null) {
    handleError('無効な入力です。');
    return null;
  }

  return number;
}

void main() {
  print('最初の数を入力してください (16桁以内): ');
  final input1 = stdin.readLineSync();
  final num1 = checkInput(input1);
  if (num1 == null) {
    return;
  }

  print('2つ目の数を入力してください (16桁以内): ');
  final input2 = stdin.readLineSync();
  final num2 = checkInput(input2);
  if (num2 == null) {
    return;
  }

  print('以下から操作を選択してください');
  print('+, -, *, / : ');
  final operator = stdin.readLineSync();

  final result = calculate(num1, num2, operator);

  if (result != null) {
    print('結果: $result');
  }
}
