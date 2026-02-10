import 'package:timetable_app/shared/domain/entities/lesson.dart';

abstract class LessonRepoInt {
	Future<List<Lesson>> getForDateForUserGroup(
		DateTime date,
	);

	Future<List<Lesson>> getAllForUserGroup();
}
