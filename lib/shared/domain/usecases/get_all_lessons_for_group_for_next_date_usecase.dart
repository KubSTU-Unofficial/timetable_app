import 'package:timetable_app/shared/domain/entities/lesson.dart';
import 'package:timetable_app/shared/domain/repo_ints/lesson_repo_int.dart';

class  GetAllLessonsForGroupForNextDateUsecase {
	final LessonRepoInt repo;

  GetAllLessonsForGroupForNextDateUsecase({required this.repo});

	Stream<List<Lesson>> execute(DateTime date) {
		return repo.getNextForDateForUserGroup(date);
	}
  
}
