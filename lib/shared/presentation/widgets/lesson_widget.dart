import 'package:flutter/material.dart';
import 'package:timetable_app/shared/domain/entities/lesson.dart';
import 'package:timetable_app/shared/presentation/theme/theme_getter_ext.dart';

class LessonWidget extends StatelessWidget {
  const LessonWidget({super.key, required this.lesson});

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.cardBackground,
        boxShadow: [
          BoxShadow(
            color: context.colors.shadow,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
        title: _Title(lesson: lesson),
        subtitle: Padding(
          padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
          child: Text(
            lesson.name,
            style: TextStyle(
              color: context.colors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        showTrailingIcon: false,
        collapsedTextColor: Colors.black,
        backgroundColor: context.colors.cardBackground,
        collapsedBackgroundColor: context.colors.cardBackground,
        shape: BorderDirectional(
          top: BorderSide(color: context.colors.borderFocused, width: 1),
          bottom: BorderSide(color: context.colors.borderFocused, width: 1),
          start: BorderSide.none,
          end: BorderSide.none,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _Body(lesson: lesson),
          ),
        ],
      ),
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
                  color: context.colors.coloredFieldBackground,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 8),
                    child: Text(
                      "${lesson.timing.lessonNumber}",
                      style: TextStyle(
                        color: context.colors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  color: context.colors.coloredFieldBackground,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      lesson.type.translation,
                      style: TextStyle(
                        color: context.colors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                if (lesson.classroom != null)
                  Container(
                    color: context.colors.coloredFieldBackground,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        lesson.classroom!,
                        style: TextStyle(
                          color: context.colors.textPrimary,
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
                color: context.colors.textPrimary,
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
    return Padding(
      padding: EdgeInsets.fromLTRB(13, 5, 0, 0),
      child: Column(
        children: [
          if (lesson.timing.weeks != null)
            TextTile(
              text:
                  "Период: с ${lesson.timing.weeks!.from} по ${lesson.timing.weeks!.to} неделю;",
            ),
          if (lesson.timing.date != null)
            TextTile(
              text:
                  "Дата: ${lesson.timing.date!.day}.${lesson.timing.date!.month}.${lesson.timing.date!.year}",
            ),
          if (lesson.percentOfGroup != 100)
            TextTile(text: "Процент группы: ${lesson.percentOfGroup}"),
          if (lesson.isInLectureHall == true)
            TextTile(text: "В лекционной аудитории: да"),
          if (lesson.isOnline == true) TextTile(text: "Онлайн: да"),
          if (lesson.comment != null)
            TextTile(text: "Примечание: ${lesson.comment}"),
          if (lesson.teacherName != null)
            TextTile(text: "${lesson.teacherName!}"),
        ],
      ),
    );
  }
}

class TextTile extends StatelessWidget {
  const TextTile({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Divider(color: context.colors.primary.withAlpha(100)),
        Text(
          text,
          style: TextStyle(
            color: context.colors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
