import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetable_app/features/initial_settings/data/datasources/api/groups/group_remote_data_source_int.dart';
import 'package:timetable_app/features/initial_settings/data/datasources/database/groups_dao.dart';
import 'package:timetable_app/features/initial_settings/data/models/groups_table.dart';
import 'package:timetable_app/features/initial_settings/domain/entities/group/group.dart';
import 'package:timetable_app/features/initial_settings/domain/repo_ints/group_repo_int.dart';

class GroupRepo implements GroupRepoInt {
	final GroupsDao db;
	final GroupRemoteDataSourceInt api;
	final SharedPreferences prefs;

  GroupRepo({required this.db, required this.api, required this.prefs});

  @override
  Future<List<Group>> find(String substring) async {
		return (await api.getBySubstring(substring));
  }

  @override
  Future<void> saveAll(List<Group> groups) async {
		return db.upsertAll(groups.map((e) => GroupsCompanionExt.fromGroup(e)).toList());
  }

  @override
  Future<List<Group>> getAll() async {
		// Для тестирования экранов ошибки и загрузки
		// throw Exception("Что-то пошло не так");
		// await Future.delayed(Duration(seconds: 5));
		List<Group> groups = (await db.selectAll()).toGroupList();
		if (groups.isEmpty) {
			groups = await api.getAll();
			await saveAll(groups);
		}
		return groups;
  }
  
}
