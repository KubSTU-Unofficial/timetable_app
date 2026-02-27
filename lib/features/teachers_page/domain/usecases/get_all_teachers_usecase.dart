import 'package:timetable_app/features/teachers_page/domain/repo_ints/teachers_repo_int.dart';

class GetAllTeachersUsecase {
	final TeachersRepoInt repo;

  GetAllTeachersUsecase({required this.repo});
  
	Future<List<String>> execute() {
		return repo.getTeachersList();
	}
}
