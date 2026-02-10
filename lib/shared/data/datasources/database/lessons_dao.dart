import 'package:drift/drift.dart';
import 'package:timetable_app/core/data/database/database.dart';
import 'package:timetable_app/shared/data/models/class/lessons_table.dart';

part 'lessons_dao.g.dart';

@DriftAccessor(tables: [Lessons])
class LessonsDao extends DatabaseAccessor<Database> with _$LessonsDaoMixin {
  LessonsDao(super.attachedDatabase);
  
	Future<List<LessonsEntry>> selectByGroup(String group) async {
		return (select(lessons)..where((e) => e.group.equals(group))).get();
	}

	Future<void> saveAllForGroup(List<LessonsCompanion> lessonList) async {
		if (lessonList.isEmpty) { return; }
		for (int i = 0; i < lessonList.length - 1; i++) {
			if (lessonList[i] != lessonList[i + 1]) { throw InvalidDataException("Переданы пары с разными группами"); }
		}
		return transaction(() async {
			await (delete(lessons)..where((e) => e.group.equals(lessonList[0].group.value))).go();
			await batch((batch) async {
				batch.insertAll(lessons, lessonList);
			});
		});
	}

	Future<List<LessonsEntry>> getForDateForGroup(DateTime date, String groupname) async {
    // TODO: implement getForDate
    throw UnimplementedError();
	}
}
