import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetable_app/core/di/get_it.dart';
import 'package:timetable_app/shared/data/shared_prefs_keys.dart';
import 'package:timetable_app/shared/presentation/theme/app_color_scheme.dart';

part 'theme_bloc_event.dart';
part 'theme_bloc_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeBlocState> {
  ThemeBloc() : super(ThemeBlocNonInitializedState()) {

		on<InitializeThemesEvent>((event, emit) async {
			String? themeModeName = getIt.get<SharedPreferences>().getString(themeModeKey);
			ThemeMode themeMode = _getThemeModeByName(themeModeName ?? ThemeMode.system.name);

			String? colorSchemeName = getIt.get<SharedPreferences>().getString(colorSchemeNameKey);
			AppColorScheme colorScheme = _getColorSchemeByName(colorSchemeName ?? getIt.get<List<AppColorScheme>>()[0].name);

			emit(ThemeBlocReadyState(themeMode: themeMode, colorScheme: colorScheme));
		});
    
    on<SetThemeModeEvent>((event, emit) {
			if (state is! ThemeBlocReadyState) return;
			ThemeMode themeMode = _getThemeModeByName(event.themeModeName);
			getIt.get<SharedPreferences>().setString(themeModeKey, themeMode.name);
      emit(
				ThemeBlocReadyState(
					themeMode: themeMode,
					colorScheme: (state as ThemeBlocReadyState).colorScheme,
				)
			);
    });

    on<SetColorSchemeEvent>((event, emit) {
			if (state is! ThemeBlocReadyState) return;
			AppColorScheme colorScheme = _getColorSchemeByName(event.colorSchemeName);
			getIt.get<SharedPreferences>().setString(colorSchemeNameKey, colorScheme.name);
      emit(
				ThemeBlocReadyState(
					themeMode: (state as ThemeBlocReadyState).themeMode,
					colorScheme: colorScheme,
				)
			);
    });
  }

	ThemeMode _getThemeModeByName(String name) => ThemeMode.values.singleWhere(
		(e) => e.name == name, orElse: () => ThemeMode.system
	);

	AppColorScheme _getColorSchemeByName(String name) => getIt.get<List<AppColorScheme>>().singleWhere(
		(e) => e.name == name, orElse: () => getIt.get<List<AppColorScheme>>()[0]
	);
}
