import 'package:timetable_app/features/exams_page/domain/entities/exam.dart';
import 'package:timetable_app/features/exams_page/domain/repo_ints/exam_repo_int.dart';

class  GetAllExamsForUserUsecase {
	final ExamRepoInt repo;

  GetAllExamsForUserUsecase({required this.repo});

	Stream<List<Exam>> execute() {
		return repo.getAllForUser();
	}
}
