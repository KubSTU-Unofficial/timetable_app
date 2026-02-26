import 'package:flutter/material.dart';
import 'package:timetable_app/features/timetable_page/presentation/widgets/week_widget.dart';
import 'package:timetable_app/shared/domain/entities/lesson.dart';
import 'package:timetable_app/shared/presentation/theme/theme_getter_ext.dart';

class TwoWeekTimetable extends StatelessWidget {

	final List<Lesson> evenWeekLessons;
	final List<Lesson> oddWeekLessons;
	final Future<void> Function() onRefreshRequested;

  const TwoWeekTimetable({
		super.key,
		required this.evenWeekLessons,
		required this.oddWeekLessons,
		required this.onRefreshRequested,
	});
	@override
	Widget build(BuildContext context) {
		return Column(
			children: [
				SizedBox.square(
					child: Container(
						color: context.colors.background,
						child: TabBar(
							indicatorColor: context.colors.primary,
							indicatorWeight: 3.0,
							dividerHeight: 1.0,
							dividerColor: context.colors.primary,
							labelColor: context.colors.textFocused,
							tabs: [
								Tab(
									child: Text(
										style: TextStyle(
											color: context.colors.textAccent,
											fontSize: 18,
											fontWeight: FontWeight.bold,
										),
										'Четная',
									),
								),
								Tab(
									child: Text(
										style: TextStyle(
											color: context.colors.textAccent,
											fontSize: 18,
											fontWeight: FontWeight.bold,
										),
										'Нечетная',
									),
								),
							],
						),
					),
				),
				Expanded(
					child: TabBarView(
						children: [
							// Четная неделя
							WeekWidget(
								lessonsForWeek: evenWeekLessons,
								onRefreshRequested: onRefreshRequested,
							),
							// Нечетная неделя
							WeekWidget(
								lessonsForWeek: oddWeekLessons,
								onRefreshRequested: onRefreshRequested,
							),
						],
					),
				),
			],
		);
	}
}
