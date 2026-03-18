part of 'exams_page_bloc.dart';

sealed class ExamsPageBlocState {}

class ExamsPageInitialState extends ExamsPageBlocState {}

class ExamsPageErrorState extends ExamsPageBlocState{
	final String error;

  ExamsPageErrorState({required this.error});
}

class ExamsPageLoadedState extends ExamsPageBlocState{
	final Stream<List<Exam>> examsStrean;

  ExamsPageLoadedState({required this.examsStrean});
}
