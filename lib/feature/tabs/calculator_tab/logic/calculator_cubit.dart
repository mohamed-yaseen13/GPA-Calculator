import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/feature/tabs/calculator_tab/logic/calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorState());

  void inputNumber(String number) {
    if (state.isError) {
      clear();
    }

    if (number == '(' || number == ')') {
      emit(
        state.copyWith(
          expression: state.expression + number,
          isNewOperation: number == ')',
        ),
      );
      return;
    }

    if (state.isNewOperation) {
      emit(
        state.copyWith(
          displayValue: number,
          isNewOperation: false,
          hasDecimal: number == '.',
          expression:
              state.expression.contains('=')
                  ? number
                  : state.expression + number,
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
          expression: state.expression + number,
        ),
      );
    }
  }

  void inputOperation(String op) {
    if (state.isError) return;

    if (op == '-' && state.isNewOperation && state.operation == '-') {
      emit(
        state.copyWith(
          displayValue: '-',
          currentInput: '-',
          isNewOperation: false,
          expression: '${state.expression} -',
        ),
      );
      return;
    }

    if (!state.expression.contains('=')) {
      emit(
        state.copyWith(
          previousValue: state.displayValue,
          operation: op,
          isNewOperation: true,
          hasDecimal: false,
          currentInput: '',
          expression: '${state.expression} $op',
        ),
      );
    } else {
      final newExpression = '${state.displayValue} $op';
      emit(
        state.copyWith(
          previousValue: state.displayValue,
          operation: op,
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
      emit(
        state.copyWith(
          displayValue: '0',
          currentInput: '0',
          isNewOperation: true,
          hasDecimal: false,
          expression: '',
        ),
      );
    } else {
      final newValue = state.currentInput.substring(
        0,
        state.currentInput.length - 1,
      );
      emit(
        state.copyWith(
          displayValue: newValue,
          currentInput: newValue,
          hasDecimal: newValue.contains('.'),
          expression: newValue,
        ),
      );
    }
  }

  double _evaluateExpression(String expression) {
    expression = expression.replaceAll(' ', '');

    while (expression.contains('(')) {
      final start = expression.lastIndexOf('(');
      final end = expression.indexOf(')', start);

      if (end == -1) throw FormatException("Mismatched parentheses");

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
    final mdPattern = RegExp(r'(\-?\d+\.?\d*)([×÷%])(\-?\d+\.?\d*)');
    while (mdPattern.hasMatch(expression)) {
      expression = expression.replaceFirstMapped(mdPattern, (match) {
        final left = double.parse(match.group(1)!);
        final op = match.group(2)!;
        final right = double.parse(match.group(3)!);

        switch (op) {
          case '×':
            return (left * right).toString();
          case '÷':
            if (right == 0) throw FormatException("Division by zero");
            return (left / right).toString();
          case '%':
            if (right == 0) throw FormatException("Modulus by zero");
            return (left % right).toString();
          default:
            throw FormatException("Unknown operator");
        }
      });
    }

    final asPattern = RegExp(r'(\-?\d+\.?\d*)([+\-])(\-?\d+\.?\d*)');
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
