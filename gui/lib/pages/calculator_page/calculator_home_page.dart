import 'package:flutter/material.dart';
import 'package:gui/pages/calculator_logic.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:gui/pages/calculator_page/widgets/button.dart';
import 'package:gui/util/constant/constant.dart';

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({super.key});

  @override
  CalculatorHomePageState createState() => CalculatorHomePageState();
}

class CalculatorHomePageState extends State<CalculatorHomePage> {
  String input = '0';
  String output = '0';
  String operand = '';

  void buttonPressed(String buttonText) {
    if (output.length > 16) {
      return;
    }

    if (buttonText == allClear) {
      output = '0';
      operand = '';
    } else if (buttonText == addition ||
        buttonText == subtraction ||
        buttonText == multiplication ||
        buttonText == division) {
      if (output == '0' || operand.isNotEmpty) {
        return;
      }
      operand = buttonText;
      output = output + operand;
    } else if (buttonText == dot) {
      if (output.contains(dot)) {
        return;
      } else {
        output = output + buttonText;
      }
    } else if (buttonText == equals) {
      output = calculate(output, operand);
      operand = '';
    } else {
      if (output == '0' && buttonText == '0') {
        return;
      }

      if (output == '0') {
        output = buttonText;
      } else {
        output = output + buttonText;
      }
    }

    setState(() {
      output = output;
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
              output,
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
