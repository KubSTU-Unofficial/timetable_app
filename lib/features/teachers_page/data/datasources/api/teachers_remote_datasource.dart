import 'package:timetable_app/core/data/api/api.dart';
import 'package:timetable_app/features/teachers_page/data/datasources/api/teachers_remote_datasource_int.dart';

class TeachersRemoteDataSource implements TeachersRemoteDatasourceInt {

  @override
  Future<List<String>> getAllNames() async {
		List<dynamic> teachers = await Api.get(
			"teachers"
		);
		return teachers.map((e) => e.toString()).toList();
  }
}
