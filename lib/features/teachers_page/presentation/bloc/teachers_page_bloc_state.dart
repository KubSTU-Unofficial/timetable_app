part of 'teachers_page_bloc.dart';

sealed class TeachersPageBlocState {}

class TeachersPageInitialState extends TeachersPageBlocState {}

class TeachersPageTeachersErrorState extends TeachersPageBlocState {
	final String error;

  TeachersPageTeachersErrorState({required this.error});
}

class TeachersPageLoadedState extends TeachersPageBlocState {
	final List<String> teachers;
	final Stream<List<Lesson>>? lessons;
	final String? error;

  TeachersPageLoadedState({required this.teachers, this.lessons, this.error});
}
