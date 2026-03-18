import 'package:timetable_app/shared/domain/entities/lesson.dart';
import 'package:timetable_app/shared/domain/repo_ints/lesson_repo_int.dart';

class GetLessonsForTeacherForDateUsecase {
	final LessonRepoInt repo;

  GetLessonsForTeacherForDateUsecase({required this.repo});

	Stream<List<Lesson>> execute(String name, DateTime date) {
		return repo.getForTeacherForDate(name, date);
	}
}
