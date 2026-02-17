import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timetable_app/core/di/get_it.dart';
import 'package:timetable_app/shared/domain/entities/lesson.dart';
import 'package:timetable_app/shared/domain/usecases/get_lessons_for_date_usecase.dart';

part 'home_page_bloc_state.dart';
part 'home_page_bloc_events.dart';
part 'home_page_tab_data.dart';


class HomePageBloc extends Bloc<HomePageBlocEvent, HomePageBlocState> {
  HomePageBloc() : super(HomePageInitialState()) {
		on<HomePageInitEvent>(_onInit);
		on<HomePageGetForTodayEvent>(_onLessonsForTodayRequested);
		on<HomePageGetForTomorrowEvent>(_onLessonsForTomorrowRequested);
		on<HomePageGetForDateEvent>(_onLessonsForDateRequested);
	}

	Future<void> _onLessonsForTodayRequested(HomePageGetForTodayEvent event, Emitter<HomePageBlocState> emit) async {
		if (state is! HomePageLoadedState) return;
		emit(HomePageLoadedState(
			todayData: await getTabDataForDate(DateTime.now()),
			tomorrowData: (state as HomePageLoadedState).tomorrowData, 
			selectedDate: (state as HomePageLoadedState).selectedDate,
			selectedDateData: (state as HomePageLoadedState).selectedDateData,
		));
	}

	Future<void> _onLessonsForTomorrowRequested(HomePageGetForTomorrowEvent event, Emitter<HomePageBlocState> emit) async {
		if (state is! HomePageLoadedState) return;
		emit(HomePageLoadedState(
			todayData: (state as HomePageLoadedState).todayData, 
			tomorrowData: await getTabDataForDate(DateTime.now().add(Duration(days: 1))),
			selectedDate: (state as HomePageLoadedState).selectedDate,
			selectedDateData: (state as HomePageLoadedState).selectedDateData,
		));
	}
  
	Future<void> _onLessonsForDateRequested(HomePageGetForDateEvent event, Emitter<HomePageBlocState> emit) async {
		if (state is! HomePageLoadedState) return;
		emit(HomePageLoadedState(
			todayData: (state as HomePageLoadedState).todayData, 
			tomorrowData: (state as HomePageLoadedState).tomorrowData, 
			selectedDate: event.date,
			selectedDateData: await getTabDataForDate(event.date),
		));
	}

	Future<void> _onInit(HomePageInitEvent event, Emitter<HomePageBlocState> emit) async {
		emit(HomePageLoadedState(
			todayData: await getTabDataForDate(DateTime.now()),
			tomorrowData: await getTabDataForDate(DateTime.now().add(Duration(days: 1))), 
			selectedDate: null,
			selectedDateData: null,
		));
	}

	Future<HomePageTabData> getTabDataForDate(DateTime date) async {
		try {
			return HomePageTabData(lessons: getIt.get<GetLessonsForUserGroupForDateUsecase>().execute(date));
		} catch (e) {
			return HomePageTabData(error: e.toString());
		}
	}
}
