import 'package:timetable_app/features/initial_settings/domain/entities/group/group.dart';

abstract class GroupRemoteDataSourceInt {
  
	Future<List<Group>> getByInstitute(String institute);

	Future<List<Group>> getBySubstring(String substring);

	// ... (другие запросы по для получения групп, если требуются)
}
