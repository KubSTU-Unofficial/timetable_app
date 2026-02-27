import 'package:drift/drift.dart';
import 'package:timetable_app/core/data/database/database.dart';
import 'package:timetable_app/features/teachers_page/data/models/teachers_table.dart';

part 'teachers_dao.g.dart';

@DriftAccessor(tables: [Teachers])
class TeachersDao extends DatabaseAccessor<Database> with _$TeachersDaoMixin {
  TeachersDao(super.attachedDatabase);

	Future<void> updateAll(List<String> teachersList) =>
		transaction(() async {
			await delete(teachers).go();
			await batch((b) {
				b.insertAll(teachers, teachersList.map((e) => 
					TeachersCompanion(
						name: Value(e),
						updatedAt: Value(DateTime.now()),
					)
				));
			});
		});

	Future<DateTime?> getUpdateDate(String name) async =>
		(await (select(teachers)..where((e) => e.name.equals(name))).getSingleOrNull())?.updatedAt;

	Future<List<String>> getAll() async =>
		(await (select(teachers)).get()).map((e) => e.name).toList();
  
}
