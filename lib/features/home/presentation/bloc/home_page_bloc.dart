import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timetable_app/core/di/get_it.dart';
import 'package:timetable_app/shared/domain/entities/lesson.dart';
import 'package:timetable_app/shared/domain/usecases/get_all_lessons_for_group_for_next_date_usecase.dart';
import 'package:timetable_app/shared/domain/usecases/get_lessons_for_date_usecase.dart';

part 'home_page_bloc_state.dart';
part 'home_page_bloc_events.dart';
part 'home_page_tab_data.dart';


class HomePageBloc extends Bloc<HomePageBlocEvent, HomePageBlocState> {
  HomePageBloc() : super(HomePageInitialState()) {
		on<HomePageInitEvent>(_onInit);
		on<HomePageGetForTodayEvent>(_onLessonsForTodayRequested);
		on<HomePageGetForNextDayEvent>(_onLessonsForNextDayRequested);
		on<HomePageGetForDateEvent>(_onLessonsForDateRequested);
	}

	Future<void> _onLessonsForTodayRequested(HomePageGetForTodayEvent event, Emitter<HomePageBlocState> emit) async {
		if (state is! HomePageLoadedState) return;
		emit(HomePageLoadedState(
			todayData: await getTabDataForDate(DateTime.now()),
			nextDayData: (state as HomePageLoadedState).nextDayData, 
			selectedDate: (state as HomePageLoadedState).selectedDate,
			selectedDateData: (state as HomePageLoadedState).selectedDateData,
		));
	}

	Future<void> _onLessonsForNextDayRequested(HomePageGetForNextDayEvent event, Emitter<HomePageBlocState> emit) async {
		if (state is! HomePageLoadedState) return;
		emit(HomePageLoadedState(
			todayData: (state as HomePageLoadedState).todayData, 
			nextDayData: await getTabDataForNextDate(DateTime.now()),
			selectedDate: (state as HomePageLoadedState).selectedDate,
			selectedDateData: (state as HomePageLoadedState).selectedDateData,
		));
	}
  
	Future<void> _onLessonsForDateRequested(HomePageGetForDateEvent event, Emitter<HomePageBlocState> emit) async {
		if (state is! HomePageLoadedState) return;
		emit(HomePageLoadedState(
			todayData: (state as HomePageLoadedState).todayData, 
			nextDayData: (state as HomePageLoadedState).nextDayData, 
			selectedDate: event.date,
			selectedDateData: await getTabDataForDate(event.date),
		));
	}

	Future<void> _onInit(HomePageInitEvent event, Emitter<HomePageBlocState> emit) async {
		emit(HomePageLoadedState(
			todayData: await getTabDataForDate(DateTime.now()),
			nextDayData: await getTabDataForNextDate(DateTime.now()), 
			selectedDate: null,
			selectedDateData: null,
		));
	}

	Future<HomePageTabData> getTabDataForNextDate(DateTime date) async {
		try {
			return HomePageTabData(lessons: getIt.get<GetAllLessonsForGroupForNextDateUsecase>().execute(date));
		} catch (e) {
			return HomePageTabData(error: e.toString());
		}
	}

	Future<HomePageTabData> getTabDataForDate(DateTime date) async {
		try {
			return HomePageTabData(lessons: getIt.get<GetLessonsForUserGroupForDateUsecase>().execute(date));
		} catch (e) {
			return HomePageTabData(error: e.toString());
		}
	}
}
