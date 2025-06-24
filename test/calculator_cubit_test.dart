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

    blocTest<CalculatorCubit, CalculatorState>(
      'expression: 5 × 0.5 = 2.5',
      build: () => CalculatorCubit(),
      act: (cubit) {
        cubit.inputNumber('5');
        cubit.inputOperation('×');
        cubit.inputNumber('0');
        cubit.inputNumber('.');
        cubit.inputNumber('5');
        cubit.calculate();
      },
      expect:
          () => [
            isA<CalculatorState>(), // 5
            isA<CalculatorState>(), // ×
            isA<CalculatorState>(), // 0
            isA<CalculatorState>(), // .
            isA<CalculatorState>(), // 0.5
            isA<CalculatorState>().having(
              (s) => s.displayValue,
              'result',
              '2.5',
            ),
          ],
    );

    blocTest<CalculatorCubit, CalculatorState>(
      '2 + 3 × 4 - 1 = 13',
      build: () => CalculatorCubit(),
      act: (c) {
        c.inputNumber('2');
        c.inputOperation('+');
        c.inputNumber('3');
        c.inputOperation('×');
        c.inputNumber('4');
        c.inputOperation('-');
        c.inputNumber('1');
        c.calculate();
      },
      expect:
          () => [
            ...List.generate(7, (_) => isA<CalculatorState>()),
            isA<CalculatorState>().having(
              (s) => s.displayValue,
              'result',
              '13',
            ),
          ],
    );

    blocTest<CalculatorCubit, CalculatorState>(
      '.5 + .5 = 1',
      build: () => CalculatorCubit(),
      act: (c) {
        c.inputNumber('.');
        c.inputNumber('5');
        c.inputOperation('+');
        c.inputNumber('.');
        c.inputNumber('5');
        c.calculate();
      },
      expect:
          () => [
            ...List.generate(5, (_) => isA<CalculatorState>()),
            isA<CalculatorState>().having((s) => s.displayValue, 'result', '1'),
          ],
    );

    //blocTest<CalculatorCubit, CalculatorState>(
    //  '(1 + (2 + 3)) × 2 = 12',
    //  build: () => CalculatorCubit(),
    //  act: (c) {
    //    c.inputNumber('(');
    //    c.inputNumber('1');
    //    c.inputOperation('+');
    //    c.inputNumber('(');
    //    c.inputNumber('2');
    //    c.inputOperation('+');
    //    c.inputNumber('3');
    //    c.inputNumber(')');
    //    c.inputNumber(')');
    //    c.inputOperation('×');
    //    c.inputNumber('2');
    //    c.calculate();
    //  },
    //  expect:
    //      () => [
    //        ...List.generate(12, (_) => isA<CalculatorState>()),
    //        isA<CalculatorState>().having(
    //          (s) => s.displayValue,
    //          'result',
    //          '12',
    //        ),
    //      ],
    //);

    blocTest<CalculatorCubit, CalculatorState>(
      'DEL after . should return to integer state',
      build: () => CalculatorCubit(),
      act: (c) {
        c.inputNumber('5');
        c.inputNumber('.');
        c.delete();
      },
      expect:
          () => [
            isA<CalculatorState>(), // 5
            isA<CalculatorState>(), // 5.
            isA<CalculatorState>().having(
              (s) => s.displayValue,
              'back to 5',
              '5',
            ),
          ],
    );

    blocTest<CalculatorCubit, CalculatorState>(
      'Prevent 3..5',
      build: () => CalculatorCubit(),
      act: (c) {
        c.inputNumber('3');
        c.inputNumber('.');
        c.inputNumber('.'); // should be ignored
        c.inputNumber('5');
      },
      expect:
          () => [
            isA<CalculatorState>(), // 3
            isA<CalculatorState>(), // 3.
            isA<CalculatorState>(), // 3.5 (ignores second dot)
          ],
    );

    // Complex expression with decimal and parentheses
    blocTest<CalculatorCubit, CalculatorState>(
      '(3.5 + 2.5) × 2 = 12',
      build: () => CalculatorCubit(),
      act: (c) {
        c.inputNumber('(');
        c.inputNumber('3');
        c.inputNumber('.');
        c.inputNumber('5');
        c.inputOperation('+');
        c.inputNumber('2');
        c.inputNumber('.');
        c.inputNumber('5');
        c.inputNumber(')');
        c.inputOperation('×');
        c.inputNumber('2');
        c.calculate();
      },
      expect:
          () => [
            ...List.generate(11, (_) => isA<CalculatorState>()),
            isA<CalculatorState>().having(
              (s) => s.displayValue,
              'result',
              '12',
            ),
          ],
    );

    // Expression reuse after equal
    //blocTest<CalculatorCubit, CalculatorState>(
    //  '5 + 2 = then × 2 = → 14',
    //  build: () => CalculatorCubit(),
    //  act: (c) {
    //    c.inputNumber('5');
    //    c.inputOperation('+');
    //    c.inputNumber('2');
    //    c.calculate(); // 7
    //    c.inputOperation('×');
    //    c.inputNumber('2');
    //    c.calculate(); // 14
    //  },
    //  expect:
    //      () => [
    //        ...List.generate(6, (_) => isA<CalculatorState>()),
    //        isA<CalculatorState>().having((s) => s.displayValue, '7', '7'),
    //        isA<CalculatorState>(), // ×
    //        isA<CalculatorState>(), // 2
    //        isA<CalculatorState>().having((s) => s.displayValue, '14', '14'),
    //      ],
    //);

    // Start with negative numbers
    //blocTest<CalculatorCubit, CalculatorState>(
    //  '(-5) + 3 = -2',
    //  build: () => CalculatorCubit(),
    //  act: (c) {
    //    c.inputOperation('-');
    //    c.inputNumber('5');
    //    c.inputOperation('+');
    //    c.inputNumber('3');
    //    c.calculate();
    //  },
    //  expect:
    //      () => [
    //        ...List.generate(5, (_) => isA<CalculatorState>()),
    //        isA<CalculatorState>().having(
    //          (s) => s.displayValue,
    //          'result',
    //          '-2',
    //        ),
    //      ],
    //);
  });
}
