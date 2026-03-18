import 'package:timetable_app/shared/domain/repo_ints/lesson_repo_int.dart';

class UpdateLessonsForUserUsecase {
	final LessonRepoInt repo;

  UpdateLessonsForUserUsecase({required this.repo});

	Future<DateTime> execute() => repo.updateLessonsForUser();
}
