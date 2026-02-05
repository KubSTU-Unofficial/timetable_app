import 'package:timetable_app/features/initial_settings/data/datasources/api/groups/group_remote_data_source_int.dart';
import 'package:timetable_app/features/initial_settings/domain/entities/group/group.dart';

class MockGroupRemoteDataSource implements GroupRemoteDataSourceInt {

	final List<Group> _groups = [Group(name: "22-XX-XX1", institute: "ФИТК"),Group(name: "22-XX-XX2", institute: "ФИТК"),];

	@override
  Future<List<Group>> getByInstitute(String institute) async {
		if (institute == "ИТК") { throw Exception("Это тестовая ошибка с большим текстом"); }
		return _groups.where((g) => g.institute == institute).toList();
	}

	@override
  Future<List<Group>> getBySubstring(String substring) async {
		return _groups.where((g) => g.name.contains(substring)).toList();
	}

	// ... (другие запросы по для получения групп, если требуются)
}
