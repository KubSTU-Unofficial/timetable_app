part of 'theme_bloc.dart';

sealed class ThemeBlocState {}

class ThemeBlocReadyState extends ThemeBlocState {
	final ThemeMode themeMode;
	final AppColorScheme colorScheme;

  ThemeBlocReadyState({required this.themeMode, required this.colorScheme});
}

class ThemeBlocNonInitializedState extends ThemeBlocState {}
