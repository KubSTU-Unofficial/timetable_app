import 'package:timetable_app/shared/domain/entities/lesson.dart';
import 'package:timetable_app/shared/domain/repo_ints/lesson_repo_int.dart';

class GetAllLessonsForUserGroupUsecase {
	final LessonRepoInt repo;

	GetAllLessonsForUserGroupUsecase({
		required this.repo,
	});

	Stream<List<Lesson>> execute() {
		return repo.getAllForUserGroup();
	}
  
}
