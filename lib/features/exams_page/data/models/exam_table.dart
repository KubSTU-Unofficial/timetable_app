import 'package:drift/drift.dart';
import 'package:timetable_app/core/data/database/database.dart';
import 'package:timetable_app/features/exams_page/domain/entities/exam.dart';

@DataClassName("ExamsEntry")
class Exams extends Table {
	TextColumn get group => text()();
	TextColumn get name => text()();
	DateTimeColumn get date => dateTime()();
	TextColumn get classroom => text()();
	TextColumn get teacher => text()();
	IntColumn get year => integer()();
	IntColumn get semester => integer()();
}

extension ExamsCompanionMapper on List<Exam> {
	List<ExamsCompanion> toCompanions() =>
		map((e) =>
			ExamsCompanion(
				group: Value(e.group),
				name: Value(e.name),
				date: Value(e.date),
				classroom: Value(e.classroom),
				teacher: Value(e.teacher),
				year: Value(e.year),
				semester: Value(e.semester),
			)
		).toList();
}

extension ExamsEntryMapper on List<ExamsEntry> {
	List<Exam> toExamList() =>
		map((e) => Exam(
			group: e.group,
			name: e.name,
			date: e.date,
			classroom: e.classroom,
			teacher: e.teacher,
			year: e.year,
			semester: e.semester,
		)).toList();
	}
