import 'package:drift/drift.dart';
import 'package:timetable_app/core/data/database/database.dart';
import 'package:timetable_app/features/initial_settings_page/domain/entities/group/group.dart';

@DataClassName("GroupsEntry")
class Groups extends Table {
	TextColumn get name => text()();

	@override
	Set<Column<Object>>? get primaryKey => {name};
}

extension GroupsCompanionExt on GroupsCompanion {
	static GroupsCompanion fromGroup(Group group) => GroupsCompanion(
		name: Value(group.name),
	);
}

extension GroupsEntryExt on List<GroupsEntry> {
	List<Group> toGroupList() => map((e) => Group(
		name: e.name,
	)).toList();
}
