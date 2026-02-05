import 'package:drift/drift.dart';
import 'package:timetable_app/core/data/database/database.dart';
import 'package:timetable_app/features/initial_settings/domain/entities/group/group.dart';

@DataClassName("GroupsEntry")
class Groups extends Table {
	TextColumn get name => text()();
	TextColumn get institute => text()();

	@override
	Set<Column<Object>>? get primaryKey => {name};
}

extension GroupsCompanionExt on GroupsCompanion {
	static GroupsCompanion fromGroup(Group group) => GroupsCompanion(
		name: Value(group.name),
		institute: Value(group.institute),
	);
}

extension GroupsEntryExt on List<GroupsEntry> {
	List<Group> toGroupList() => map((e) => Group(
		name: e.name,
		institute: e.institute,
	)).toList();
}
