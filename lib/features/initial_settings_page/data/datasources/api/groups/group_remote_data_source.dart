import 'package:timetable_app/core/data/api/api.dart';
import 'package:timetable_app/features/initial_settings_page/data/datasources/api/groups/group_remote_data_source_int.dart';
import 'package:timetable_app/features/initial_settings_page/domain/entities/group/group.dart';

class GroupRemoteDataSource implements GroupRemoteDataSourceInt {

  @override
  Future<List<Group>> getAll() async {
		List<dynamic> groups = await Api.get(
			"groups"
		);
		return groups.map((e) => Group(name: e["name"])).toList();
  }

	// ... (другие запросы по для получения групп, если требуются)
}
