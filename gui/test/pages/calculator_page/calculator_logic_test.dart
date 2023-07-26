import 'package:flutter_test/flutter_test.dart';
import 'package:gui/pages/calculator_page/calculator_logic.dart';

void main() {
  group('calculate', () {
    test('addition', () {
      expect(calculate('1', '1', '+'), '2');
      expect(calculate('-10', '1', '+'), '-9');
      expect(calculate('1.0', '1', '+'), '2');
      expect(calculate('1.1', '1', '+'), '2.1');
    });

    test('subtraction', () {
      expect(calculate('10', '4', '-'), '6');
      expect(calculate('10.0', '4', '-'), '6');
      expect(calculate('10.5', '4', '-'), '6.5');
    });

    test('multiplication', () {
      expect(calculate('5', '5', '×'), '25');
      expect(calculate('5.0', '5', '×'), '25');
      expect(calculate('5.5', '5', '×'), '27.5');
    });

    test('division', () {
      expect(calculate('10', '2', '÷'), '5');
      expect(calculate('10.0', '2', '÷'), '5');
      expect(calculate('5.5', '5', '÷'), '1.1');
    });

    test('division by zero', () {
      expect(calculate('5', '0', '÷'), 'エラー');
    });

    test('invalid operand', () {
      expect(calculate('5', '5', 'err'), 'エラー');
    });

    test('invalid numbers', () {
      expect(calculate('err', '5', '+'), 'エラー');
      expect(calculate('5', 'err', '+'), 'エラー');
    });
  });
}
