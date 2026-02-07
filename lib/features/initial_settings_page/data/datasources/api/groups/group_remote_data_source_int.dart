import 'package:timetable_app/features/initial_settings_page/domain/entities/group/group.dart';

abstract class GroupRemoteDataSourceInt {
  
	Future<List<Group>> getAll();

	Future<List<Group>> getBySubstring(String substring);

	// ... (другие запросы по для получения групп, если требуются)
}
