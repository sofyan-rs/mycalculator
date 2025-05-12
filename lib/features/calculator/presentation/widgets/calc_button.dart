import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycalculator/core/common/bloc/app_theme_cubit/app_theme_cubit.dart';
import 'package:mycalculator/core/common/entities/app_theme_entity.dart';
import 'package:mycalculator/core/themes/app_colors.dart';

class CalcButton extends StatelessWidget {
  const CalcButton({
    super.key,
    required this.inputController,
    required this.onPressed,
    this.label,
    this.icon,
    this.fontSize,
    this.color,
  });

  final TextEditingController inputController;
  final String? label;
  final IconData? icon;
  final VoidCallback onPressed;
  final double? fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeEntity>(
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              width: 80,
              height: 70,
              decoration: BoxDecoration(
                color:
                    state.isDarkMode
                        ? AppColors.darkBackground
                        : AppColors.lightBackground,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null)
                        Icon(
                          icon,
                          size: fontSize ?? 30,
                          color:
                              color ?? Theme.of(context).colorScheme.onSurface,
                        ),
                      if (label != null)
                        Text(
                          label ?? '',
                          style: TextStyle(
                            fontSize: fontSize ?? 24,
                            fontWeight: FontWeight.w500,
                            color:
                                color ??
                                Theme.of(context).colorScheme.onSurface,
                          ),
                          textAlign: TextAlign.center,
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onPressed,
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
