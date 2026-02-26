import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timetable_app/features/timetable_page/presentation/bloc/timetable_page_bloc.dart';
import 'package:timetable_app/features/timetable_page/presentation/widgets/two_week_timetable.dart';
import 'package:timetable_app/shared/domain/entities/lesson.dart';
import 'package:timetable_app/shared/presentation/theme/theme_getter_ext.dart';
import 'package:timetable_app/shared/presentation/widgets/lesson_widget.dart';
import 'package:timetable_app/shared/presentation/widgets/lessons_loading_bloc_manager.dart';
import 'package:timetable_app/shared/presentation/widgets/error_message_block.dart';

class TimetablePage extends StatefulWidget {
	const TimetablePage({super.key});

	@override
	State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
	@override
	Widget build(BuildContext context) {
		return DefaultTabController(
			length: 2,
			child: Scaffold(
				backgroundColor: context.colors.background,
				body: SafeArea(
					child: LessonsLoadingBlocManager(
						builder: (BuildContext context, Future<void> Function() onRefreshRequested) { 
							return BlocBuilder<TimetablePageBloc, TimetablePageBlocState>(
								builder: (BuildContext context, TimetablePageBlocState state) {
									return switch (state) {
										TimetablePageInitialState() => SizedBox.shrink(),
										TimetablePageErrorState(error: final error) =>
										ErrorMessageBlock(
											errorMessage: error,
											circumstances: "загрузке пар из базы данных",
											onRetry: () {
												context.read<TimetablePageBloc>().add(
													TimetablePageLessonsRequested(),
												);
											},
										),
										TimetablePageLoadedState(lessons: final lessons) =>
										StreamBuilder(
											stream: lessons,
											builder: (context, asyncSnapshot) {
												if (asyncSnapshot.data == null) {
													return SizedBox.shrink();
												}
												// Для очников
												if (asyncSnapshot.data!.first.timing.weeks != null) {

													List<Lesson> evenWeekLessons = asyncSnapshot.data!.where((l) => l.timing.weeks!.isEven).toList();
													List<Lesson> oddWeekLessons = asyncSnapshot.data!.where((l) => !l.timing.weeks!.isEven).toList();

													return TwoWeekTimetable(
														evenWeekLessons: evenWeekLessons,
														oddWeekLessons: oddWeekLessons,
														onRefreshRequested: onRefreshRequested,
													);
												}
												// Для заочников, тоже нужно будет потом сделать нормально
												return ListView.separated(
													itemCount: asyncSnapshot.data!.length,
													separatorBuilder: (context, index) =>
														SizedBox(height: 8),
													itemBuilder: (context, index) => LessonWidget(lesson: asyncSnapshot.data![index]),
												);
											},
										),
									};
								},
							);
						},
					),
				),
			),
		);
	}
}
