import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetable_app/shared/data/shared_prefs_keys.dart';
import 'package:timetable_app/shared/domain/repo_ints/lesson_repo_int.dart';

class DeleteUserGroupDataUsecase {
	final LessonRepoInt lessonsRepo;
	final SharedPreferences prefs;

  DeleteUserGroupDataUsecase({required this.lessonsRepo, required this.prefs});

	Future<void> execute() async {
		await lessonsRepo.clearLessonsForUser();
    await prefs.remove(userGroupKey);
    await prefs.remove(userLessonsUpdatedAt);
    await prefs.remove(userExamsUpdatedAt);
	}
}
