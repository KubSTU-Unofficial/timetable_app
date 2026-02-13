import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetable_app/shared/data/datasources/api/lessons/lesson_remote_data_source_int.dart';
import 'package:timetable_app/shared/data/datasources/database/lessons_dao.dart';
import 'package:timetable_app/shared/data/models/class/lesson_mapper.dart';
import 'package:timetable_app/shared/data/models/class/lessons_table.dart';
import 'package:timetable_app/shared/data/shared_prefs_keys.dart';
import 'package:timetable_app/shared/domain/entities/lesson.dart';
import 'package:timetable_app/shared/domain/repo_ints/lesson_repo_int.dart';

class LessonRepo implements LessonRepoInt {
  final LessonsDao db;
  final LessonRemoteDataSourceInt api;
  final SharedPreferences prefs;

  LessonRepo({required this.db, required this.api, required this.prefs});

  @override
  Stream<List<Lesson>> getAllForUserGroup() {
    return db.selectByGroup(_getUserGroup()).map((data) => data.toLessonList());
  }

  @override
  Stream<List<Lesson>> getForDateForUserGroup(DateTime date) {
    return db.getForDateForGroup(date, _getUserGroup()).map((data) => data.toLessonList());
  }

  String _getUserGroup() {
    String? group = prefs.getString(userGroupKey);
    if (group == null) {
      throw Exception("Группа пользователя не задана");
    }
    return group;
  }

  Future<void> _loadForGroupFromServer(String groupname) async {
    List<Lesson> lessons = (await api.getByGroup(
      _getUserGroup(),
    )).map((e) => e.toLesson()).toList();
    await db.saveAllForGroup(lessons.toCompanions());
  }

	// Не обновляет данные, просто проверяет, недавно ли они обновлены
	// Для обновления нужен будет отдельный метод
  @override
  Future<DateTime> ensureLessonsUpToDateForUser() async {
		DateTime? lastUpdate = DateTime.tryParse(
			prefs.getString(userLessonsUpdatedAt) ?? ""
		);
		if (lastUpdate != null && DateTime.now().difference(lastUpdate).inHours < 12) {
			return lastUpdate;
		}
		await _loadForGroupFromServer(_getUserGroup());
		DateTime now = DateTime.now();
		prefs.setString(userLessonsUpdatedAt, now.toIso8601String());
		return now;
  }
}
