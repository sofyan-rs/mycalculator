import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycalculator/core/themes/app_colors.dart';
import 'package:mycalculator/core/utils/format_number.dart';
import 'package:mycalculator/features/calculator/presentation/bloc/cubit/calculation_cubit.dart';
import 'package:mycalculator/features/calculator/presentation/widgets/calc_button.dart';
import 'package:solar_icons/solar_icons.dart';

class CalcKeymap extends StatefulWidget {
  const CalcKeymap({super.key, required this.inputController});

  final TextEditingController inputController;

  @override
  State<CalcKeymap> createState() => _CalcKeymapState();
}

class _CalcKeymapState extends State<CalcKeymap> {
  void _onOperatorPressed(String operator) {
    context.read<CalculationCubit>().setOperator(operator);
    String input = widget.inputController.text.replaceAll(',', '');
    if (input.isEmpty) {
      return;
    }
    final calculation = context.read<CalculationCubit>().state;
    final currentValue = double.tryParse(input);
    if (calculation.result != null) {
      context.read<CalculationCubit>().setFirstNumber(currentValue ?? 0);
      context.read<CalculationCubit>().setSecondNumber(null);
      context.read<CalculationCubit>().setResult(null);
      widget.inputController.clear();
      return;
    }
    if (calculation.firstNumber == null) {
      context.read<CalculationCubit>().setFirstNumber(currentValue ?? 0);
      widget.inputController.clear();
    } else {
      _calculateResult();
    }
  }

  void _onNumberPressed(String number) {
    final calculation = context.read<CalculationCubit>().state;
    if (calculation.result != null) {
      context.read<CalculationCubit>().setFirstNumber(null);
      context.read<CalculationCubit>().setSecondNumber(null);
      context.read<CalculationCubit>().setResult(null);
      widget.inputController.clear();
    }
    widget.inputController.text += number;
    widget.inputController.text = formatNumber(
      input: widget.inputController.text,
    );
  }

  void _clearInput() {
    widget.inputController.clear();
    context.read<CalculationCubit>().clearCalculation();
  }

  void _deleteLastCharacter() {
    if (widget.inputController.text.isNotEmpty) {
      widget.inputController.text = widget.inputController.text.substring(
        0,
        widget.inputController.text.length - 1,
      );
      widget.inputController.text = formatNumber(
        input: widget.inputController.text,
      );
    }
  }

  void _toggleSign() {
    if (widget.inputController.text.isNotEmpty) {
      if (widget.inputController.text.startsWith('-')) {
        widget.inputController.text = widget.inputController.text.substring(1);
      } else {
        widget.inputController.text = '-${widget.inputController.text}';
      }
    }
  }

  void _addPercentage() {
    String input = widget.inputController.text.replaceAll(',', '');
    if (input.isNotEmpty) {
      final currentValue = double.tryParse(input);
      if (currentValue != null) {
        final percentageValue = currentValue / 100;
        widget.inputController.text = formatNumber(
          input: percentageValue.toString(),
          removeLastNol: true,
        );
      }
    }
  }

  void _addDecimal() {
    if (widget.inputController.text.isNotEmpty &&
        !widget.inputController.text.contains('.')) {
      widget.inputController.text += '.';
    }
  }

