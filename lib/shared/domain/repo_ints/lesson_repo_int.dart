import 'package:timetable_app/shared/domain/entities/lesson.dart';

abstract class LessonRepoInt {
	List<Lesson> getForDate(
		DateTime date,
		String groupname,
	);
}
