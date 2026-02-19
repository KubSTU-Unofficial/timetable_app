part of 'home_page_bloc.dart';

sealed class HomePageBlocState {}

class HomePageInitialState extends HomePageBlocState {}

class HomePageLoadedState extends HomePageBlocState{
	final HomePageTabData? todayData;
	final HomePageTabData? nextDayData;
	final DateTime? selectedDate;
	final HomePageTabData? selectedDateData;

  HomePageLoadedState({
		required this.todayData,
		required this.nextDayData, 
		required this.selectedDate,
		required this.selectedDateData,
	});
}
