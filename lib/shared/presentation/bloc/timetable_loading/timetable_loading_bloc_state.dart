part of 'timetable_loading_bloc.dart';

sealed class TimetableLoadingBlocState {}

class TimetableLoadingReadyState extends TimetableLoadingBlocState {
	final DateTime updatedAt;
	final bool causedByRefresh;

  TimetableLoadingReadyState({required this.updatedAt, required this.causedByRefresh});
}

class TimetableLoadingInProcessState extends TimetableLoadingBlocState {}

class TimetableInitialLoadingInProcessState extends TimetableLoadingBlocState {}

class TimetableLoadingErrorState extends TimetableLoadingBlocState {
	final String error;

  TimetableLoadingErrorState({required this.error});
}

class TimetableInitialLoadingErrorState extends TimetableLoadingBlocState {
	final String error;

  TimetableInitialLoadingErrorState({required this.error});
}

class TimetableLoadingInitialState extends TimetableLoadingBlocState {}
