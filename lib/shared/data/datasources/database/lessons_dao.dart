import 'package:drift/drift.dart';
import 'package:timetable_app/core/data/database/database.dart';
import 'package:timetable_app/shared/data/models/class/lessons_table.dart';
import 'package:timetable_app/shared/utils/week_of_year_ext.dart';

part 'lessons_dao.g.dart';

@DriftAccessor(tables: [Lessons])
class LessonsDao extends DatabaseAccessor<Database> with _$LessonsDaoMixin {
  LessonsDao(super.attachedDatabase);
  
	Stream<List<LessonsEntry>> selectByGroup(String group) {
		return (select(lessons)..where((e) {
			return e.group.equals(group) &
				e.startDate.isSmallerOrEqualValue(DateTime.now()) &
				e.endDate.isBiggerOrEqualValue(DateTime.now());
			
		})).watch();
	}

	Future<void> saveAllForGroup(List<LessonsCompanion> lessonList) async {
		if (lessonList.isEmpty) { return; }
		for (int i = 0; i < lessonList.length - 1; i++) {
			if (lessonList[i].group.value != lessonList[i + 1].group.value) { throw InvalidDataException("Переданы пары с разными группами"); }
		}
		return transaction(() async {
			await (delete(lessons)..where((e) => e.group.equals(lessonList[0].group.value))).go();
			await batch((batch) async {
				batch.insertAll(lessons, lessonList);
			});
		});
	}

	Stream<List<LessonsEntry>> getForDateForGroup(DateTime date, String groupname) {
		return (select(lessons)..where((e) {
			return e.group.equals(groupname) & (
				e.date.equals(date) |
				e.startDate.isSmallerOrEqualValue(date) &
				e.endDate.isBiggerOrEqualValue(date) &
				e.isWeekEven.equals(date.weekOfYear % 2 == 0) &
				e.dayOfWeek.equals(date.weekday)
			);
		})).watch();
	}

	Stream<List<LessonsEntry>> getNextForDateForGroup(DateTime date, String group) {
		int evenCoef = date.weekOfYear % 2 == 0 ? 1 : 10;
		int oddCoef = date.weekOfYear % 2 == 1 ? 1 : 10;
		int givenDayCoef = date.weekday * (date.weekOfYear % 2 == 0 ? evenCoef : oddCoef);
		var dayWithCoef = (lessons.dayOfWeek * lessons.isWeekEven.caseMatch<int>(when: { const Constant(true): Constant(evenCoef)}, orElse: Constant(oddCoef),));
		return (select(lessons)
			..addColumns([dayWithCoef])
			..where((e) {
			return e.group.equals(group) & (
				(
					dayWithCoef.equalsExp(
						subqueryExpression<int>(selectOnly(e)
							..addColumns([dayWithCoef.min()])
							..where(
								dayWithCoef.isBiggerThanValue(givenDayCoef)
							)
						) 
					) &
					e.startDate.isSmallerOrEqualValue(date) &
					e.endDate.isBiggerOrEqualValue(date)
				) |
					e.date.equalsExp(
						subqueryExpression<DateTime>(selectOnly(lessons)
							..addColumns([lessons.date.min()])
							..where(lessons.date.isBiggerThanValue(date))
						)
					)
				);
		})).watch();
	}
}
