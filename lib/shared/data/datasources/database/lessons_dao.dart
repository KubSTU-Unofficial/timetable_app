import 'package:drift/drift.dart';
import 'package:timetable_app/core/data/database/database.dart';
import 'package:timetable_app/shared/data/models/class/lessons_table.dart';

part 'lessons_dao.g.dart';

@DriftAccessor(tables: [Lessons])
class LessonsDao extends DatabaseAccessor<Database> with _$LessonsDaoMixin {
  LessonsDao(super.attachedDatabase);
  
}
