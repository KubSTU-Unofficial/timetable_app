import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timetable_app/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:timetable_app/features/home/presentation/widgets/home_page_tab.dart';

// Core

// Router

// Shared

//appcolors
import 'package:timetable_app/shared/presentation/theme/app_colors.dart';

//Widgets
import 'package:timetable_app/features/home/presentation/widgets/calendar.dart';
import 'package:timetable_app/shared/presentation/widgets/lessons_loading_bloc_manager.dart';
import 'package:timetable_app/shared/presentation/widgets/loading_indicator_block.dart';

class HomePage extends StatelessWidget {
	const HomePage({super.key});

	@override
	Widget build(BuildContext context) {
		return DefaultTabController(
			length: 3,
			initialIndex: 1,
			child: BlocBuilder<HomePageBloc, HomePageBlocState>(
				builder: (BuildContext context, HomePageBlocState state) { 
					return switch (state) {
						HomePageInitialState() => LoadingIndicatorBlock(),
						HomePageLoadedState(
							todayData: final todayData,
							tomorrowData: final tomorrowData,
							selectedDateData: final selectedDateData,
						) => Scaffold(
							floatingActionButton: Calendar(
								onPicked: (date) {
									context.read<HomePageBloc>().add(HomePageGetForDateEvent(date: date));
								},
							),
							floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
							backgroundColor: AppColors.darkBackground,
							body: SafeArea(
								child: LessonsLoadingBlocManager(
									child: Column(
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
																	'Дата',
																),
															),
															Tab(
																child: Text(
																	style: TextStyle(
																		color: AppColors.textAccent,
																		fontSize: 18,
																		fontWeight: FontWeight.bold,
																	),
																	'Сегодня',
																),
															),
															Tab(
																child: Text(
																	style: TextStyle(
																		color: AppColors.textAccent,
																		fontSize: 18,
																		fontWeight: FontWeight.bold,
																	),
																	'Завтра',
																),
															),
														],
													),
												),
											),
											Expanded(
												child: TabBarView(
													children: [
														//Пары на нужную дату
														HomePageTab(
															data: selectedDateData,
															onRetry: () {
																if (state.selectedDate == null) return;
																context.read<HomePageBloc>().add(HomePageGetForDateEvent(
																	date: state.selectedDate!,
																));
															},
														),
														//Пары на сегодня
														HomePageTab(
															data: todayData,
															onRetry: () => context.read<HomePageBloc>().add(HomePageGetForTodayEvent()),
														),
														// Пары на завтра
														HomePageTab(
															data: tomorrowData,
															onRetry: () => context.read<HomePageBloc>().add(HomePageGetForTomorrowEvent()),
														),
													],
												),
											),
										],
									),
								),
							),
						)
					};
				},
			),
		);
	}
}
