import 'package:drift/drift.dart';
import 'package:timetable_app/core/data/database/database.dart';
import 'package:timetable_app/features/exams_page/data/models/exam_table.dart';

part 'exams_dao.g.dart';

@DriftAccessor(tables: [Exams])
class ExamsDao extends DatabaseAccessor<Database> with _$ExamsDaoMixin {
  ExamsDao(super.attachedDatabase);

	Future<void> saveAll(List<ExamsCompanion> examList) async {
		if (examList.isEmpty) { return; }
		for (int i = 0; i < examList.length - 1; i++) {
			if (examList[i].group.value != examList[i + 1].group.value) { throw InvalidDataException("Переданы экзасены с разными группами"); }
		}
		return transaction(() async {
			await (delete(exams)..where((e) => e.group.equals(examList[0].group.value))).go();
			await batch((batch) async {
				batch.insertAll(exams, examList);
			});
		});
	}

	Stream<List<ExamsEntry>> getAllForGroup(String group) {
		DateTime now = DateTime.now();
		int semester = now.month > 7 ? 1 : 2;
		return (select(exams)..where((e) =>
			e.group.equals(group) &
			e.year.equals(now.year) &
			e.semester.equals(semester)
		)..orderBy([
				(e) => OrderingTerm(expression: e.date, mode: OrderingMode.asc)
			])).watch();
	}
  
}
