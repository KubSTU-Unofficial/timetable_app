part of 'home_page_bloc.dart';

abstract class HomePageBlocEvent {}

class HomePageInitEvent extends HomePageBlocEvent {}

class HomePageGetForTodayEvent extends HomePageBlocEvent {}

class HomePageGetForTomorrowEvent extends HomePageBlocEvent {}


class HomePageGetForDateEvent extends HomePageBlocEvent {
	final DateTime date;

  HomePageGetForDateEvent({
		required this.date,
	});
}
