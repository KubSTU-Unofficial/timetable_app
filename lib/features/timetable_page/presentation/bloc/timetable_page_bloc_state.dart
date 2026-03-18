part of 'timetable_page_bloc.dart';

sealed class TimetablePageBlocState {}

class TimetablePageInitialState extends TimetablePageBlocState {}

class TimetablePageErrorState extends TimetablePageBlocState{
	final String error;

  TimetablePageErrorState({required this.error});
}

class TimetablePageLoadedState extends TimetablePageBlocState{
	final Stream<List<Lesson>> lessons;

  TimetablePageLoadedState({required this.lessons});
}
