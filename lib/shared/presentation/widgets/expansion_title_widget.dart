import 'package:flutter/material.dart';
import 'package:timetable_app/shared/domain/entities/lesson.dart';
import 'package:timetable_app/shared/presentation/theme/app_colors.dart';

//utils
import 'package:timetable_app/shared/utils/number_lesson_to_time.dart';

class ExpansionTitleWidget extends StatefulWidget {
  final Lesson lesson;
  
  const ExpansionTitleWidget({super.key, required this.lesson});

  @override
  State<ExpansionTitleWidget> createState() => _ExpansionTitleWidgetState();
}

class _ExpansionTitleWidgetState extends State<ExpansionTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        widget.lesson.name,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.textAccent,
        ),
      ),
      subtitle: Text(
        '${widget.lesson.timing.lessonNumber} пара: ${getLessonTime(widget.lesson.timing.lessonNumber)}',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.accent,
        ),
      ),
      iconColor: AppColors.focusedBorder,
      collapsedIconColor: AppColors.enabledBorder,
      textColor: AppColors.textAccent,
      collapsedTextColor: Colors.black,
      backgroundColor: AppColors.darkBackground,
      collapsedBackgroundColor: AppColors.darkBackground,
      collapsedShape: const RoundedRectangleBorder(
        side: BorderSide(color: AppColors.enabledBorder, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(3)),
      ),
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: AppColors.focusedBorder, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(3)),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  '[${widget.lesson.type.translation}]',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accent,
                  ),
                ),
                Divider(color: AppColors.divider),
                Text(
                  'Преподователь: ${widget.lesson.teacherName}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accent,
                  ),
                ),
                Divider(color: AppColors.divider),
                Text(
                  'Аудитория: ${widget.lesson.classroom}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accent,
                  ),
                ),
                Divider(color: AppColors.divider),
                if (widget.lesson.timing.weeks != null)
                  Text(
                    'Период: ${widget.lesson.timing.weeks!.from}-${widget.lesson.timing.weeks!.to} неделю',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.accent,
                    ),
                  ),
                Divider(color: AppColors.divider),
                Text(
                  'Процент группы: ${widget.lesson.percentOfGroup}%',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accent,
                  ),
                ),
                Divider(color: AppColors.divider),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
