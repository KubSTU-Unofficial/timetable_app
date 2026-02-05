import 'dart:convert';

import 'package:timetable_app/common/data/api/api.dart';
import 'package:timetable_app/common/data/api/groups/group_remote_data_source_int.dart';
import 'package:timetable_app/common/domain/entities/group/group.dart';

class GroupRemoteDataSource implements GroupRemoteDataSourceInt {

	@override
  Future<List<Group>> getByInstitute(String institute) async {
		String body = await Api.get(
			"get-by-institute",
			queryParameters: { "institute": institute, }
		);
		List<dynamic> rawJson = jsonDecode(body);
		List<Group> groups = rawJson.map((e) => Group.fromJson(e as Map<String, dynamic>)).toList();
		return groups;
	}

	@override
  Future<List<Group>> getBySubstring(String substring) async {
		String body = await Api.get(
			"get-by-substring",
			queryParameters: { "substring": substring, }
		);
		List<dynamic> rawJson = jsonDecode(body);
		List<Group> groups = rawJson.map((e) => Group.fromJson(e as Map<String, dynamic>)).toList();
		return groups;
	}

	// ... (другие запросы по для получения групп, если требуются)
}
