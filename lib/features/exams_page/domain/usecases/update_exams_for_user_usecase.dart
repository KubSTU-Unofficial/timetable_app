import 'package:timetable_app/features/exams_page/domain/repo_ints/exam_repo_int.dart';

class UpdateExamsForUserUsecase {
	final ExamRepoInt repo;

  UpdateExamsForUserUsecase({required this.repo});
  
	Future<DateTime> execute() => repo.updateExamsForUser();
}
