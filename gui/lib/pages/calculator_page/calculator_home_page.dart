import 'package:flutter/material.dart';
import 'package:gui/pages/calculator_page/calculator_logic.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:gui/pages/calculator_page/widgets/button.dart';
import 'package:gui/util/constant/constant.dart';

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({super.key});

  @override
  CalculatorHomePageState createState() => CalculatorHomePageState();
}

class CalculatorHomePageState extends State<CalculatorHomePage> {
  String num1 = zero;
  String num2 = zero;
  String result = zero;
  String operand = '';

  void buttonPressed(String buttonText) {
    // if (result.length > 16) {
    //   return;
    // }

    if (buttonText == allClear) {
      num1 = zero;
      num2 = zero;
      result = zero;
      operand = '';
    } else if (isOperand(buttonText)) {
      num2 = result;

      operand = buttonText;
    } else if (buttonText == dot) {
      if (result.contains(dot)) {
        return;
      }

      result = result + buttonText;
    } else if (buttonText == equals) {
      result = calculate(num1, num2, operand);

      num1 = result;
    } else {
      if (num1 == zero && buttonText == zero) {
        return;
      }

      if (num1 == zero) {
        num1 = buttonText;
        result = num1;
      } else {
        num2 = buttonText;
        result = num2;
      }
    }

    setState(() {
      result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('計算機'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 12,
            ),
            child: AutoSizeText(
              result,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Divider(),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Button(
                        buttonText: allClear,
                        onPressed: () => buttonPressed(allClear),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Button(
                        buttonText: '7',
                        onPressed: () => buttonPressed('7'),
                      ),
                      Button(
                        buttonText: '8',
                        onPressed: () => buttonPressed('8'),
                      ),
                      Button(
                        buttonText: '9',
                        onPressed: () => buttonPressed('9'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Button(
                        buttonText: '4',
                        onPressed: () => buttonPressed('4'),
                      ),
                      Button(
                        buttonText: '5',
                        onPressed: () => buttonPressed('5'),
                      ),
                      Button(
                        buttonText: '6',
                        onPressed: () => buttonPressed('6'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Button(
                        buttonText: '1',
                        onPressed: () => buttonPressed('1'),
                      ),
                      Button(
                        buttonText: '2',
                        onPressed: () => buttonPressed('2'),
                      ),
                      Button(
                        buttonText: '3',
                        onPressed: () => buttonPressed('3'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Button(
                        buttonText: '0',
                        onPressed: () => buttonPressed('0'),
                      ),
                      Button(
                        buttonText: dot,
                        onPressed: () => buttonPressed(dot),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Button(
                    buttonText: division,
                    onPressed: () => buttonPressed(division),
                  ),
                  Button(
                    buttonText: multiplication,
                    onPressed: () => buttonPressed(multiplication),
                  ),
                  Button(
                    buttonText: subtraction,
                    onPressed: () => buttonPressed(subtraction),
                  ),
                  Button(
                    buttonText: addition,
                    onPressed: () => buttonPressed(addition),
                  ),
                  Button(
                    buttonText: equals,
                    onPressed: () => buttonPressed(equals),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
