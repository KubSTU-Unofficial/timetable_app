import 'package:drift/drift.dart';
import 'package:timetable_app/core/data/database/database.dart';
import 'package:timetable_app/shared/domain/entities/lesson.dart';
import 'package:timetable_app/shared/domain/entities/timing.dart';
import 'package:timetable_app/shared/domain/entities/weeks.dart';

@DataClassName("LessonsEntry")
class Lessons extends Table {
	IntColumn get key => integer()();
	TextColumn get group => text()();
	TextColumn get name => text()();
	IntColumn get type => integer()();
	TextColumn get teacherName => text().nullable()();
	TextColumn get classroom => text().nullable()();
	IntColumn get year => integer()();
	IntColumn get semester => integer()();
	IntColumn get lessonNumber => integer()();
	IntColumn get fromWeek => integer().nullable()();
	IntColumn get toWeek => integer().nullable()();
	DateTimeColumn get startDate => dateTime().nullable()();
	DateTimeColumn get endDate => dateTime().nullable()();
	BoolColumn get isWeekEven => boolean().nullable()();
	IntColumn get dayOfWeek => integer().nullable()();
	DateTimeColumn get date => dateTime().nullable()();
	IntColumn get percentOfGroup => integer().nullable()();
	BoolColumn get isInLectureHall => boolean().nullable()();
	BoolColumn get isOnline => boolean().nullable()();
	TextColumn get comment => text().nullable()();
}

extension LessonsCompanionMapper on List<Lesson> {
	List<LessonsCompanion> toCompanions() => map((lesson) => LessonsCompanion(
		group: Value(lesson.group),
		name: Value(lesson.name),
		type: Value(lesson.type.index),
		teacherName: Value(lesson.teacherName),
		classroom: Value(lesson.classroom),
		year: Value(lesson.timing.year),
		semester: Value(lesson.timing.semester),
		lessonNumber: Value(lesson.timing.lessonNumber),
		fromWeek: Value(lesson.timing.weeks?.from),
		toWeek: Value(lesson.timing.weeks?.to),
		startDate: Value(lesson.timing.weeks?.startDate),
		endDate: Value(lesson.timing.weeks?.endDate),
		isWeekEven: Value(lesson.timing.weeks?.isEven),
		dayOfWeek: Value(lesson.timing.weeks?.dayOfWeek),
		date: Value(lesson.timing.date),
		percentOfGroup: Value(lesson.percentOfGroup),
		isInLectureHall: Value(lesson.isInLectureHall),
		isOnline: Value(lesson.isOnline),
		comment: Value(lesson.comment),
)).toList();
}

extension LessonsEntryMapper on List<LessonsEntry> {
	List<Lesson> toLessonList() => map((e) => Lesson(
	group: e.group,
	name: e.name,
	type: LessonType.values[e.type],
	teacherName: e.teacherName,
	classroom: e.classroom,
	timing: Timing(
		year: e.year,
		semester: e.semester,
		lessonNumber: e.lessonNumber,
		weeks: e.isWeekEven == null ? null : Weeks(
			from: e.fromWeek!,
			to: e.toWeek!,
			startDate: e.startDate!,
			endDate: e.endDate!,
			isEven: e.isWeekEven!,
			dayOfWeek: e.dayOfWeek!,
		),
		date: e.date
	),
	percentOfGroup: e.percentOfGroup,
	isInLectureHall: e.isInLectureHall,
	isOnline: e.isOnline,
	comment: e.comment,
)).toList();
}
