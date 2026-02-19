import 'package:timetable_app/shared/domain/entities/lesson.dart';

abstract class LessonRepoInt {
	Stream<List<Lesson>> getForDateForUserGroup(
		DateTime date,
	);

	Stream<List<Lesson>> getNextForDateForUserGroup(
		DateTime date,
	);

	Stream<List<Lesson>> getAllForUserGroup();

	Future<DateTime> ensureLessonsUpToDateForUser();
}
