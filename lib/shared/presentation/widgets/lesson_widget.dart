import 'package:flutter/material.dart';
import 'package:timetable_app/shared/domain/entities/lesson.dart';
import 'package:timetable_app/shared/presentation/theme/app_colors.dart';

class LessonWidget extends StatelessWidget {
  const LessonWidget({super.key, required this.lesson});

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
      title: _Title(lesson: lesson),
      subtitle: Padding(
        padding: EdgeInsets.fromLTRB(46, 5, 0, 0),
        child: Text(
          lesson.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      showTrailingIcon: false,
      collapsedTextColor: Colors.black,
      backgroundColor: AppColors.darkSurface,
      collapsedBackgroundColor: AppColors.darkSurface,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: AppColors.focusedBorder, width: 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(3),
          topRight: Radius.circular(3),
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _Body(lesson: lesson),
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({required this.lesson});

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  color: AppColors.darkBrown,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 8),
                    child: Text(
                      "${lesson.timing.lessonNumber}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(width: 2, height: 22, color: AppColors.primary),
                Container(
                  color: AppColors.darkBrown,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      lesson.type.translation,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                if (lesson.classroom != null)
                  Container(
                    color: AppColors.darkBrown,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        lesson.classroom!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Text(
              lesson.timing.lessonTime,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.lesson});

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (lesson.timing.weeks != null)
          Texttile(
            text:
                "Период: с ${lesson.timing.weeks!.from} по ${lesson.timing.weeks!.to} неделю;",
          ),
        if (lesson.timing.date != null)
          Texttile(
            text:
                "Дата: ${lesson.timing.date!.day}.${lesson.timing.date!.month}.${lesson.timing.date!.year}",
          ),
        if (lesson.percentOfGroup != 100)
          Texttile(text: "Процент группы: ${lesson.percentOfGroup}"),
        if (lesson.isInLectureHall == true)
          Texttile(text: "В лекционной аудитории: да"),
        if (lesson.isOnline == true) Texttile(text: "Онлайн: да"),
        if (lesson.comment != null)
          Texttile(text: "Примечание: ${lesson.comment}"),
        if (lesson.teacherName != null)
          Texttile(text: "Преподователь: ${lesson.teacherName!}"),
      ],
    );
  }
}

class Texttile extends StatelessWidget {
  const Texttile({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Divider(color: AppColors.primary.withAlpha(100)),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
