import 'package:timetable_app/core/data/api/api.dart';
import 'package:timetable_app/features/teachers_page/data/datasources/api/teachers_remote_datasource_int.dart';

class TeachersRemoteDataSource implements TeachersRemoteDatasourceInt {

  @override
  Future<List<String>> getAll() async {
		return await Api.get(
			"teachers"
		);
  }
}
