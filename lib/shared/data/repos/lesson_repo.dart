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
  Future<List<Lesson>> getAllForUserGroup() async {
    await _ensureInitialLoading();
    return (await db.selectByGroup(_getUserGroup())).toLessonList();
  }

  @override
  Future<List<Lesson>> getForDateForUserGroup(DateTime date) async {
    await _ensureInitialLoading();
    return (await db.getForDateForGroup(date, _getUserGroup())).toLessonList();
  }

  String _getUserGroup() {
    String? group = prefs.getString(userGroupKey);
    if (group == null) {
      throw Exception("Группа пользователя не задана");
    }
    return group;
  }

  Future<void> _ensureInitialLoading() async {
    if (!(prefs.getBool(initialGroupLoadingDone) ?? false)) {
      _loadForGroupFromServer(_getUserGroup());
    }
  }

  Future<void> _loadForGroupFromServer(String groupname) async {
    List<Lesson> lessons = (await api.getByGroup(
      _getUserGroup(),
    )).map((e) => e.toLesson()).toList();
    await db.saveAllForGroup(lessons.toCompanions());
  }
}
