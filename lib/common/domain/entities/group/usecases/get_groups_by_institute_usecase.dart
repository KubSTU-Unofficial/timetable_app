import 'package:timetable_app/common/domain/entities/group/group.dart';
import 'package:timetable_app/common/domain/entities/group/group_repo_int.dart';

class GetGroupsByInstituteUsecase {
	final GroupRepoInt repo;

  GetGroupsByInstituteUsecase({required this.repo});

	Future<List<Group>> execute(String instituteName) {
		return repo.selectByInstitute(instituteName);
	}
}
