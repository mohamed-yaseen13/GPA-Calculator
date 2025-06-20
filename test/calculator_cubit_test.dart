import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:gpa_calculator/feature/tabs/calculator_tab/logic/calculator_cubit.dart';
import 'package:gpa_calculator/feature/tabs/calculator_tab/logic/calculator_state.dart';

void main() {
  group('CalculatorCubit', () {
    late CalculatorCubit calculator;

    setUp(() {
      calculator = CalculatorCubit();
    });

    tearDown(() {
      calculator.close();
    });

    test('initial state is correct', () {
      expect(calculator.state.displayValue, '0');
      expect(calculator.state.expression, '');
      expect(calculator.state.isError, false);
    });

    blocTest<CalculatorCubit, CalculatorState>(
      'inputNumber "7" updates display and expression',
      build: () => CalculatorCubit(),
      act: (cubit) => cubit.inputNumber('7'),
      expect:
          () => [
            isA<CalculatorState>().having(
              (s) => s.displayValue,
              'display',
              '7',
            ),
          ],
    );

    blocTest<CalculatorCubit, CalculatorState>(
      'inputOperation "+" after "7"',
      build: () => CalculatorCubit(),
      act: (cubit) {
        cubit.inputNumber('7');
        cubit.inputOperation('+');
      },
      expect:
          () => [
            isA<CalculatorState>().having(
              (s) => s.displayValue,
              'display',
              '7',
            ),
            isA<CalculatorState>().having(
              (s) => s.expression,
              'expression',
              '7 +',
            ),
          ],
    );

    blocTest<CalculatorCubit, CalculatorState>(
      'input decimal number "3.5"',
      build: () => CalculatorCubit(),
      act: (cubit) {
        cubit.inputNumber('3');
        cubit.inputNumber('.');
        cubit.inputNumber('5');
      },
      expect:
          () => [
            isA<CalculatorState>().having(
              (s) => s.displayValue,
              'display',
              '3',
            ),
            isA<CalculatorState>().having(
              (s) => s.displayValue,
              'display',
              '3.',
            ),
            isA<CalculatorState>().having(
              (s) => s.displayValue,
              'display',
              '3.5',
            ),
          ],
    );

    blocTest<CalculatorCubit, CalculatorState>(
      'calculate 2 + 3 = 5',
      build: () => CalculatorCubit(),
      act: (cubit) {
        cubit.inputNumber('2');
        cubit.inputOperation('+');
        cubit.inputNumber('3');
        cubit.calculate();
      },
      expect:
          () => [
            isA<CalculatorState>(),
            isA<CalculatorState>(),
            isA<CalculatorState>(),
            isA<CalculatorState>().having(
              (s) => s.displayValue,
              'display',
              '5',
            ),
          ],
    );

    blocTest<CalculatorCubit, CalculatorState>(
      'calculate (2 + 3) × 2 = 10',
      build: () => CalculatorCubit(),
      act: (cubit) {
        cubit.inputNumber('(');
        cubit.inputNumber('2');
        cubit.inputOperation('+');
        cubit.inputNumber('3');
        cubit.inputNumber(')');
        cubit.inputOperation('×');
        cubit.inputNumber('2');
        cubit.calculate();
      },
      expect:
          () => [
            isA<CalculatorState>(), // (
            isA<CalculatorState>(), // 2
            isA<CalculatorState>(), // +
            isA<CalculatorState>(), // 3
            isA<CalculatorState>(), // )
            isA<CalculatorState>(), // ×
            isA<CalculatorState>(), // 2
            isA<CalculatorState>().having(
              (s) => s.displayValue,
              'display',
              '10',
            ),
          ],
    );

    blocTest<CalculatorCubit, CalculatorState>(
      'percentage after 50 → display "50", expression ends with "%" ',
      build: () => CalculatorCubit(),
      act: (cubit) {
        cubit.inputNumber('5');
        cubit.inputNumber('0');
        cubit.percentage();
      },
      expect:
          () => [
            isA<CalculatorState>(),
            isA<CalculatorState>(),
            isA<CalculatorState>().having(
              (s) => s.expression,
              'expression',
              '50 %',
            ),
          ],
    );

    blocTest<CalculatorCubit, CalculatorState>(
      'delete removes last digit',
      build: () => CalculatorCubit(),
      act: (cubit) {
        cubit.inputNumber('8');
        cubit.inputNumber('9');
        cubit.delete();
      },
      expect:
          () => [
            isA<CalculatorState>(), // 8
            isA<CalculatorState>(), // 89
            isA<CalculatorState>().having(
              (s) => s.displayValue,
              'display',
              '8',
            ),
          ],
    );

    blocTest<CalculatorCubit, CalculatorState>(
      'clear resets everything',
      build: () => CalculatorCubit(),
      act: (cubit) {
        cubit.inputNumber('1');
        cubit.clear();
      },
      expect:
          () => [
            isA<CalculatorState>(),
            isA<CalculatorState>().having(
              (s) => s.displayValue,
              'display',
              '0',
            ),
          ],
    );

    blocTest<CalculatorCubit, CalculatorState>(
      'division by zero throws error',
      build: () => CalculatorCubit(),
      act: (cubit) {
        cubit.inputNumber('7');
        cubit.inputOperation('÷');
        cubit.inputNumber('0');
        cubit.calculate();
      },
      expect:
          () => [
            isA<CalculatorState>(), // 7
            isA<CalculatorState>(), // +
            isA<CalculatorState>(), // 0
            isA<CalculatorState>().having((s) => s.isError, 'error', true),
          ],
    );
  });
}
