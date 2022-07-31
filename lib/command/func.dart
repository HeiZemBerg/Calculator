import 'package:math_expressions/math_expressions.dart';

bool isOperator(String x) {
  if (x == '÷' || x == 'x' || x == '–' || x == '+' || x == '=' || x == '%') {
    return true;
  }
  return false;
}

int operatorColor(String x) {
  if (x == '' || x == 'x' || x == '–' || x == '+' || x == '=') {
    return 1;
  }
  if (x == '%' || x == '÷' || x == 'AC') {
    return 2;
  }
  return 3;
}

String equalPressed(String finalQuestion) {
  finalQuestion = finalQuestion.replaceAll('x', '*');
  finalQuestion = finalQuestion.replaceAll('–', '-');
  finalQuestion = finalQuestion.replaceAll('÷', '/');

  Parser p = Parser();
  Expression exp = p.parse((finalQuestion));
  ContextModel cm = ContextModel();
  num eval = exp.evaluate(EvaluationType.REAL, cm);
  if(eval.toString().split('.')[1]=='0'){
    return eval.toInt().toString();
  }
  return eval.toString();
}


