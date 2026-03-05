// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teachers_dao.dart';

// ignore_for_file: type=lint
mixin _$TeachersDaoMixin on DatabaseAccessor<Database> {
  $TeacherDatesTable get teacherDates => attachedDatabase.teacherDates;
  TeachersDaoManager get managers => TeachersDaoManager(this);
}

class TeachersDaoManager {
  final _$TeachersDaoMixin _db;
  TeachersDaoManager(this._db);
  $$TeacherDatesTableTableManager get teacherDates =>
      $$TeacherDatesTableTableManager(_db.attachedDatabase, _db.teacherDates);
}
