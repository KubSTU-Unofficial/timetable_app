import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timetable_app/features/exams_page/domain/entities/exam.dart';

//AppColors
import 'package:timetable_app/shared/presentation/theme/app_colors.dart';

// final String group;
// final String name;
// final DateTime date;
// final String classroom;
// final String teacher;
// final int year;
// final int semester;

class ExamsCardWidget extends StatefulWidget {
  const ExamsCardWidget({super.key, required this.exams});
  final Exam exams;
  @override
  State<ExamsCardWidget> createState() => _ExamsCardWidgetState();
}

class _ExamsCardWidgetState extends State<ExamsCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  color: AppColors.darkBrown,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 8, 0),
                    child: TextContainer(
                      text: DateFormat("dd.MM.yyyy").format(widget.exams.date),
                    ),
                  ),
                ),
                SizedBox(width: 5),

                Container(
                  color: AppColors.darkBrown,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextContainer(text: widget.exams.classroom),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: TextContainer(
                    text: DateFormat("HH:mm").format(widget.exams.date),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(children: [
                ],
              ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Expanded(
                    child: TextContainer(text: widget.exams.name, fontSize: 24),
                  ),
                ),
                SizedBox(width: 5),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: TextContainer(
                    text: widget.exams.teacher,
                    fontSize: 18,
                    color: AppColors.darkTextPrimary.withAlpha(150),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TextContainer extends StatelessWidget {
  const TextContainer({
    super.key,
    required this.text,
    this.fontSize = 18,
    this.color = AppColors.darkTextPrimary,
  });
  final String text;
  final int fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize.toDouble(),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
