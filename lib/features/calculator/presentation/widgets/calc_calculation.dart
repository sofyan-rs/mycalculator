import 'package:flutter/material.dart';

class CalcCalculation extends StatefulWidget {
  const CalcCalculation({super.key});

  @override
  State<CalcCalculation> createState() => _CalcCalculationState();
}

class _CalcCalculationState extends State<CalcCalculation> {
  TextEditingController? _inputController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '2 + 2',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.5),
            ),
            textAlign: TextAlign.end,
          ),
          TextField(
            controller: _inputController,
            onChanged: (value) {
              // Only accept numbers and operators
              if (RegExp(r'^[0-9+\-*/().]*$').hasMatch(value)) {
                setState(() {
                  _inputController?.text = value;
                });
              } else {
                setState(() {
                  _inputController?.text = value.substring(0, value.length - 1);
                });
              }
            },
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            keyboardType: TextInputType.none,
            decoration: InputDecoration(
              border: InputBorder.none,
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
        ],
      ),
    );
  }
}
