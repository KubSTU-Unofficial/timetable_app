import 'dart:ui';
import 'package:timetable_app/shared/presentation/theme/app_color_scheme.dart';
import 'package:timetable_app/shared/presentation/theme/app_colors_ext.dart';

class ColorSchemesProvider {
	static Future<List<AppColorScheme>> colorSchemes() async  =>  [
		AppColorScheme(
			name: 'По умолчанию',
			light: AppColorsExtension(

				primary: Color(0xFFF97316),
				secondary: Color(0xFF475569),
				accent: Color(0xFFB45309),
				background: Color(0xFFFFFFFF),

				textPrimary: Color(0xFF0F172A),
				textSecondary: Color(0xFF64748B),
        textBody: Color(0xFF000000),
				textInverse: Color(0xFF94A3B8),
				textAccent: Color(0xFFEA580C),
				textFocused: Color(0xFFEA580C), 

				cardBackground: Color(0xFFF1F5F9),
				coloredFieldBackground: Color(0xFFFED7AA),
				navigationBarBackground: Color(0xFFFFFFFF),
				shadow: Color(0x1A000000),
				divider: Color(0xFFE2E8F0),

				borderEnabled: Color(0xFFFF7417),
				borderFocused: Color(0xFFF97316),

				error: Color(0xFFDC2626), 
				success: Color(0xFF059669),
				warning: Color(0xFFD97706),
				info: Color(0xFF2563EB),

			).toThemeData(Brightness.light),

			dark: AppColorsExtension(

				primary: Color(0xFFF97316),
				secondary: Color(0xFF03070E),
				accent: Color(0xFFD4AF37),
				background: Color(0xFF111318),

				textPrimary: Color(0xFFF1F5F9),
				textSecondary: Color(0xFF475569),
        textBody: Color(0xFFFFFFFF),
				textInverse: Color(0xFFF8FAFC),
				textAccent: Color(0xFFEA580C),
				textFocused: Color(0xFFEA580C),

				cardBackground: Color(0x08FFFFFF),
				coloredFieldBackground: Color(0x8f5c2200),
				navigationBarBackground: Color(0xFF1E293B),
				shadow: Color(0x32000000),
				divider: Color(0xFF1E293B),

				borderEnabled: Color(0xFFFDBA74),
				borderFocused: Color(0xFFF97316),

				error: Color(0xFFEF4444),
				success: Color(0xFF10B981),
				warning: Color(0xFFF59E0B),
				info: Color(0xFF3B82F6),

			).toThemeData(Brightness.dark)
		),

		AppColorScheme(
    name: 'Фиолетовая',
    light: AppColorsExtension(
        primary: Color(0xFF8B5CF6), // Фиолетовый (Violet 500)
        secondary: Color(0xFF4B5563), // Серо-синий
        accent: Color(0xFFD946EF), // Розовый (Fuchsia 500)
        background: Color(0xFFFFFFFF),

        textPrimary: Color(0xFF1E1B4B), // Очень темно-синий/фиолетовый
        textSecondary: Color(0xFF6B7280),
        textBody: Color(0xFF000000),
        textInverse: Color(0xFFF3F4F6),
        textAccent: Color(0xFFC026D3), // Глубокий розовый
        textFocused: Color(0xFF8B5CF6), 

        cardBackground: Color(0xFFF5F3FF), // Едва заметный фиолетовый оттенок
        coloredFieldBackground: Color(0xFFF0ABFC), // Светло-розовый
        navigationBarBackground: Color(0xFFFFFFFF),
        shadow: Color(0x1A4C1D95), // Тень с фиолетовым подтоном
        divider: Color(0xFFE5E7EB),

        borderEnabled: Color(0xFFE5E7EB),
        borderFocused: Color(0xFF8F5FFF),

        error: Color(0xFFDC2626), 
        success: Color(0xFF059669),
        warning: Color(0xFFD97706),
        info: Color(0xFF2563EB),
    ).toThemeData(Brightness.light),

    dark: AppColorsExtension(
        primary: Color(0xFFA78BFA), // Светло-фиолетовый (Violet 400)
        secondary: Color(0xFF1F2937),
        accent: Color(0xFFE879F9), // Светло-розовый
        background: Color(0xFF0F172A), // Глубокий темный индиго

        textPrimary: Color(0xFFF9FAFB),
        textSecondary: Color(0xFF94A3B8),
        textBody: Color(0xFFFFFFFF),
        textInverse: Color(0xFFF8FAFC),
        textAccent: Color(0xFFF0ABFC),
        textFocused: Color(0xFFC084FC),

        cardBackground: Color(0x1AFFFFFF),
        coloredFieldBackground: Color(0x4D701A75), // Темная фуксия
        navigationBarBackground: Color(0xFF1E1B4B),
        shadow: Color(0x32000000),
        divider: Color(0xFF334155),

        borderEnabled: Color(0xFF6D28D9),
        borderFocused: Color(0xFFA78BFA),

        error: Color(0xFFEF4444),
        success: Color(0xFF10B981),
        warning: Color(0xFFF59E0B),
        info: Color(0xFF3B82F6),
    ).toThemeData(Brightness.dark)
),

	]; 
}
