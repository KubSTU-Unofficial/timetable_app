import 'package:flutter/material.dart';
import 'package:timetable_app/shared/presentation/theme/theme_getter_ext.dart';

Future<void> showDateSelector(
	BuildContext context, 
	void Function(DateTime data) onPicked,
) async {
	final DateTime? pickedDate = await showDatePicker(
		context: context,
		initialDate: DateTime.now(), // Используем выбранную дату или текущую
		firstDate: DateTime(1800), // Минимальная дата
		lastDate: DateTime(2100), // Максимальная дата
		builder: (BuildContext context, Widget? child) {
			return Theme(
				data: ThemeData.dark().copyWith(
					colorScheme: ColorScheme.dark(
						primary: context.colors.primary, // Цвет выделения (выбранная дата)
						onPrimary: context.colors.background, // Цвет текста на выделенной дате
						surface: context.colors.background, // Фон календаря
						onSurface: context.colors.textAccent, // Цвет текста дат
					),

					// Настройка текста
					textTheme: TextTheme(
						headlineSmall: TextStyle(
							color: context.colors.primary,
						), // Заголовок (год)
						titleLarge: TextStyle(
							color: context.colors.primary,
						), // Заголовок (месяц)
						bodyMedium: TextStyle(color: context.colors.textAccent), // Дни
						labelSmall: TextStyle(color: context.colors.textAccent), // Дни недели
					),

					dialogTheme: DialogThemeData(
						backgroundColor: context.colors.background,
					),

					// Настройка AppBar внутри календаря
					appBarTheme: AppBarTheme(
						backgroundColor: context.colors.background,
						titleTextStyle: TextStyle(color: context.colors.primary, fontSize: 20),
						iconTheme: IconThemeData(color: context.colors.primary),
					),

					// Настройка кнопок действий (OK/Отмена)
					textButtonTheme: TextButtonThemeData(
						style: TextButton.styleFrom(
							foregroundColor: context.colors.primary, // Цвет текста кнопок
						),
					),
				),
				child: child!,
			);
		},
	);

	if (pickedDate != null) {
			onPicked(pickedDate);
		}
}
