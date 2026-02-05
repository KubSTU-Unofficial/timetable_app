import 'package:timetable_app/common/domain/entities/group/group.dart';

abstract class GroupRepoInt {

	Future<List<Group>> selectByInstitute(String institute);

	Future<void> saveAll(List<Group> groups);

	Future<List<Group>> find(String substring);
}
