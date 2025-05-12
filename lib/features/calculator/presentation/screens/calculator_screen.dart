import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycalculator/core/common/bloc/app_theme_cubit/app_theme_cubit.dart';
import 'package:mycalculator/core/common/entities/app_theme_entity.dart';
import 'package:mycalculator/features/calculator/presentation/widgets/calc_calculation.dart';
import 'package:mycalculator/features/calculator/presentation/widgets/calc_keymap.dart';
import 'package:solar_icons/solar_icons.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _inputController = TextEditingController();

  void _toggleTheme() {
    context.read<AppThemeCubit>().toggleTheme();
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        title: BlocBuilder<AppThemeCubit, AppThemeEntity>(
          builder: (context, state) {
            return Container(
              width: 100,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: !state.isDarkMode ? null : _toggleTheme,
                    icon: Icon(SolarIconsBold.sun),
                  ),
                  IconButton(
                    onPressed: state.isDarkMode ? null : _toggleTheme,
                    icon: Icon(SolarIconsBold.moon),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      body: Column(
        children: [
          CalcCalculation(inputController: _inputController),
          CalcKeymap(inputController: _inputController),
        ],
      ),
    );
  }
}
