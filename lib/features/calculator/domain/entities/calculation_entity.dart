const _unset = Object();

class CalculationEntity {
  final double? firstNumber;
  final double? secondNumber;
  final String? operator;
  final String? result;

  CalculationEntity({
    this.firstNumber,
    this.secondNumber,
    this.operator,
    this.result,
  });

  CalculationEntity copyWith({
    Object? firstNumber = _unset,
    Object? secondNumber = _unset,
    Object? operator = _unset,
    Object? result = _unset,
  }) {
    return CalculationEntity(
      firstNumber:
          firstNumber == _unset ? this.firstNumber : firstNumber as double?,
      secondNumber:
          secondNumber == _unset ? this.secondNumber : secondNumber as double?,
      operator: operator == _unset ? this.operator : operator as String?,
      result: result == _unset ? this.result : result as String?,
    );
  }
}
