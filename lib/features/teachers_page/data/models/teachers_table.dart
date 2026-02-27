import 'package:drift/drift.dart';

@DataClassName("TeachersEntry")
class Teachers extends Table {
	TextColumn get name => text()();
	DateTimeColumn get updatedAt => dateTime()();

	@override
	Set<Column<Object>>? get primaryKey => {name};
}
