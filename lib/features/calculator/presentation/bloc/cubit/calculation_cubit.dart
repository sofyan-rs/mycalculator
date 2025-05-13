import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycalculator/features/calculator/domain/entities/calculation_entity.dart';

final initialCalculation = CalculationEntity(
  firstNumber: null,
  secondNumber: null,
  operator: null,
  result: null,
);

class CalculationCubit extends Cubit<CalculationEntity> {
  CalculationCubit() : super(initialCalculation);

  void setFirstNumber(double? firstNumber) {
    emit(state.copyWith(firstNumber: firstNumber));
  }

  void setSecondNumber(double? secondNumber) {
    emit(state.copyWith(secondNumber: secondNumber));
  }

  void setOperator(String operator) {
    emit(state.copyWith(operator: operator));
  }

  void setResult(String? result) {
    emit(state.copyWith(result: result));
  }

  void clearCalculation() {
    emit(initialCalculation);
  }
}
