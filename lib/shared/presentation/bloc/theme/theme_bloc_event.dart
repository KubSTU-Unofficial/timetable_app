part of 'theme_bloc.dart';

abstract class ThemeEvent {}

class SetThemeModeEvent extends ThemeEvent {
  final String themeModeName;
  SetThemeModeEvent(this.themeModeName);
}

class SetColorSchemeEvent extends ThemeEvent {
  final String colorSchemeName;
  SetColorSchemeEvent(this.colorSchemeName);
}

class InitializeThemesEvent extends ThemeEvent {}
