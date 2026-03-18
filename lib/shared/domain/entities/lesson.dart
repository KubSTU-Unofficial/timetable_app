import 'package:timetable_app/shared/domain/entities/timing.dart';

enum LessonType {
	lecture('Лекция', 'Лек.'),
	practical('Практика', 'Практ.'),
	lab('Лабораторная', 'Лаб.');

  final String translation;
	final String shortTranslation;
  const LessonType(this.translation, this.shortTranslation);
}

class Lesson {
	final String group;
	final String name;
	final LessonType type;
	final String? teacherName;
	final String? classroom;
	final Timing timing;
	final int? percentOfGroup;
	final bool? isInLectureHall;
	final bool? isOnline;
	final String? comment;

	Lesson({
		required this.group,
		required this.name,
		required this.type,
		required this.teacherName,
		required this.classroom,
		required this.timing,
		required this.percentOfGroup,
		required this.isInLectureHall,
		required this.isOnline,
		required this.comment
	});
}
