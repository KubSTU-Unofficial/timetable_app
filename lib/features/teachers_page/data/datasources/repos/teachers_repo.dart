import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetable_app/features/teachers_page/data/datasources/database/teachers_dao.dart';
import 'package:timetable_app/features/teachers_page/domain/repo_ints/teachers_repo_int.dart';
import 'package:timetable_app/shared/data/shared_prefs_keys.dart';

class  TeachersRepo implements TeachersRepoInt {
	final SharedPreferences prefs;
	final TeachersDao db;
	final TeachersRepoInt api;

  TeachersRepo({required this.prefs, required this.db, required this.api});

  @override
  Future<List<String>> getTeachersList() async {
		DateTime? lastUpdate = DateTime.tryParse(
			prefs.getString(teachersUpdatedAtKey) ?? ""
		);
		if (lastUpdate != null && DateTime.now().difference(lastUpdate).inDays > 60) {
			db.updateAll(await api.getTeachersList());
		}
		return await db.getAll();
  }
  
}
