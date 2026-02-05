import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetable_app/common/data/api/groups/group_remote_data_source_int.dart';
import 'package:timetable_app/common/data/constants.dart';
import 'package:timetable_app/common/data/database/groups/dao.dart';
import 'package:timetable_app/common/data/database/groups/entity.dart';
import 'package:timetable_app/common/domain/entities/group/group.dart';
import 'package:timetable_app/common/domain/entities/group/group_repo_int.dart';

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
  Future<List<Group>> selectByInstitute(String institute) async {
		List<Group> groups = (await db.selectByInstitute(institute)).toGroupList();
		if (groups.isEmpty && institutes.contains(institute)) {
			groups = await api.getByInstitute(institute);
			await saveAll(groups);
		}
		return groups;
  }
  
}
