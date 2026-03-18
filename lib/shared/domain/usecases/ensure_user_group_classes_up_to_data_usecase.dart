import 'package:timetable_app/shared/domain/repo_ints/lesson_repo_int.dart' show LessonRepoInt;

class EnsureUserGroupClassesUpToDataUsecase {
	final LessonRepoInt repo;

  EnsureUserGroupClassesUpToDataUsecase({required this.repo});

	Future<DateTime> execute() async {
		return await repo.ensureLessonsUpToDateForUser();
	}
}
