import 'dart:convert';

import 'package:timetable_app/core/data/api/api.dart';
import 'package:timetable_app/shared/data/datasources/api/lessons/lesson_remote_data_source_int.dart';
import 'package:timetable_app/shared/data/models/class/lessons_dto.dart';

class LessonRemoteDatasource implements LessonRemoteDataSourceInt {

  @override
  Future<List<LessonDTO>> getByGroup(String group) async {
		String body = await Api.get(
			"groups/$group/timetable",
		);
		List<dynamic> rawJson = jsonDecode(body);
		List<LessonDTO> lessons = rawJson.map((e) => LessonDTO.fromJson(e as Map<String, dynamic>)).toList();
		return lessons;
  }
  
}
