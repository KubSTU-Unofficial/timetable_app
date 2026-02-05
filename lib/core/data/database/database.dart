import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:timetable_app/features/initial_settings/data/datasources/database/groups_dao.dart';
import 'package:timetable_app/features/initial_settings/data/models/groups_table.dart';
part 'database.g.dart';


@DriftDatabase(tables: [Groups], daos: [GroupsDao])
class Database extends _$Database {
	Database([QueryExecutor? executor]) : super(executor ?? _openConnection());

	@override
	int get schemaVersion => 1;

	static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }
}
