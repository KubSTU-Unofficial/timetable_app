part of 'teachers_page_bloc.dart';

sealed class TeachersPageBlocState {}

class TeachersPageInitialState extends TeachersPageBlocState {}

class TeachersPageLoadedState extends TeachersPageBlocState {
	final List<String> teachers;
	final Stream<List<Lesson>>? lessons;

  TeachersPageLoadedState({required this.teachers, this.lessons});
}
