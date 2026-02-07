import 'package:timetable_app/features/initial_settings_page/domain/entities/group/group.dart';

abstract class GroupRepoInt {

	Future<void> saveAll(List<Group> groups);

	Future<List<Group>> find(String substring);

	Future<List<Group>> getAll();
}
