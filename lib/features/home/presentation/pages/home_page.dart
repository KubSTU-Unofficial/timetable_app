import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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
import 'package:timetable_app/shared/utils/week_day_name_ext.dart';
import 'package:timetable_app/shared/utils/week_of_year_ext.dart';

class HomePage extends StatefulWidget {
	const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

	String _determineNextDayTabName(DateTime? nextDate) {
		if (nextDate == null) return "";
		DateTime now = DateTime.now();
		if (nextDate.difference(now).inDays > 13) {
			return "${nextDate.day}.${nextDate.month}.${nextDate.year}";
		}
		if (nextDate.difference(now).inDays == 1) { return "Послезавтра"; }
		if (nextDate.difference(now).inDays == 0) { return "Завтра"; }
		if (nextDate.weekOfYear % 2 == now.weekOfYear % 2 || nextDate.weekday < now.weekday) {
			return nextDate.weekdayName;
		}
		if (nextDate.weekday == 7) { "Следующее ${nextDate.weekdayName}"; }
		if (nextDate.weekday == 3 || nextDate.weekday == 5 || nextDate.weekday == 6) { return "Следующая ${nextDate.weekdayName}"; }
		if (nextDate.weekday == 1 || nextDate.weekday == 2 || nextDate.weekday == 4) { return "Следующий ${nextDate.weekdayName}"; }
		return "Следующий день";
	}

	TabController? _tabController;
	bool _goToArbitraryDateTab = false;

	@override
	Widget build(BuildContext context) {
		return DefaultTabController(
		  length: 0,
		  child: BlocBuilder<HomePageBloc, HomePageBlocState>(
		  	builder: (BuildContext context, HomePageBlocState state) { 
		  		if (state is HomePageLoadedState) {
						_tabController?.dispose();
						_tabController = TabController(
						initialIndex: 0 +
							((state.selectedDateData != null) && _goToArbitraryDateTab ? 1 : 0),
						length: 1 +
							(state.selectedDateData != null ? 1 : 0) +
							(state.nextDayData != null ? 1 : 0),
						vsync: this,
						);
						_goToArbitraryDateTab = false;
		  		}
		  		return switch (state) {
		  			HomePageInitialState() => LoadingIndicatorBlock(),
		  			HomePageLoadedState(
		  			todayData: final todayData,
		  			nextDayData: final nextDayData,
		  			selectedDateData: final selectedDateData,
		  			selectedDate: final selectedDate,
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
		  					builder: (context, onUpdateRequested) {
		  						return StreamBuilder(
		  							stream: nextDayData?.lessons,
		  							builder: (context, asyncSnapshot) {
		  								String nextTabName = "Следующий день";
		  								if (asyncSnapshot.data != null && asyncSnapshot.data!.isNotEmpty) {
		  									nextTabName = _determineNextDayTabName(asyncSnapshot.data![0].timing.nextDate);
		  								}
		  								return Column(
		  									children: [
		  										SizedBox.square(
		  											child: Container(
		  												color: AppColors.darkBackground,
		  												child: TabBar(
																controller: _tabController,
		  													indicatorColor: AppColors.primary,
		  													indicatorWeight: 3.0,
		  													dividerHeight: 1.0,
		  													dividerColor: AppColors.primary,
		  													labelColor: AppColors.focusedText,
		  													tabs: [
																	if (selectedDateData != null)
		  														Tab(
		  															child: Text(
		  																style: TextStyle(
		  																	color: AppColors.textAccent,
		  																	fontSize: 18,
		  																	fontWeight: FontWeight.bold,
		  																),
		  																"${selectedDate!.shortWeekdayName}, ${DateFormat("dd.MM").format(selectedDate)}",
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
		  														if (nextDayData != null)
		  														Tab(
		  															child: AutoSizeText(
		  																wrapWords: false,
		  																style: TextStyle(
		  																	color: AppColors.textAccent,
		  																	fontSize: 18,
		  																	fontWeight: FontWeight.bold,
		  																),
		  																nextTabName,
		  															),
		  														),
		  													],
		  												),
		  											),
		  										),
		  										Expanded(
		  											child: TabBarView(
		  												controller: _tabController,
		  												children: [
		  													//Пары на нужную дату
																if (selectedDateData != null)
		  													HomePageTab(
		  														data: selectedDateData,
		  														onRefreshRequested: onUpdateRequested,
		  														onRetry: () {
		  															if (selectedDate == null) return;
																		_goToArbitraryDateTab = true;
		  															context.read<HomePageBloc>().add(HomePageGetForDateEvent(
		  																date: state.selectedDate!,
		  															));
		  														},
		  													),
		  													//Пары на сегодня
		  													HomePageTab(
		  														data: todayData,
		  														onRefreshRequested: onUpdateRequested,
		  														onRetry: () => context.read<HomePageBloc>().add(HomePageGetForTodayEvent()),
		  													),
		  													// Пары на завтра
		  													if (nextDayData != null)
		  													HomePageTab(
		  														data: nextDayData,
		  														onRefreshRequested: onUpdateRequested,
		  														onRetry: () => context.read<HomePageBloc>().add(HomePageGetForNextDayEvent()),
		  													),
		  												],
		  											),
		  										),
		  									],
		  								);
		  							}
		  						);
		  					},
		  				),
		  			),
		  		)
		  		};
		  	},
		  ),
		);
	}
}
