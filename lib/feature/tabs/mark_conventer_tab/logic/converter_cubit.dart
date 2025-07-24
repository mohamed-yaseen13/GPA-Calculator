import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/feature/tabs/mark_conventer_tab/logic/converter_state.dart';

class ConverterCubit extends Cubit<ConverterState> {
  ConverterCubit() : super(const ConverterState());

  void updateObtained(String value) =>
      emit(state.copyWith(obtainedMark: value));
  void updateTotal(String value) => emit(state.copyWith(totalMark: value));
  void updateConvertTo(String value) =>
      emit(state.copyWith(convertToTotal: value));

  void calculateConvertedResult() {
    final obtained = double.tryParse(state.obtainedMark);
    final total = double.tryParse(state.totalMark);
    final convertTo = double.tryParse(state.convertToTotal);

    if (obtained != null && total != null && convertTo != null && total != 0) {
      final result = (obtained / total) * convertTo;
      emit(state.copyWith(convertedResult: result.toStringAsFixed(2)));
    } else {
      emit(state.copyWith(convertedResult: ''));
    }
  }

  void reset() {
    emit(const ConverterState());
  }
}
