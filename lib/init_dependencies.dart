import 'package:get_it/get_it.dart';
import 'package:mycalculator/core/common/bloc/app_theme_cubit/app_theme_cubit.dart';
import 'package:mycalculator/features/calculator/presentation/bloc/cubit/calculation_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> initDependencies() async {
  _initThemes();
  _initCalculation();
}

void _initThemes() {
  sl.registerLazySingleton(() => AppThemeCubit());
}

void _initCalculation() {
  sl.registerLazySingleton(() => CalculationCubit());
}
