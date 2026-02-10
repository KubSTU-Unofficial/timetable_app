import 'package:timetable_app/shared/domain/entities/lesson.dart';
import 'package:timetable_app/shared/domain/repo_ints/lesson_repo_int.dart';

class  GetLessonsForUserGroupForDateUsecase {
	final LessonRepoInt repo;

  GetLessonsForUserGroupForDateUsecase({required this.repo});

	Future<List<Lesson>> execute(DateTime date) async {
		return repo.getForDateForUserGroup(date);
	}
  
}
