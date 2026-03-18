import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetable_app/features/exams_page/data/datasources/api/exam_remote_data_source_int.dart';
import 'package:timetable_app/features/exams_page/data/datasources/database/exams_dao.dart';
import 'package:timetable_app/features/exams_page/data/models/exam_dto_mapper.dart';
import 'package:timetable_app/features/exams_page/data/models/exam_table.dart';
import 'package:timetable_app/features/exams_page/domain/entities/exam.dart';
import 'package:timetable_app/features/exams_page/domain/repo_ints/exam_repo_int.dart';
import 'package:timetable_app/shared/data/shared_prefs_keys.dart';

class ExamRepo implements ExamRepoInt {
	final ExamsDao db;
  final SharedPreferences prefs;
	final ExamRemoteDataSourceInt api;

  ExamRepo({
		required this.db,
		required this.prefs,
		required this.api,
	});

  @override
  Future<DateTime> ensureExamsUpToDateForUser() async {
		DateTime? lastUpdate = DateTime.tryParse(
			prefs.getString(userExamsUpdatedAt) ?? ""
		);
		if (lastUpdate != null && DateTime.now().difference(lastUpdate).inHours < 12) {
			return lastUpdate;
		}
		return updateExamsForUser();
  }

  @override
  Future<DateTime> updateExamsForUser() async {
		await _loadForGroupFromServer(_getUserGroup());
		DateTime now = DateTime.now();
		prefs.setString(userExamsUpdatedAt, now.toIso8601String());
		return now;
  }

  @override
  Stream<List<Exam>> getAllForUser() {
    return db.getAllForGroup(_getUserGroup()).map((data) => data.toExamList());
  }
  
  Future<void> _loadForGroupFromServer(String groupname) async {
    List<Exam> exams = (await api.getByGroup(
      _getUserGroup(),
    )).map((e) => e.toExam()).toList();
    await db.saveAll(exams.toCompanions());
  }

  String _getUserGroup() {
    String? group = prefs.getString(userGroupKey);
    if (group == null) {
      throw Exception("Группа пользователя не задана");
    }
    return group;
  }
}
