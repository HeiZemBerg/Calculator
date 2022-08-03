import 'package:flutter/material.dart';
import '../command/buttons.dart';
import '../command/func.dart';

var menu = 1;

class StandardCalculator extends StatefulWidget {
  const StandardCalculator({Key? key}) : super(key: key);

  @override
  State<StandardCalculator> createState() => _StandardCalculatorState();
}

class _StandardCalculatorState extends State<StandardCalculator> {
  var userQuestion = '';
  var userAnswer = '';
  var secondNumber = 0;

  TextStyle normalEqualTextStyle = const TextStyle(
      fontSize: 50, color: Colors.grey, fontWeight: FontWeight.bold);

  final List<String> buttons = [
    'AC',
    '%',
    '÷',
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
    return Scaffold(
      backgroundColor: const Color(0xFF22252d),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 20, top: 80, right: 20, bottom: 20),
                  alignment: Alignment.centerRight,
                  child: Text(userQuestion,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 30)),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userAnswer,
                    style: normalEqualTextStyle,
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
                          resetAll();
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
                  } else if (index == 3) {
                    return myButton(
                      buttonTapped: () {
                        setState(() {
                          if (userQuestion.isNotEmpty) {
                            if (isOperator(
                                userQuestion[userQuestion.length - 1])) {
                              secondNumber = 0;
                              userAnswer = '';
                            } else if (userQuestion.length >= 2 &&
                                userQuestion[userQuestion.length - 2] == '-') {
                              userQuestion = userQuestion.substring(
                                  0, userQuestion.length - 1);
                            }
                            userQuestion = userQuestion.substring(
                                0, userQuestion.length - 1);
                          }
                          if (userQuestion.isEmpty) {
                            resetAll();
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
                  } else if (index == buttons.length - 1) {
                    return myButton(
                      buttonTapped: () {
                        setState(() {
                          if (userQuestion.isNotEmpty) {
                            userQuestion = userAnswer;
                            userAnswer = '';
                            secondNumber=0;
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
                  } else if (index == 16) {
                    return myButton(
                      buttonTapped: () {
                        setState(() {
                          if (userQuestion.isNotEmpty) {
                            String finalNumber = userQuestion;
                            finalNumber += '* -1';
                            userQuestion = equalPressed(finalNumber);
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
                  } else if (index == 18) {
                    return myButton(
                      buttonTapped: () {
                        setState(() {
                          if (userQuestion.isNotEmpty) {
                            if (userQuestion[userQuestion.length - 1] != '.' &&
                                !isOperator(
                                    userQuestion[userQuestion.length - 1])) {
                              userQuestion += buttons[index];
                            }
                          } else if (userQuestion.isEmpty) {
                            userQuestion += '0.';
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
                  } else {
                    return myButton(
                      buttonTapped: () {
                        setState(() {
                          if ((userQuestion.isEmpty &&
                              isOperator(buttons[index]))) {
                            userQuestion = userQuestion;
                          }
                          else {
                            userQuestion == '0'
                                ? (buttons[index] == '.'
                                ? userQuestion += buttons[index]
                                : userQuestion = userQuestion)
                                : userQuestion += buttons[index];
                          }
                          if (userQuestion.isNotEmpty &&
                              isOperator(buttons[index]) &&
                              secondNumber == 0) {
                            secondNumber = 1;
                          } else if (secondNumber == 1) {
                            userAnswer = equalPressed(userQuestion);
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
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  void resetAll() {
    userAnswer = '';
    userQuestion = '';
    secondNumber = 0;
  }
}
