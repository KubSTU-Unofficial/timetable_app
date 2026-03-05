// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessons_dao.dart';

// ignore_for_file: type=lint
mixin _$LessonsDaoMixin on DatabaseAccessor<Database> {
  $LessonsTable get lessons => attachedDatabase.lessons;
  $TeacherDatesTable get teacherDates => attachedDatabase.teacherDates;
  LessonsDaoManager get managers => LessonsDaoManager(this);
}

class LessonsDaoManager {
  final _$LessonsDaoMixin _db;
  LessonsDaoManager(this._db);
  $$LessonsTableTableManager get lessons =>
      $$LessonsTableTableManager(_db.attachedDatabase, _db.lessons);
  $$TeacherDatesTableTableManager get teacherDates =>
      $$TeacherDatesTableTableManager(_db.attachedDatabase, _db.teacherDates);
}
