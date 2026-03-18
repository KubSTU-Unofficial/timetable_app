part of 'teachers_page_bloc.dart';

abstract class TeachersPageBlocEvent {}

class TeachersPageInitEvent implements TeachersPageBlocEvent {}

class TeacherLessonsRequestedForDateEvent implements TeachersPageBlocEvent {
	final String name;
	final DateTime date;

  TeacherLessonsRequestedForDateEvent({required this.name, required this.date});
}
