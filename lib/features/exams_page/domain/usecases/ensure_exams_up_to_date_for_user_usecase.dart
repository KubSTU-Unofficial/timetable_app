import 'package:timetable_app/features/exams_page/domain/repo_ints/exam_repo_int.dart';

class EnsureExamsUpToDateForUserUsecase {
	final ExamRepoInt repo;

  EnsureExamsUpToDateForUserUsecase({required this.repo});
  
	Future<DateTime> execute() {
		return repo.ensureExamsUpToDateForUser();
	}
}
