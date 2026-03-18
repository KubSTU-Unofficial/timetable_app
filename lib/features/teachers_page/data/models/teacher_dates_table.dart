import 'package:drift/drift.dart';

@DataClassName("TeacherDatesEntry")
class TeacherDates extends Table {
	TextColumn get name => text()();
	DateTimeColumn get date => dateTime().nullable()();
	DateTimeColumn get updatedAt => dateTime().nullable()();

	@override
	Set<Column<Object>>? get primaryKey => {name, date};
}
