import 'package:drift/drift.dart';
import 'package:timetable_app/core/data/database/database.dart';
import 'package:timetable_app/features/teachers_page/data/models/teacher_dates_table.dart';

part 'teachers_dao.g.dart';

@DriftAccessor(tables: [TeacherDates])
class TeachersDao extends DatabaseAccessor<Database> with _$TeachersDaoMixin {
  TeachersDao(super.attachedDatabase);

	Future<void> saveNameList(List<String> teachersList) =>
		transaction(() async {
			await delete(teacherDates).go();
			await batch((b) {
				b.insertAll(teacherDates, teachersList.map((e) => 
					TeacherDatesCompanion(
						name: Value(e),
						updatedAt: Value.absent(),
						date: Value.absent(),
					)
				));
			});
		});

	Future<DateTime?> getUpdatedAtForDate(String name, DateTime date) async =>
		(await (select(teacherDates)..where((e) => 
			e.name.equals(name) & e.date.equals(date)
		)).getSingleOrNull())?.updatedAt;

	Future<List<String>> getAllNames() async =>
		(await (selectOnly(teacherDates)..addColumns([teacherDates.name])).get()).map((e) => e.read(teacherDates.name)).map((e) => e.toString()).toList();
  
}
