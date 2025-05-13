import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mycalculator/core/common/bloc/app_theme_cubit/app_theme_cubit.dart';
import 'package:mycalculator/core/common/entities/app_theme_entity.dart';
import 'package:mycalculator/core/themes/app_themes.dart';
import 'package:mycalculator/features/calculator/presentation/bloc/cubit/calculation_cubit.dart';
import 'package:mycalculator/features/calculator/presentation/screens/calculator_screen.dart';
import 'package:mycalculator/init_dependencies.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb
            ? HydratedStorageDirectory.web
            : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  // Initialize dependencies
  await initDependencies();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyCalculatorApp()));
}

class MyCalculatorApp extends StatelessWidget {
  const MyCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AppThemeCubit>()),
        BlocProvider(create: (context) => sl<CalculationCubit>()),
      ],
      child: BlocBuilder<AppThemeCubit, AppThemeEntity>(
        builder: (context, state) {
          return MaterialApp(
            title: 'MyCalculator',
            debugShowCheckedModeBanner: false,
            themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            theme: AppThemes().lightTheme,
            darkTheme: AppThemes().darkTheme,
            home: const CalculatorScreen(),
          );
        },
      ),
    );
  }
}
