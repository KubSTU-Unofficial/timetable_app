part of 'timetable_loading_bloc.dart';

sealed class TimetableLoadingBlocState {}

class TimetableLoadingReadyState extends TimetableLoadingBlocState {
	final DateTime updatedAt;

  TimetableLoadingReadyState({required this.updatedAt});
}

class TimetableLoadingInProcessState extends TimetableLoadingBlocState {}

class TimetableInitialLoadingInProcessState extends TimetableLoadingBlocState {}

class TimetableLoadingErrorState extends TimetableLoadingBlocState {
	final String error;

  TimetableLoadingErrorState({required this.error});
}
