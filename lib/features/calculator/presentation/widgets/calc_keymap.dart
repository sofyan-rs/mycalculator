import 'package:flutter/material.dart';
import 'package:mycalculator/core/themes/app_colors.dart';
import 'package:mycalculator/features/calculator/presentation/widgets/calc_button.dart';
import 'package:solar_icons/solar_icons.dart';

class CalcKeymap extends StatelessWidget {
  const CalcKeymap({super.key, required this.inputController});

  final TextEditingController inputController;

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
                    inputController: inputController,
                    onPressed: () {
                      inputController.clear();
                    },
                    label: 'AC',
                    color: AppColors.secondary,
                  ),
                  CalcButton(
                    inputController: inputController,
                    onPressed: () {
                      if (inputController.text.isNotEmpty) {
                        // Remove the last character from the input
                        inputController.text = inputController.text.substring(
                          0,
                          inputController.text.length - 1,
                        );
                      }
                    },
                    icon: SolarIconsBold.backspace,
                    color: AppColors.secondary,
                  ),
                  CalcButton(
                    inputController: inputController,
                    onPressed: () {
                      // Only add parentheses to the last number after an operator
                      // 1 => (-1)
                      // 1 + 2 => 1 + (-2)
                      // 1 x 2 + 5 => 1 x 2 + (-5)
                      // 2 + 2 / 2 => 2 + 2 / (-2)
                    },
                    label: '+/-',
                    fontSize: 20,
                    color: AppColors.secondary,
                  ),
                  CalcButton(
                    inputController: inputController,
                    onPressed: () {
                      inputController.text += '/';
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
                    inputController: inputController,
                    onPressed: () {
                      inputController.text += '7';
                    },
                    label: '7',
                  ),
                  CalcButton(
                    inputController: inputController,
                    onPressed: () {
                      inputController.text += '8';
                    },
                    label: '8',
                  ),
                  CalcButton(
                    inputController: inputController,
                    onPressed: () {
                      inputController.text += '9';
                    },
                    label: '9',
                  ),
                  CalcButton(
                    inputController: inputController,
                    onPressed: () {
                      inputController.text += '×';
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
                    inputController: inputController,
                    onPressed: () {
                      inputController.text += '4';
                    },
                    label: '4',
                  ),
                  CalcButton(
                    inputController: inputController,
                    onPressed: () {
                      inputController.text += '5';
                    },
                    label: '5',
                  ),
                  CalcButton(
                    inputController: inputController,
                    onPressed: () {
                      inputController.text += '6';
                    },
                    label: '6',
                  ),
                  CalcButton(
                    inputController: inputController,
                    onPressed: () {
                      inputController.text += '-';
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
                    inputController: inputController,
                    onPressed: () {
                      inputController.text += '1';
                    },
                    label: '1',
                  ),
                  CalcButton(
                    inputController: inputController,
                    onPressed: () {
                      inputController.text += '2';
                    },
                    label: '2',
                  ),
                  CalcButton(
                    inputController: inputController,
                    onPressed: () {
                      inputController.text += '3';
                    },
                    label: '3',
                  ),
                  CalcButton(
                    inputController: inputController,
                    onPressed: () {
                      inputController.text += '+';
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
                    inputController: inputController,
                    onPressed: () {
                      inputController.text += '%';
                    },
                    label: '%',
                  ),
                  CalcButton(
                    inputController: inputController,
                    onPressed: () {
                      inputController.text += '0';
                    },
                    label: '0',
                  ),
                  CalcButton(
                    inputController: inputController,
                    onPressed: () {
                      // Only add a decimal point if there isn't one already
                      if (!inputController.text.contains('.')) {
                        inputController.text += '.';
                      }
                    },
                    label: '.',
                  ),
                  CalcButton(
                    inputController: inputController,
                    onPressed: () {},
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
