import 'package:flutter/material.dart';
import 'package:timetable_app/shared/presentation/theme/app_colors_ext.dart';

extension ThemeGetter on BuildContext {
  AppColorsExtension get colors => Theme.of(this).extension<AppColorsExtension>()!;
  ColorScheme get scheme => Theme.of(this).colorScheme;
}
