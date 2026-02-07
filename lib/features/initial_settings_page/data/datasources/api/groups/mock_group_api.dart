import 'package:timetable_app/features/initial_settings_page/data/datasources/api/groups/group_remote_data_source_int.dart';
import 'package:timetable_app/features/initial_settings_page/domain/entities/group/group.dart';
import 'package:timetable_app/shared/data/constants.dart';

class MockGroupRemoteDataSource implements GroupRemoteDataSourceInt {

	@override
  Future<List<Group>> getBySubstring(String substring) async {
		return groups.where((e) => e.contains(substring)).map((e) => Group(name: e)).toList();
	}

  @override
  Future<List<Group>> getAll() async {
		return groups.map((e) => Group(name: e)).toList();
  }

	// ... (другие запросы по для получения групп, если требуются)
}
