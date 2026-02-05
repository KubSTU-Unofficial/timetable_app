import 'package:drift/drift.dart';
import 'package:timetable_app/core/data/database/database.dart';
import 'package:timetable_app/features/initial_settings/data/models/groups_table.dart';

part 'groups_dao.g.dart';

@DriftAccessor(tables: [Groups])
class GroupsDao extends DatabaseAccessor<Database> with _$GroupsDaoMixin {
  GroupsDao(super.attachedDatabase);

	Future<List<GroupsEntry>> selectByInstitute(String institute) {
		return (select(groups)..where((e) => e.institute.equals(institute))).get();
	}

	Future<void> upsertAll(List<GroupsCompanion> entries) {
		return batch((batch) {
			batch.insertAllOnConflictUpdate(groups, entries);
		});
	}

	Future<List<GroupsEntry>> find(String substring) {
		return (select(groups)..where((e) => e.name.contains(substring))).get();
	}
}
