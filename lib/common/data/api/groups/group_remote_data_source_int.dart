import 'package:timetable_app/common/domain/entities/group/group.dart';

abstract class GroupRemoteDataSourceInt {
  
	Future<List<Group>> getByInstitute(String institute);

	Future<List<Group>> getBySubstring(String substring);

	// ... (другие запросы по для получения групп, если требуются)
}
