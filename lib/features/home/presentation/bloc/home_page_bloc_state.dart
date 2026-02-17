part of 'home_page_bloc.dart';

sealed class HomePageBlocState {}

class HomePageInitialState extends HomePageBlocState {}

class HomePageLoadedState extends HomePageBlocState{
	final HomePageTabData? todayData;
	final HomePageTabData? tomorrowData;
	final DateTime? selectedDate;
	final HomePageTabData? selectedDateData;

  HomePageLoadedState({
		required this.todayData,
		required this.tomorrowData, 
		required this.selectedDate,
		required this.selectedDateData,
	});
}
