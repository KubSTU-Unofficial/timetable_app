import 'package:flutter/material.dart';
import 'package:timetable_app/shared/presentation/theme/app_colors.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          selectedDate ??
          DateTime.now(), // Используем выбранную дату или текущую
      firstDate: DateTime(1800), // Минимальная дата
      lastDate: DateTime(2100), // Максимальная дата
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: AppColors.primary, // Цвет выделения (выбранная дата)
              onPrimary: AppColors.darkBackground, // Цвет текста на выделенной дате
              surface: AppColors.darkBackground, // Фон календаря
              onSurface: AppColors.textAccent, // Цвет текста дат
              background: AppColors.darkBackground, // Фон всего диалога
              onBackground: AppColors.textAccent, // Цвет текста в заголовке
            ),

            // Настройка текста
            textTheme: TextTheme(
              headlineSmall: TextStyle(
                color: AppColors.primary,
              ), // Заголовок (год)
              titleLarge: TextStyle(
                color: AppColors.primary,
              ), // Заголовок (месяц)
              bodyMedium: TextStyle(color: AppColors.textAccent), // Дни
              labelSmall: TextStyle(color: AppColors.textAccent), // Дни недели
            ),

            dialogBackgroundColor: AppColors.darkBackground,

            // Настройка AppBar внутри календаря
            appBarTheme: AppBarTheme(
              backgroundColor: AppColors.darkBackground,
              titleTextStyle: TextStyle(color: AppColors.primary, fontSize: 20),
              iconTheme: IconThemeData(color: AppColors.primary),
            ),

            // Настройка кнопок действий (OK/Отмена)
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary, // Цвет текста кнопок
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(5),
      child: FloatingActionButton(
        onPressed: () {
          _selectDate(context);
        },
        backgroundColor: AppColors.darkBackground,
        foregroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
          side: BorderSide(color: AppColors.primaryDark, width: 2),
        ),
        child: Icon(Icons.calendar_today),
      ),
    );
  }
}
