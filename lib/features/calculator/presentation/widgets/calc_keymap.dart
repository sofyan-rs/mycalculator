import 'package:flutter/material.dart';
import 'package:mycalculator/core/themes/app_colors.dart';
import 'package:mycalculator/features/calculator/presentation/widgets/calc_button.dart';
import 'package:solar_icons/solar_icons.dart';

class CalcKeymap extends StatelessWidget {
  const CalcKeymap({super.key});

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
                    onPressed: () {},
                    label: 'AC',
                    color: AppColors.secondary,
                  ),
                  CalcButton(
                    onPressed: () {},
                    icon: SolarIconsBold.backspace,
                    color: AppColors.secondary,
                  ),
                  CalcButton(
                    onPressed: () {},
                    label: '+/-',
                    fontSize: 20,
                    color: AppColors.secondary,
                  ),
                  CalcButton(
                    onPressed: () {},
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
                  CalcButton(onPressed: () {}, label: '7'),
                  CalcButton(onPressed: () {}, label: '8'),
                  CalcButton(onPressed: () {}, label: '9'),
                  CalcButton(
                    onPressed: () {},
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
                  CalcButton(onPressed: () {}, label: '4'),
                  CalcButton(onPressed: () {}, label: '5'),
                  CalcButton(onPressed: () {}, label: '6'),
                  CalcButton(
                    onPressed: () {},
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
                  CalcButton(onPressed: () {}, label: '1'),
                  CalcButton(onPressed: () {}, label: '2'),
                  CalcButton(onPressed: () {}, label: '3'),
                  CalcButton(
                    onPressed: () {},
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
                  CalcButton(onPressed: () {}, label: '%'),
                  CalcButton(onPressed: () {}, label: '0'),
                  CalcButton(onPressed: () {}, label: '.'),
                  CalcButton(
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
