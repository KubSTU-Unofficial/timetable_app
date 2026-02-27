part of 'teachers_page_bloc.dart';

abstract class TeachersPageBlocEvent {}

class TeachersPageInitEvent implements TeachersPageBlocEvent {}

class TeacherRequestedEvent implements TeachersPageBlocEvent {
	final String name;

  TeacherRequestedEvent({required this.name});
}
