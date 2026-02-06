import 'dart:convert';

import 'package:timetable_app/core/data/api/api.dart';
import 'package:timetable_app/features/initial_settings/data/datasources/api/groups/group_remote_data_source_int.dart';
import 'package:timetable_app/features/initial_settings/domain/entities/group/group.dart';

class GroupRemoteDataSource implements GroupRemoteDataSourceInt {

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

  @override
  Future<List<Group>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

	// ... (другие запросы по для получения групп, если требуются)
}
