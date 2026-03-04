// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessons_dao.dart';

// ignore_for_file: type=lint
mixin _$LessonsDaoMixin on DatabaseAccessor<Database> {
  $LessonsTable get lessons => attachedDatabase.lessons;
  $TeachersTable get teachers => attachedDatabase.teachers;
  LessonsDaoManager get managers => LessonsDaoManager(this);
}

class LessonsDaoManager {
  final _$LessonsDaoMixin _db;
  LessonsDaoManager(this._db);
  $$LessonsTableTableManager get lessons =>
      $$LessonsTableTableManager(_db.attachedDatabase, _db.lessons);
  $$TeachersTableTableManager get teachers =>
      $$TeachersTableTableManager(_db.attachedDatabase, _db.teachers);
}
