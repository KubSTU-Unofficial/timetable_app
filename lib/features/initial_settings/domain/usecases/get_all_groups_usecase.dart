import 'package:timetable_app/features/initial_settings/domain/entities/group/group.dart';
import 'package:timetable_app/features/initial_settings/domain/repo_ints/group_repo_int.dart';

class GetAllGroupsUsecase {
	final GroupRepoInt repo;

  GetAllGroupsUsecase({required this.repo});

	Future<List<Group>> execute() async {
		return repo.getAll();
	}
}
