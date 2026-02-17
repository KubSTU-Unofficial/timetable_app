import 'package:timetable_app/shared/data/constants.dart';
import 'package:timetable_app/shared/data/datasources/api/lessons/lesson_remote_data_source_int.dart';
import 'package:timetable_app/shared/data/models/class/lessons_dto.dart';

class MockLessonsRemoteDatasource implements LessonRemoteDataSourceInt {

  @override
  Future<List<LessonDTO>> getByGroup(String group) async {
		await Future.delayed(Duration(seconds: 10));
		return lessonsTestExample;
  }
  
}
