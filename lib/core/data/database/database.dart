import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:timetable_app/features/exams_page/data/datasources/database/exams_dao.dart' show ExamsDao;
import 'package:timetable_app/features/exams_page/data/models/exam_table.dart';
import 'package:timetable_app/features/initial_settings_page/data/datasources/database/groups_dao.dart';
import 'package:timetable_app/features/initial_settings_page/data/models/groups_table.dart';
import 'package:timetable_app/features/teachers_page/data/datasources/database/teachers_dao.dart';
import 'package:timetable_app/features/teachers_page/data/models/teachers_table.dart';
import 'package:timetable_app/shared/data/datasources/database/lessons_dao.dart';
import 'package:timetable_app/shared/data/models/class/lessons_table.dart';
part 'database.g.dart';


@DriftDatabase(
	tables: [Groups, Lessons, Exams, Teachers],
	daos: [GroupsDao, LessonsDao, ExamsDao, TeachersDao]
)
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
