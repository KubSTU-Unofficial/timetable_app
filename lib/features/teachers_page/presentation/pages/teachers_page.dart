import 'package:flutter/material.dart';
// заглушка, макет будущей страницы не более

//Widgets
import 'package:timetable_app/features/exams_page/presentation/widgets/exams_card_widget.dart';
import 'package:timetable_app/features/exams_page/domain/entities/exam.dart';

//AppColors
import 'package:timetable_app/shared/presentation/theme/app_colors.dart';

class TeachersPage extends StatelessWidget {
  const TeachersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              ExamsCardWidget(
                exams: Exam(
                  group: "Группа 101",
                  name: "Математика",
                  date: DateTime(2024, 12, 25, 10, 0),
                  classroom: "Ауд. 301",
                  teacher: "Иванов И.И.",
                  year: 2024,
                  semester: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
