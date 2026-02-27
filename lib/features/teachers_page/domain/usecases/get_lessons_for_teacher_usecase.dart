import 'package:timetable_app/shared/domain/entities/lesson.dart';
import 'package:timetable_app/shared/domain/repo_ints/lesson_repo_int.dart';

class GetLessonsForTeacherUsecase {
	final LessonRepoInt repo;

  GetLessonsForTeacherUsecase({required this.repo});

	Stream<List<Lesson>> execute(String name) =>
		repo.getAllForTeacher(name);
}
