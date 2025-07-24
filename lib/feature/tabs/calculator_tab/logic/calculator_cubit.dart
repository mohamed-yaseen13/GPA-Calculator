import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/feature/tabs/calculator_tab/logic/calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(const CalculatorState());

  void inputNumber(String number) {
    if (state.isError) {
      clear();
    }

    final expr = state.expression;
    final lastChar = expr.isNotEmpty ? expr[expr.length - 1] : null;

    // Auto insert × after ')'
    final needsMultiplication = lastChar == ')';
    final newExpr = (needsMultiplication ? '$expr×' : expr) + number;

    if (state.isNewOperation) {
      emit(
        state.copyWith(
          displayValue: number,
          isNewOperation: false,
          hasDecimal: number == '.',
          expression: expr.contains('=') ? number : newExpr,
        ),
      );
    } else {
      if (number == '.' && state.hasDecimal) return;

      final newValue =
          state.displayValue == '0' && number != '.'
              ? number
              : state.displayValue + number;

      emit(
        state.copyWith(
          displayValue: newValue,
          currentInput: newValue,
          hasDecimal: state.hasDecimal || number == '.',
          expression: newExpr,
        ),
      );
    }
  }

  void inputSymbol(String symbol) {
    if (state.isError) return;

    final expr = state.expression;
    final lastChar = expr.isNotEmpty ? expr[expr.length - 1] : null;

    String symbolToAdd = symbol;

    // Auto insert × before '('
    if (symbol == '(' &&
        lastChar != null &&
        RegExp(r'\d|\)').hasMatch(lastChar)) {
      symbolToAdd = '×(';
    }

    // Auto insert × after ')' if followed by number is handled in inputNumber

    if (symbol == '(' || symbol == ')') {
      emit(
        state.copyWith(
          expression: expr + symbolToAdd,
          displayValue: symbol,
          isNewOperation: symbol == ')',
        ),
      );
      return;
    }

    if (symbol == '-' && state.isNewOperation && state.operation == '-') {
      emit(
        state.copyWith(
          displayValue: '-',
          currentInput: '-',
          isNewOperation: false,
          expression: '$expr -',
        ),
      );
      return;
    }

    if (!expr.contains('=')) {
      emit(
        state.copyWith(
          previousValue: state.displayValue,
          operation: symbol,
          isNewOperation: true,
          hasDecimal: false,
          currentInput: '',
          expression: '$expr $symbol',
        ),
      );
    } else {
      final newExpression = '${state.displayValue} $symbol';
      emit(
        state.copyWith(
          previousValue: state.displayValue,
          operation: symbol,
          isNewOperation: true,
          hasDecimal: false,
          currentInput: '',
          expression: newExpression,
          history: List.from(state.history),
        ),
      );
    }
  }

  void calculate() {
    if (state.isError) return;

    try {
      final expression = state.expression;
      if (expression.isEmpty) return;

      final cleanExpression = expression.split('=').first.trim();
      final result = _evaluateExpression(cleanExpression);

      final displayResult =
          result == result.roundToDouble()
              ? result.round().toString()
              : result.toString();

      final calculation = '$cleanExpression = $displayResult';
      final newHistory = List<String>.from(state.history)..add(calculation);

      emit(
        state.copyWith(
          displayValue: displayResult,
          previousValue: '',
          operation: '',
          isNewOperation: true,
          hasDecimal: displayResult.contains('.'),
          history: newHistory,
          expression: calculation,
          currentInput: displayResult,
        ),
      );
    } catch (e) {
      emit(state.copyWith(displayValue: 'Error', isError: true));
    }
  }

  void clear() {
    emit(
      const CalculatorState(
        displayValue: '0',
        previousValue: '',
        operation: '',
        isNewOperation: true,
        hasDecimal: false,
        isError: false,
        history: [],
        expression: '',
        currentInput: '',
      ),
    );
  }

  void delete() {
    if (state.isError) {
      clear();
      return;
    }

    if (state.currentInput.isEmpty) {
      if (state.expression.isNotEmpty && !state.expression.contains('=')) {
        final parts = state.expression.split(' ');
        if (parts.length > 1) {
          final newExpression = parts.sublist(0, parts.length - 1).join(' ');
          emit(
            state.copyWith(
              expression: newExpression,
              operation: parts.length > 2 ? parts[parts.length - 3] : '',
              previousValue: parts.length > 2 ? parts[0] : '',
              displayValue:
                  parts.length > 2 ? parts[parts.length - 2] : parts[0],
              isNewOperation: false,
            ),
          );
        } else {
          clear();
        }
      }
    } else if (state.currentInput.length <= 1 || state.currentInput == '0') {
      final newExpression =
          state.expression.isNotEmpty
              ? state.expression.substring(0, state.expression.length - 1)
              : '';

      emit(
        state.copyWith(
          displayValue: '0',
          currentInput: '0',
          isNewOperation: true,
          hasDecimal: false,
          expression: newExpression,
        ),
      );
    } else {
      final newValue = state.currentInput.substring(
        0,
        state.currentInput.length - 1,
      );
      final newExpression =
          state.expression.isNotEmpty
              ? state.expression.substring(0, state.expression.length - 1)
              : '';

      emit(
        state.copyWith(
          displayValue: newValue,
          currentInput: newValue,
          hasDecimal: newValue.contains('.'),
          expression: newExpression,
        ),
      );
    }
  }

  double _evaluateExpression(String expression) {
    expression = expression.replaceAll(' ', '');

    while (expression.contains('(')) {
      final start = expression.lastIndexOf('(');
      final end = expression.indexOf(')', start);

      if (end == -1) throw const FormatException("Mismatched parentheses");

      final subExpression = expression.substring(start + 1, end);
      final subResult = _evaluateSimpleExpression(subExpression);

      expression = expression.replaceRange(
        start,
        end + 1,
        subResult.toString(),
      );
    }

    return _evaluateSimpleExpression(expression);
  }

  double _evaluateSimpleExpression(String expression) {
    final mdPattern = RegExp(r'(-?(?:\d+)?\.?\d+)([×÷%])(-?(?:\d+)?\.?\d+)');
    while (mdPattern.hasMatch(expression)) {
      expression = expression.replaceFirstMapped(mdPattern, (match) {
        final left = double.parse(match.group(1)!);
        final op = match.group(2)!;
        final right = double.parse(match.group(3)!);

        switch (op) {
          case '×':
            return (left * right).toString();
          case '÷':
            if (right == 0) throw const FormatException("Division by zero");
            return (left / right).toString();
          case '%':
            if (right == 0) throw const FormatException("Modulus by zero");
            return (left % right).toString();
          default:
            throw const FormatException("Unknown operator");
        }
      });
    }

    final asPattern = RegExp(r'(-?(?:\d+)?\.?\d+)([+\-])(-?(?:\d+)?\.?\d+)');
    while (asPattern.hasMatch(expression)) {
      expression = expression.replaceFirstMapped(asPattern, (match) {
        final left = double.parse(match.group(1)!);
        final op = match.group(2)!;
        final right = double.parse(match.group(3)!);

        return op == '+'
            ? (left + right).toString()
            : (left - right).toString();
      });
    }

    return double.parse(expression);
  }

  void percentage() {
    if (state.isError) return;

    if (!state.isNewOperation) {
      emit(
        state.copyWith(
          operation: '%',
          isNewOperation: true,
          expression: '${state.expression} %',
        ),
      );
    } else {
      emit(
        state.copyWith(
          operation: '%',
          isNewOperation: true,
          expression: '${state.displayValue} %',
        ),
      );
    }
  }
}
