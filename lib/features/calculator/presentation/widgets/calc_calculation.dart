import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycalculator/core/utils/format_number.dart';
import 'package:mycalculator/features/calculator/domain/entities/calculation_entity.dart';
import 'package:mycalculator/features/calculator/presentation/bloc/cubit/calculation_cubit.dart';

class CalcCalculation extends StatefulWidget {
  const CalcCalculation({super.key, required this.inputController});

  final TextEditingController inputController;

  @override
  State<CalcCalculation> createState() => _CalcCalculationState();
}

class _CalcCalculationState extends State<CalcCalculation> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onTextChanged(String value) {
    // Only allow valid characters
    if (RegExp(r'^[0-9+\-*/().]*$').hasMatch(value)) {
      setState(() {
        widget.inputController.text = value;
        _scrollToEnd();
      });
    } else {
      setState(() {
        widget.inputController.text = value.substring(0, value.length - 1);
        _scrollToEnd();
      });
    }
  }

  void _scrollToEnd() {
    // Slight delay ensures text has updated
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculationCubit, CalculationEntity>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (state.firstNumber != null)
                Text.rich(
                  TextSpan(
                    text: formatNumber(
                      input: state.firstNumber.toString(),
                      removeLastNol: true,
                    ),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    children: [
                      if (state.operator != null)
                        TextSpan(
                          text: ' ${state.operator} ',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      if (state.secondNumber != null)
                        TextSpan(
                          text: formatNumber(
                            input: state.secondNumber.toString(),
                            removeLastNol: true,
                          ),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                    ],
                  ),
                ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                controller: _scrollController,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 0),
                  child: IntrinsicWidth(
                    child: TextField(
                      maxLength: 20,
                      controller: widget.inputController,
                      readOnly: true,
                      onChanged: _onTextChanged,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      keyboardType: TextInputType.none,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: '',
                        hintText: '0',
                        hintStyle: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
