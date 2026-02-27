import 'package:timetable_app/core/data/database/database.dart';
import 'package:timetable_app/core/di/get_it.dart';
import 'package:timetable_app/features/teachers_page/data/datasources/api/teachers_remote_datasource_int.dart';

class MockTeachersRemoteDatasource implements TeachersRemoteDatasourceInt {
  @override
  Future<List<String>> getAll() {
		return getIt.get<Database>().lessonsDao.getAllTeachers();
  }
  
}
