part of 'exams_loading_bloc.dart';

sealed class ExamsLoadingBlocState {}

class ExamsLoadingReadyState extends ExamsLoadingBlocState {
	final DateTime updatedAt;

  ExamsLoadingReadyState({required this.updatedAt});
}

class ExamsLoadingInProcessState extends ExamsLoadingBlocState {}

class ExamsInitialLoadingInProcessState extends ExamsLoadingBlocState {}

class ExamsLoadingErrorState extends ExamsLoadingBlocState {
	final String error;

  ExamsLoadingErrorState({required this.error});
}
