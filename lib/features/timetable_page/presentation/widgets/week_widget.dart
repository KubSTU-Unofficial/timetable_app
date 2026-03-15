import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timetable_app/shared/domain/entities/lesson.dart';
import 'package:timetable_app/shared/presentation/theme/theme_getter_ext.dart';
import 'package:timetable_app/shared/presentation/widgets/lesson_widget.dart';
import 'package:timetable_app/shared/utils/week_day_name_ext.dart';

class WeekWidget extends StatelessWidget {
  const WeekWidget({
    super.key,
    required this.lessonsForWeek,
    required this.onRefreshRequested,
  });

  final List<Lesson> lessonsForWeek;
  final Future<void> Function() onRefreshRequested;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
        child: RefreshIndicator(
          onRefresh: onRefreshRequested,
          color: context.colors.primary,
          child: ListView.separated(
            itemCount: 6,
            separatorBuilder: (context, index) => SizedBox(height: 8),
            itemBuilder: (context, index) {
              List<Lesson> lessonsForDay = lessonsForWeek
                  .where((l) => l.timing.weeks!.dayOfWeek == index + 1)
                  .toList();
              if (lessonsForDay.isEmpty) return SizedBox.shrink();
              return ExpansionTile(
                shape: InputBorder.none,
                collapsedShape: InputBorder.none,
                collapsedIconColor: context.colors.accent,
                iconColor: context.colors.primary,
                title: Builder(
                  builder: (context) {
                    DateTime? nextDate = lessonsForDay[0].timing.nextDate;
                    if (nextDate == null) {
                      return Text("Дата не определена");
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          nextDate.weekdayName,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat("dd.MM.yyyy").format(nextDate),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                children: [
                  ListView.separated(
                    itemCount: lessonsForDay.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      return LessonWidget(lesson: lessonsForDay[index]);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