  void _calculateResult() {
    String input = widget.inputController.text.replaceAll(',', '');
    if (input.isEmpty) {
      return;
    }

    var calculation = context.read<CalculationCubit>().state;

    if (calculation.result != null) {
      context.read<CalculationCubit>().setFirstNumber(
        double.tryParse(input) ?? 0,
      );
    } else {
      context.read<CalculationCubit>().setSecondNumber(
        double.tryParse(input) ?? 0,
      );
    }

    calculation = context.read<CalculationCubit>().state;

    if (calculation.firstNumber != null &&
        calculation.secondNumber != null &&
        calculation.operator != null) {
      double result;
      switch (calculation.operator) {
        case '+':
          result = calculation.firstNumber! + calculation.secondNumber!;
          break;
        case '-':
          result = calculation.firstNumber! - calculation.secondNumber!;
          break;
        case '×':
          result = calculation.firstNumber! * calculation.secondNumber!;
          break;
        case '÷':
          result = calculation.firstNumber! / calculation.secondNumber!;
          break;
        default:
          return;
      }
      context.read<CalculationCubit>().setResult(result.toString());
      widget.inputController.text = formatNumber(
        input: result.toString(),
        removeLastNol: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    inputController: widget.inputController,
                    onPressed: _clearInput,
                    label: 'AC',
                    color: AppColors.secondary,
                  ),
                  CalcButton(
                    inputController: widget.inputController,
                    onPressed: _deleteLastCharacter,
                    icon: SolarIconsBold.backspace,
                    color: AppColors.secondary,
                  ),
                  CalcButton(
                    inputController: widget.inputController,
                    onPressed: _toggleSign,
                    label: '+/-',
                    fontSize: 20,
                    color: AppColors.secondary,
                  ),
                  CalcButton(
                    inputController: widget.inputController,
                    onPressed: () {
                      _onOperatorPressed('÷');
                    },
                    label: '÷',
                    color: AppColors.primary,
                    fontSize: 32,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    inputController: widget.inputController,
                    onPressed: () {
                      _onNumberPressed('7');
                    },
                    label: '7',
                  ),
                  CalcButton(
                    inputController: widget.inputController,
                    onPressed: () {
                      _onNumberPressed('8');
                    },
                    label: '8',
                  ),
                  CalcButton(
                    inputController: widget.inputController,
                    onPressed: () {
                      _onNumberPressed('9');
                    },
                    label: '9',
                  ),
                  CalcButton(
                    inputController: widget.inputController,
                    onPressed: () {
                      _onOperatorPressed('×');
                    },
                    label: '×',
                    color: AppColors.primary,
                    fontSize: 32,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    inputController: widget.inputController,
                    onPressed: () {
                      _onNumberPressed('4');
                    },
                    label: '4',
                  ),
                  CalcButton(
                    inputController: widget.inputController,
                    onPressed: () {
                      _onNumberPressed('5');
                    },
                    label: '5',
                  ),
                  CalcButton(
                    inputController: widget.inputController,
                    onPressed: () {
                      _onNumberPressed('6');
                    },
                    label: '6',
                  ),
                  CalcButton(
                    inputController: widget.inputController,
                    onPressed: () {
                      _onOperatorPressed('-');
                    },
                    label: '-',
                    color: AppColors.primary,
                    fontSize: 32,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    inputController: widget.inputController,
                    onPressed: () {
                      _onNumberPressed('1');
                    },
                    label: '1',
                  ),
                  CalcButton(
                    inputController: widget.inputController,
                    onPressed: () {
                      _onNumberPressed('2');
                    },
                    label: '2',
                  ),
                  CalcButton(
                    inputController: widget.inputController,
                    onPressed: () {
                      _onNumberPressed('3');
                    },
                    label: '3',
                  ),
                  CalcButton(
                    inputController: widget.inputController,
                    onPressed: () {
                      _onOperatorPressed('+');
                    },
                    label: '+',
                    color: AppColors.primary,
                    fontSize: 32,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    inputController: widget.inputController,
                    onPressed: _addPercentage,
                    label: '%',
                  ),
                  CalcButton(
                    inputController: widget.inputController,
                    onPressed: () {
                      _onNumberPressed('0');
                    },
                    label: '0',
                  ),
                  CalcButton(
                    inputController: widget.inputController,
                    onPressed: _addDecimal,
                    label: '.',
                  ),
                  CalcButton(
                    inputController: widget.inputController,
                    onPressed: _calculateResult,
                    label: '=',
                    color: AppColors.primary,
                    fontSize: 32,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
