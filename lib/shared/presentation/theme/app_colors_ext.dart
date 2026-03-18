import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
	// Основные
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color background;

  // Текст
  final Color textPrimary;
  final Color textSecondary;
  final Color textBody;
  final Color textInverse;
  final Color textAccent;
  final Color textFocused;

  // Фоны и декораторы
  final Color cardBackground;
  final Color coloredFieldBackground;
  final Color navigationBarBackground;
  final Color shadow;
  final Color divider;

  // Рамки
  final Color borderEnabled;
  final Color borderFocused;

  // Статусы и системные сообщения
  final Color error;
  final Color success;
  final Color warning;
  final Color info;

	AppColorsExtension({
		required this.primary, 
		required this.coloredFieldBackground, 
		required this.navigationBarBackground, 
		required this.accent, 
		required this.secondary, 
		required this.cardBackground, 
		required this.textPrimary, 
		required this.textSecondary,
    required this.textBody,
		required this.textInverse, 
		required this.textAccent, 
		required this.textFocused, 
		required this.error, 
		required this.success, 
		required this.warning, 
		required this.info, 
		required this.borderEnabled, 
		required this.borderFocused, 
		required this.divider, 
		required this.background, 
		required this.shadow
	});

	@override
	ThemeExtension<AppColorsExtension> copyWith() => AppColorsExtension(
		primary: primary, 
		coloredFieldBackground: coloredFieldBackground, 
		navigationBarBackground: navigationBarBackground, 
		accent: accent, 
		secondary: secondary, 
		cardBackground: cardBackground, 
		textPrimary: textPrimary, 
		textSecondary: textSecondary,
    textBody: textBody,
		textInverse: textInverse, 
		textAccent: textAccent, 
		textFocused: textFocused, 
		error: error, 
		success: success, 
		warning: warning, 
		info: info, 
		borderEnabled: borderEnabled, 
		borderFocused: borderFocused, 
		divider: divider, 
		background: background, 
		shadow: shadow
	);

	@override
	ThemeExtension<AppColorsExtension> lerp(ThemeExtension<AppColorsExtension>? other, double t) {
		if (other is! AppColorsExtension) return this;
		return AppColorsExtension(
			primary: Color.lerp(primary, other.primary, t)!,
			coloredFieldBackground: Color.lerp(coloredFieldBackground, other.coloredFieldBackground, t)!,
			navigationBarBackground: Color.lerp(navigationBarBackground, other.navigationBarBackground, t)!,
			accent: Color.lerp(accent, other.accent, t)!,
			secondary: Color.lerp(secondary, other.secondary, t)!,
			cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
			textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
			textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textBody: Color.lerp(textBody, other.textBody, t)!,
			textInverse: Color.lerp(textInverse, other.textInverse, t)!,
			textAccent: Color.lerp(textAccent, other.textAccent, t)!,
			textFocused: Color.lerp(textFocused, other.textFocused, t)!,
			error: Color.lerp(error, other.error, t)!,
			success: Color.lerp(success, other.success, t)!,
			warning: Color.lerp(warning, other.warning, t)!,
			info: Color.lerp(info, other.info, t)!,
			borderEnabled: Color.lerp(borderEnabled, other.borderEnabled, t)!,
			borderFocused: Color.lerp(borderFocused, other.borderFocused, t)!,
			divider: Color.lerp(divider, other.divider, t)!,
			background: Color.lerp(background, other.background, t)!,
			shadow: Color.lerp(shadow, other.shadow, t)!,
    );
  }

	ThemeData toThemeData(
		Brightness brightness,
	) => ThemeData(
    brightness: brightness,
    primaryColor: primary,
		extensions: [this]
	);
}
