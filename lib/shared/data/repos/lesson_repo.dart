import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetable_app/features/teachers_page/data/datasources/database/teachers_dao.dart';
import 'package:timetable_app/shared/data/datasources/api/lessons/lesson_remote_data_source_int.dart';
import 'package:timetable_app/shared/data/datasources/database/lessons_dao.dart';
import 'package:timetable_app/shared/data/models/class/lesson_mapper.dart';
import 'package:timetable_app/shared/data/models/class/lessons_table.dart';
import 'package:timetable_app/shared/data/shared_prefs_keys.dart';
import 'package:timetable_app/shared/domain/entities/lesson.dart';
import 'package:timetable_app/shared/domain/repo_ints/lesson_repo_int.dart';

class LessonRepo implements LessonRepoInt {
  final LessonsDao lessonsDao;
  final TeachersDao teachersDao;
  final LessonRemoteDataSourceInt api;
  final SharedPreferences prefs;

  LessonRepo({required this.lessonsDao, required this.teachersDao, required this.api, required this.prefs});


  @override
  Stream<List<Lesson>> getAllForUserGroup() {
    return lessonsDao.selectByGroup(_getUserGroup()).map((data) => data.toLessonList());
  }

  @override
  Stream<List<Lesson>> getForDateForUserGroup(DateTime date) {
    return lessonsDao.getForDateForGroup(date, _getUserGroup()).map((data) => data.toLessonList());
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
    await lessonsDao.saveAllForGroup(lessons.toCompanions());
  }

  @override
  Future<DateTime> ensureLessonsUpToDateForUser() async {
		DateTime? lastUpdate = DateTime.tryParse(
			prefs.getString(userLessonsUpdatedAt) ?? ""
		);
		if (lastUpdate != null && DateTime.now().difference(lastUpdate).inHours < 12) {
			return lastUpdate;
		}
		return updateLessonsForUser();
  }

  @override
  Future<DateTime> updateLessonsForUser() async {
		DateTime? lastUpdate = DateTime.tryParse(
			prefs.getString(userLessonsUpdatedAt) ?? ""
		);
		if ((lastUpdate?.difference(DateTime.now()).inMinutes ?? 2).abs() > 1) {
			await _loadForGroupFromServer(_getUserGroup());
		}
		DateTime now = DateTime.now();
		prefs.setString(userLessonsUpdatedAt, now.toIso8601String());
		return now;
  }

  @override
  Stream<List<Lesson>> getNextForDateForUserGroup(DateTime date) {
		return lessonsDao.getNextForDateForGroup(date, _getUserGroup()).map((data) => data.toLessonList());
  }

  @override
  Stream<List<Lesson>> getAllForTeacher(String name) {
		// Раскомментируем, когда будет готов API
		// teachersDao.getUpdateDate(name).then((updatedAt) {
		// 	if (updatedAt == null || DateTime.now().difference(updatedAt).inHours > 12) {
		// 		(api.getByTeacher(name)).then((value) => {
		// 			lessonsDao.saveAllForTeacher(
		// 				value.map((e) => e.toLesson()).toList().toCompanions()
		// 			)
		// 		});
		// 	}
		// });
		return lessonsDao.selectByTeacher(name).map((e) => e.toLessonList());
  }
}
