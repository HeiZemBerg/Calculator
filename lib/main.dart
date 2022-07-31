import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';
import 'buttons.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var userQuestion = '';
  var userAnswer = '';

  final List<String> buttons = [
    'AC',
    '%',
    '/',
    '←',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '–',
    '1',
    '2',
    '3',
    '+',
    '+/–',
    '0',
    '.',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: const Color(0xFF22252d),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(userQuestion,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 25)),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userAnswer,
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                  color: Color(0xff292d36),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return myButton(
                        buttonTapped: () {
                          setState(() {
                            userQuestion = '';
                          });
                        },
                        buttonText: buttons[index],
                        color: const Color(0xff272b33),
                        textColor: operatorColor(buttons[index]) == 1
                            ? const Color(0xffec7878)
                            : (operatorColor(buttons[index]) == 2
                                ? const Color(0xff278478)
                                : Colors.white),
                        textSize: isOperator(buttons[index]) ? 35 : 27,
                      );
                    }
                    else if (index == 3) {
                      return myButton(
                        buttonTapped: () {
                          setState(() {
                            if(userQuestion.isNotEmpty) {
                              userQuestion = userQuestion.substring(
                                  0, userQuestion.length - 1);
                            }
                          });
                        },
                        buttonText: buttons[index],
                        color: const Color(0xff272b33),
                        textColor: operatorColor(buttons[index]) == 1
                            ? const Color(0xffec7878)
                            : (operatorColor(buttons[index]) == 2
                                ? const Color(0xff278478)
                                : Colors.white),
                        textSize: isOperator(buttons[index]) ? 35 : 27,
                      );
                    }
                    else if (index == buttons.length - 1) {
                      return myButton(
                        buttonTapped: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                        buttonText: buttons[index],
                        color: const Color(0xff272b33),
                        textColor: operatorColor(buttons[index]) == 1
                            ? const Color(0xffec7878)
                            : (operatorColor(buttons[index]) == 2
                            ? const Color(0xff278478)
                            : Colors.white),
                        textSize: isOperator(buttons[index]) ? 35 : 27,
                      );
                    }
                    else {
                      return myButton(
                        buttonTapped: () {
                          setState(() {
                            userQuestion += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: const Color(0xff272b33),
                        textColor: operatorColor(buttons[index]) == 1
                            ? const Color(0xffec7878)
                            : (operatorColor(buttons[index]) == 2
                                ? const Color(0xff278478)
                                : Colors.white),
                        textSize: isOperator(buttons[index]) ? 35 : 27,
                      );
                    }
                  }),
            ),
          )
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=' || x == '%') {
      return true;
    }
    return false;
  }

  int operatorColor(String x) {
    if (x == '' || x == 'x' || x == '–' || x == '+' || x == '=') {
      return 1;
    }
    if (x == '%' || x == '/' || x == 'AC') {
      return 2;
    }
    return 3;
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    finalQuestion = finalQuestion.replaceAll('–', '-');

    Parser p = Parser();
    Expression exp = p.parse((finalQuestion));
    ContextModel cm = ContextModel();
    num eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}
