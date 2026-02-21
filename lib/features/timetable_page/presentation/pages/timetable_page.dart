import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timetable_app/features/timetable_page/presentation/bloc/timetable_page_bloc.dart';
import 'package:timetable_app/shared/domain/entities/lesson.dart';
import 'package:timetable_app/shared/presentation/widgets/lesson_widget.dart';
import 'package:timetable_app/shared/presentation/widgets/lessons_loading_bloc_manager.dart';

//Widgets


//Appcolor
import 'package:timetable_app/shared/presentation/theme/app_colors.dart';
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
				backgroundColor: AppColors.darkBackground,
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
												List<Lesson> evenWeekLessons = asyncSnapshot.data!.where((l) => l.timing.weeks!.isEven).toList();
												List<Lesson> oddWeekLessons = asyncSnapshot.data!.where((l) => !l.timing.weeks!.isEven).toList();

												return Column(
													children: [
														SizedBox.square(
															child: Container(
																color: AppColors.darkBackground,
																child: TabBar(
																	indicatorColor: AppColors.primary,
																	indicatorWeight: 3.0,
																	dividerHeight: 1.0,
																	dividerColor: AppColors.primary,
																	labelColor: AppColors.focusedText,
																	tabs: [
																		Tab(
																			child: Text(
																				style: TextStyle(
																					color: AppColors.textAccent,
																					fontSize: 18,
																					fontWeight: FontWeight.bold,
																				),
																				'Четная',
																			),
																		),
																		Tab(
																			child: Text(
																				style: TextStyle(
																					color: AppColors.textAccent,
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
																	Center(
																		child: Padding(
																			padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
																			child: RefreshIndicator(
																				onRefresh: onRefreshRequested,
																			  child: ListView.separated(
																			  	itemCount: evenWeekLessons.length,
																			  	separatorBuilder: (context, index) =>
																			  		SizedBox(height: 8),
																			  	itemBuilder: (context, index) =>
																			  		LessonWidget(
																			  			lesson: evenWeekLessons[index],
																			  		),
																			  ),
																			),
																		),
																	),
																	// Нечетная неделя
																	Center(
																		child: Padding(
																			padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
																			child: RefreshIndicator(
																				onRefresh: onRefreshRequested,
																			  child: ListView.separated(
																			  	itemCount: evenWeekLessons.length,
																			  	separatorBuilder: (context, index) =>
																			  		SizedBox(height: 8),
																			  	itemBuilder: (context, index) =>
																			  		LessonWidget(
																			  			lesson: oddWeekLessons[index],
																			  		),
																			  ),
																			),
																		),
																	),
																],
															),
														),
													],
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
