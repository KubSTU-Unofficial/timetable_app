// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $GroupsTable extends Groups with TableInfo<$GroupsTable, GroupsEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'groups';
  @override
  VerificationContext validateIntegrity(
    Insertable<GroupsEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  GroupsEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GroupsEntry(
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $GroupsTable createAlias(String alias) {
    return $GroupsTable(attachedDatabase, alias);
  }
}

class GroupsEntry extends DataClass implements Insertable<GroupsEntry> {
  final String name;
  const GroupsEntry({required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    return map;
  }

  GroupsCompanion toCompanion(bool nullToAbsent) {
    return GroupsCompanion(name: Value(name));
  }

  factory GroupsEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GroupsEntry(name: serializer.fromJson<String>(json['name']));
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'name': serializer.toJson<String>(name)};
  }

  GroupsEntry copyWith({String? name}) => GroupsEntry(name: name ?? this.name);
  GroupsEntry copyWithCompanion(GroupsCompanion data) {
    return GroupsEntry(name: data.name.present ? data.name.value : this.name);
  }

  @override
  String toString() {
    return (StringBuffer('GroupsEntry(')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => name.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GroupsEntry && other.name == this.name);
}

class GroupsCompanion extends UpdateCompanion<GroupsEntry> {
  final Value<String> name;
  final Value<int> rowid;
  const GroupsCompanion({
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GroupsCompanion.insert({
    required String name,
    this.rowid = const Value.absent(),
  }) : name = Value(name);
  static Insertable<GroupsEntry> custom({
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GroupsCompanion copyWith({Value<String>? name, Value<int>? rowid}) {
    return GroupsCompanion(name: name ?? this.name, rowid: rowid ?? this.rowid);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroupsCompanion(')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LessonsTable extends Lessons
    with TableInfo<$LessonsTable, LessonsEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LessonsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _groupMeta = const VerificationMeta('group');
  @override
  late final GeneratedColumn<String> group = GeneratedColumn<String>(
    'group',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _teacherNameMeta = const VerificationMeta(
    'teacherName',
  );
  @override
  late final GeneratedColumn<String> teacherName = GeneratedColumn<String>(
    'teacher_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _classroomMeta = const VerificationMeta(
    'classroom',
  );
  @override
  late final GeneratedColumn<String> classroom = GeneratedColumn<String>(
    'classroom',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
    'year',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _semesterMeta = const VerificationMeta(
    'semester',
  );
  @override
  late final GeneratedColumn<int> semester = GeneratedColumn<int>(
    'semester',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lessonNumberMeta = const VerificationMeta(
    'lessonNumber',
  );
  @override
  late final GeneratedColumn<int> lessonNumber = GeneratedColumn<int>(
    'lesson_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fromWeekMeta = const VerificationMeta(
    'fromWeek',
  );
  @override
  late final GeneratedColumn<int> fromWeek = GeneratedColumn<int>(
    'from_week',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _toWeekMeta = const VerificationMeta('toWeek');
  @override
  late final GeneratedColumn<int> toWeek = GeneratedColumn<int>(
    'to_week',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isWeekEvenMeta = const VerificationMeta(
    'isWeekEven',
  );
  @override
  late final GeneratedColumn<bool> isWeekEven = GeneratedColumn<bool>(
    'is_week_even',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_week_even" IN (0, 1))',
    ),
  );
  static const VerificationMeta _dayOfWeekMeta = const VerificationMeta(
    'dayOfWeek',
  );
  @override
  late final GeneratedColumn<int> dayOfWeek = GeneratedColumn<int>(
    'day_of_week',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _percentOfGroupMeta = const VerificationMeta(
    'percentOfGroup',
  );
  @override
  late final GeneratedColumn<int> percentOfGroup = GeneratedColumn<int>(
    'percent_of_group',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isInLectureHallMeta = const VerificationMeta(
    'isInLectureHall',
  );
  @override
  late final GeneratedColumn<bool> isInLectureHall = GeneratedColumn<bool>(
    'is_in_lecture_hall',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_in_lecture_hall" IN (0, 1))',
    ),
  );
  static const VerificationMeta _isOnlineMeta = const VerificationMeta(
    'isOnline',
  );
  @override
  late final GeneratedColumn<bool> isOnline = GeneratedColumn<bool>(
    'is_online',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_online" IN (0, 1))',
    ),
  );
  static const VerificationMeta _commentMeta = const VerificationMeta(
    'comment',
  );
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
    'comment',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    group,
    name,
    type,
    teacherName,
    classroom,
    year,
    semester,
    lessonNumber,
    fromWeek,
    toWeek,
    startDate,
    endDate,
    isWeekEven,
    dayOfWeek,
    date,
    percentOfGroup,
    isInLectureHall,
    isOnline,
    comment,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lessons';
  @override
  VerificationContext validateIntegrity(
    Insertable<LessonsEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('group')) {
      context.handle(
        _groupMeta,
        group.isAcceptableOrUnknown(data['group']!, _groupMeta),
      );
    } else if (isInserting) {
      context.missing(_groupMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('teacher_name')) {
      context.handle(
        _teacherNameMeta,
        teacherName.isAcceptableOrUnknown(
          data['teacher_name']!,
          _teacherNameMeta,
        ),
      );
    }
    if (data.containsKey('classroom')) {
      context.handle(
        _classroomMeta,
        classroom.isAcceptableOrUnknown(data['classroom']!, _classroomMeta),
      );
    }
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('semester')) {
      context.handle(
        _semesterMeta,
        semester.isAcceptableOrUnknown(data['semester']!, _semesterMeta),
      );
    } else if (isInserting) {
      context.missing(_semesterMeta);
    }
    if (data.containsKey('lesson_number')) {
      context.handle(
        _lessonNumberMeta,
        lessonNumber.isAcceptableOrUnknown(
          data['lesson_number']!,
          _lessonNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lessonNumberMeta);
    }
    if (data.containsKey('from_week')) {
      context.handle(
        _fromWeekMeta,
        fromWeek.isAcceptableOrUnknown(data['from_week']!, _fromWeekMeta),
      );
    }
    if (data.containsKey('to_week')) {
      context.handle(
        _toWeekMeta,
        toWeek.isAcceptableOrUnknown(data['to_week']!, _toWeekMeta),
      );
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    if (data.containsKey('is_week_even')) {
      context.handle(
        _isWeekEvenMeta,
        isWeekEven.isAcceptableOrUnknown(
          data['is_week_even']!,
          _isWeekEvenMeta,
        ),
      );
    }
    if (data.containsKey('day_of_week')) {
      context.handle(
        _dayOfWeekMeta,
        dayOfWeek.isAcceptableOrUnknown(data['day_of_week']!, _dayOfWeekMeta),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    }
    if (data.containsKey('percent_of_group')) {
      context.handle(
        _percentOfGroupMeta,
        percentOfGroup.isAcceptableOrUnknown(
          data['percent_of_group']!,
          _percentOfGroupMeta,
        ),
      );
    }
    if (data.containsKey('is_in_lecture_hall')) {
      context.handle(
        _isInLectureHallMeta,
        isInLectureHall.isAcceptableOrUnknown(
          data['is_in_lecture_hall']!,
          _isInLectureHallMeta,
        ),
      );
    }
    if (data.containsKey('is_online')) {
      context.handle(
        _isOnlineMeta,
        isOnline.isAcceptableOrUnknown(data['is_online']!, _isOnlineMeta),
      );
    }
    if (data.containsKey('comment')) {
      context.handle(
        _commentMeta,
        comment.isAcceptableOrUnknown(data['comment']!, _commentMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  LessonsEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LessonsEntry(
      group: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}type'],
      )!,
      teacherName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}teacher_name'],
      ),
      classroom: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}classroom'],
      ),
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}year'],
      )!,
      semester: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}semester'],
      )!,
      lessonNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}lesson_number'],
      )!,
      fromWeek: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}from_week'],
      ),
      toWeek: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}to_week'],
      ),
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      ),
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      ),
      isWeekEven: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_week_even'],
      ),
      dayOfWeek: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day_of_week'],
      ),
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      ),
      percentOfGroup: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}percent_of_group'],
      ),
      isInLectureHall: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_in_lecture_hall'],
      ),
      isOnline: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_online'],
      ),
      comment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}comment'],
      ),
    );
  }

  @override
  $LessonsTable createAlias(String alias) {
    return $LessonsTable(attachedDatabase, alias);
  }
}

class LessonsEntry extends DataClass implements Insertable<LessonsEntry> {
  final String group;
  final String name;
  final int type;
  final String? teacherName;
  final String? classroom;
  final int year;
  final int semester;
  final int lessonNumber;
  final int? fromWeek;
  final int? toWeek;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool? isWeekEven;
  final int? dayOfWeek;
  final DateTime? date;
  final int? percentOfGroup;
  final bool? isInLectureHall;
  final bool? isOnline;
  final String? comment;
  const LessonsEntry({
    required this.group,
    required this.name,
    required this.type,
    this.teacherName,
    this.classroom,
    required this.year,
    required this.semester,
    required this.lessonNumber,
    this.fromWeek,
    this.toWeek,
    this.startDate,
    this.endDate,
    this.isWeekEven,
    this.dayOfWeek,
    this.date,
    this.percentOfGroup,
    this.isInLectureHall,
    this.isOnline,
    this.comment,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['group'] = Variable<String>(group);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<int>(type);
    if (!nullToAbsent || teacherName != null) {
      map['teacher_name'] = Variable<String>(teacherName);
    }
    if (!nullToAbsent || classroom != null) {
      map['classroom'] = Variable<String>(classroom);
    }
    map['year'] = Variable<int>(year);
    map['semester'] = Variable<int>(semester);
    map['lesson_number'] = Variable<int>(lessonNumber);
    if (!nullToAbsent || fromWeek != null) {
      map['from_week'] = Variable<int>(fromWeek);
    }
    if (!nullToAbsent || toWeek != null) {
      map['to_week'] = Variable<int>(toWeek);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    if (!nullToAbsent || isWeekEven != null) {
      map['is_week_even'] = Variable<bool>(isWeekEven);
    }
    if (!nullToAbsent || dayOfWeek != null) {
      map['day_of_week'] = Variable<int>(dayOfWeek);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || percentOfGroup != null) {
      map['percent_of_group'] = Variable<int>(percentOfGroup);
    }
    if (!nullToAbsent || isInLectureHall != null) {
      map['is_in_lecture_hall'] = Variable<bool>(isInLectureHall);
    }
    if (!nullToAbsent || isOnline != null) {
      map['is_online'] = Variable<bool>(isOnline);
    }
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String>(comment);
    }
    return map;
  }

  LessonsCompanion toCompanion(bool nullToAbsent) {
    return LessonsCompanion(
      group: Value(group),
      name: Value(name),
      type: Value(type),
      teacherName: teacherName == null && nullToAbsent
          ? const Value.absent()
          : Value(teacherName),
      classroom: classroom == null && nullToAbsent
          ? const Value.absent()
          : Value(classroom),
      year: Value(year),
      semester: Value(semester),
      lessonNumber: Value(lessonNumber),
      fromWeek: fromWeek == null && nullToAbsent
          ? const Value.absent()
          : Value(fromWeek),
      toWeek: toWeek == null && nullToAbsent
          ? const Value.absent()
          : Value(toWeek),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      isWeekEven: isWeekEven == null && nullToAbsent
          ? const Value.absent()
          : Value(isWeekEven),
      dayOfWeek: dayOfWeek == null && nullToAbsent
          ? const Value.absent()
          : Value(dayOfWeek),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      percentOfGroup: percentOfGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(percentOfGroup),
      isInLectureHall: isInLectureHall == null && nullToAbsent
          ? const Value.absent()
          : Value(isInLectureHall),
      isOnline: isOnline == null && nullToAbsent
          ? const Value.absent()
          : Value(isOnline),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
    );
  }

  factory LessonsEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LessonsEntry(
      group: serializer.fromJson<String>(json['group']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<int>(json['type']),
      teacherName: serializer.fromJson<String?>(json['teacherName']),
      classroom: serializer.fromJson<String?>(json['classroom']),
      year: serializer.fromJson<int>(json['year']),
      semester: serializer.fromJson<int>(json['semester']),
      lessonNumber: serializer.fromJson<int>(json['lessonNumber']),
      fromWeek: serializer.fromJson<int?>(json['fromWeek']),
      toWeek: serializer.fromJson<int?>(json['toWeek']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      isWeekEven: serializer.fromJson<bool?>(json['isWeekEven']),
      dayOfWeek: serializer.fromJson<int?>(json['dayOfWeek']),
      date: serializer.fromJson<DateTime?>(json['date']),
      percentOfGroup: serializer.fromJson<int?>(json['percentOfGroup']),
      isInLectureHall: serializer.fromJson<bool?>(json['isInLectureHall']),
      isOnline: serializer.fromJson<bool?>(json['isOnline']),
      comment: serializer.fromJson<String?>(json['comment']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'group': serializer.toJson<String>(group),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<int>(type),
      'teacherName': serializer.toJson<String?>(teacherName),
      'classroom': serializer.toJson<String?>(classroom),
      'year': serializer.toJson<int>(year),
      'semester': serializer.toJson<int>(semester),
      'lessonNumber': serializer.toJson<int>(lessonNumber),
      'fromWeek': serializer.toJson<int?>(fromWeek),
      'toWeek': serializer.toJson<int?>(toWeek),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'isWeekEven': serializer.toJson<bool?>(isWeekEven),
      'dayOfWeek': serializer.toJson<int?>(dayOfWeek),
      'date': serializer.toJson<DateTime?>(date),
      'percentOfGroup': serializer.toJson<int?>(percentOfGroup),
      'isInLectureHall': serializer.toJson<bool?>(isInLectureHall),
      'isOnline': serializer.toJson<bool?>(isOnline),
      'comment': serializer.toJson<String?>(comment),
    };
  }

  LessonsEntry copyWith({
    String? group,
    String? name,
    int? type,
    Value<String?> teacherName = const Value.absent(),
    Value<String?> classroom = const Value.absent(),
    int? year,
    int? semester,
    int? lessonNumber,
    Value<int?> fromWeek = const Value.absent(),
    Value<int?> toWeek = const Value.absent(),
    Value<DateTime?> startDate = const Value.absent(),
    Value<DateTime?> endDate = const Value.absent(),
    Value<bool?> isWeekEven = const Value.absent(),
    Value<int?> dayOfWeek = const Value.absent(),
    Value<DateTime?> date = const Value.absent(),
    Value<int?> percentOfGroup = const Value.absent(),
    Value<bool?> isInLectureHall = const Value.absent(),
    Value<bool?> isOnline = const Value.absent(),
    Value<String?> comment = const Value.absent(),
  }) => LessonsEntry(
    group: group ?? this.group,
    name: name ?? this.name,
    type: type ?? this.type,
    teacherName: teacherName.present ? teacherName.value : this.teacherName,
    classroom: classroom.present ? classroom.value : this.classroom,
    year: year ?? this.year,
    semester: semester ?? this.semester,
    lessonNumber: lessonNumber ?? this.lessonNumber,
    fromWeek: fromWeek.present ? fromWeek.value : this.fromWeek,
    toWeek: toWeek.present ? toWeek.value : this.toWeek,
    startDate: startDate.present ? startDate.value : this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    isWeekEven: isWeekEven.present ? isWeekEven.value : this.isWeekEven,
    dayOfWeek: dayOfWeek.present ? dayOfWeek.value : this.dayOfWeek,
    date: date.present ? date.value : this.date,
    percentOfGroup: percentOfGroup.present
        ? percentOfGroup.value
        : this.percentOfGroup,
    isInLectureHall: isInLectureHall.present
        ? isInLectureHall.value
        : this.isInLectureHall,
    isOnline: isOnline.present ? isOnline.value : this.isOnline,
    comment: comment.present ? comment.value : this.comment,
  );
  LessonsEntry copyWithCompanion(LessonsCompanion data) {
    return LessonsEntry(
      group: data.group.present ? data.group.value : this.group,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      teacherName: data.teacherName.present
          ? data.teacherName.value
          : this.teacherName,
      classroom: data.classroom.present ? data.classroom.value : this.classroom,
      year: data.year.present ? data.year.value : this.year,
      semester: data.semester.present ? data.semester.value : this.semester,
      lessonNumber: data.lessonNumber.present
          ? data.lessonNumber.value
          : this.lessonNumber,
      fromWeek: data.fromWeek.present ? data.fromWeek.value : this.fromWeek,
      toWeek: data.toWeek.present ? data.toWeek.value : this.toWeek,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      isWeekEven: data.isWeekEven.present
          ? data.isWeekEven.value
          : this.isWeekEven,
      dayOfWeek: data.dayOfWeek.present ? data.dayOfWeek.value : this.dayOfWeek,
      date: data.date.present ? data.date.value : this.date,
      percentOfGroup: data.percentOfGroup.present
          ? data.percentOfGroup.value
          : this.percentOfGroup,
      isInLectureHall: data.isInLectureHall.present
          ? data.isInLectureHall.value
          : this.isInLectureHall,
      isOnline: data.isOnline.present ? data.isOnline.value : this.isOnline,
      comment: data.comment.present ? data.comment.value : this.comment,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LessonsEntry(')
          ..write('group: $group, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('teacherName: $teacherName, ')
          ..write('classroom: $classroom, ')
          ..write('year: $year, ')
          ..write('semester: $semester, ')
          ..write('lessonNumber: $lessonNumber, ')
          ..write('fromWeek: $fromWeek, ')
          ..write('toWeek: $toWeek, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isWeekEven: $isWeekEven, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('date: $date, ')
          ..write('percentOfGroup: $percentOfGroup, ')
          ..write('isInLectureHall: $isInLectureHall, ')
          ..write('isOnline: $isOnline, ')
          ..write('comment: $comment')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    group,
    name,
    type,
    teacherName,
    classroom,
    year,
    semester,
    lessonNumber,
    fromWeek,
    toWeek,
    startDate,
    endDate,
    isWeekEven,
    dayOfWeek,
    date,
    percentOfGroup,
    isInLectureHall,
    isOnline,
    comment,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LessonsEntry &&
          other.group == this.group &&
          other.name == this.name &&
          other.type == this.type &&
          other.teacherName == this.teacherName &&
          other.classroom == this.classroom &&
          other.year == this.year &&
          other.semester == this.semester &&
          other.lessonNumber == this.lessonNumber &&
          other.fromWeek == this.fromWeek &&
          other.toWeek == this.toWeek &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.isWeekEven == this.isWeekEven &&
          other.dayOfWeek == this.dayOfWeek &&
          other.date == this.date &&
          other.percentOfGroup == this.percentOfGroup &&
          other.isInLectureHall == this.isInLectureHall &&
          other.isOnline == this.isOnline &&
          other.comment == this.comment);
}

class LessonsCompanion extends UpdateCompanion<LessonsEntry> {
  final Value<String> group;
  final Value<String> name;
  final Value<int> type;
  final Value<String?> teacherName;
  final Value<String?> classroom;
  final Value<int> year;
  final Value<int> semester;
  final Value<int> lessonNumber;
  final Value<int?> fromWeek;
  final Value<int?> toWeek;
  final Value<DateTime?> startDate;
  final Value<DateTime?> endDate;
  final Value<bool?> isWeekEven;
  final Value<int?> dayOfWeek;
  final Value<DateTime?> date;
  final Value<int?> percentOfGroup;
  final Value<bool?> isInLectureHall;
  final Value<bool?> isOnline;
  final Value<String?> comment;
  final Value<int> rowid;
  const LessonsCompanion({
    this.group = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.teacherName = const Value.absent(),
    this.classroom = const Value.absent(),
    this.year = const Value.absent(),
    this.semester = const Value.absent(),
    this.lessonNumber = const Value.absent(),
    this.fromWeek = const Value.absent(),
    this.toWeek = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.isWeekEven = const Value.absent(),
    this.dayOfWeek = const Value.absent(),
    this.date = const Value.absent(),
    this.percentOfGroup = const Value.absent(),
    this.isInLectureHall = const Value.absent(),
    this.isOnline = const Value.absent(),
    this.comment = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LessonsCompanion.insert({
    required String group,
    required String name,
    required int type,
    this.teacherName = const Value.absent(),
    this.classroom = const Value.absent(),
    required int year,
    required int semester,
    required int lessonNumber,
    this.fromWeek = const Value.absent(),
    this.toWeek = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.isWeekEven = const Value.absent(),
    this.dayOfWeek = const Value.absent(),
    this.date = const Value.absent(),
    this.percentOfGroup = const Value.absent(),
    this.isInLectureHall = const Value.absent(),
    this.isOnline = const Value.absent(),
    this.comment = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : group = Value(group),
       name = Value(name),
       type = Value(type),
       year = Value(year),
       semester = Value(semester),
       lessonNumber = Value(lessonNumber);
  static Insertable<LessonsEntry> custom({
    Expression<String>? group,
    Expression<String>? name,
    Expression<int>? type,
    Expression<String>? teacherName,
    Expression<String>? classroom,
    Expression<int>? year,
    Expression<int>? semester,
    Expression<int>? lessonNumber,
    Expression<int>? fromWeek,
    Expression<int>? toWeek,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<bool>? isWeekEven,
    Expression<int>? dayOfWeek,
    Expression<DateTime>? date,
    Expression<int>? percentOfGroup,
    Expression<bool>? isInLectureHall,
    Expression<bool>? isOnline,
    Expression<String>? comment,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (group != null) 'group': group,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (teacherName != null) 'teacher_name': teacherName,
      if (classroom != null) 'classroom': classroom,
      if (year != null) 'year': year,
      if (semester != null) 'semester': semester,
      if (lessonNumber != null) 'lesson_number': lessonNumber,
      if (fromWeek != null) 'from_week': fromWeek,
      if (toWeek != null) 'to_week': toWeek,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (isWeekEven != null) 'is_week_even': isWeekEven,
      if (dayOfWeek != null) 'day_of_week': dayOfWeek,
      if (date != null) 'date': date,
      if (percentOfGroup != null) 'percent_of_group': percentOfGroup,
      if (isInLectureHall != null) 'is_in_lecture_hall': isInLectureHall,
      if (isOnline != null) 'is_online': isOnline,
      if (comment != null) 'comment': comment,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LessonsCompanion copyWith({
    Value<String>? group,
    Value<String>? name,
    Value<int>? type,
    Value<String?>? teacherName,
    Value<String?>? classroom,
    Value<int>? year,
    Value<int>? semester,
    Value<int>? lessonNumber,
    Value<int?>? fromWeek,
    Value<int?>? toWeek,
    Value<DateTime?>? startDate,
    Value<DateTime?>? endDate,
    Value<bool?>? isWeekEven,
    Value<int?>? dayOfWeek,
    Value<DateTime?>? date,
    Value<int?>? percentOfGroup,
    Value<bool?>? isInLectureHall,
    Value<bool?>? isOnline,
    Value<String?>? comment,
    Value<int>? rowid,
  }) {
    return LessonsCompanion(
      group: group ?? this.group,
      name: name ?? this.name,
      type: type ?? this.type,
      teacherName: teacherName ?? this.teacherName,
      classroom: classroom ?? this.classroom,
      year: year ?? this.year,
      semester: semester ?? this.semester,
      lessonNumber: lessonNumber ?? this.lessonNumber,
      fromWeek: fromWeek ?? this.fromWeek,
      toWeek: toWeek ?? this.toWeek,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isWeekEven: isWeekEven ?? this.isWeekEven,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      date: date ?? this.date,
      percentOfGroup: percentOfGroup ?? this.percentOfGroup,
      isInLectureHall: isInLectureHall ?? this.isInLectureHall,
      isOnline: isOnline ?? this.isOnline,
      comment: comment ?? this.comment,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (group.present) {
      map['group'] = Variable<String>(group.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (teacherName.present) {
      map['teacher_name'] = Variable<String>(teacherName.value);
    }
    if (classroom.present) {
      map['classroom'] = Variable<String>(classroom.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (semester.present) {
      map['semester'] = Variable<int>(semester.value);
    }
    if (lessonNumber.present) {
      map['lesson_number'] = Variable<int>(lessonNumber.value);
    }
    if (fromWeek.present) {
      map['from_week'] = Variable<int>(fromWeek.value);
    }
    if (toWeek.present) {
      map['to_week'] = Variable<int>(toWeek.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (isWeekEven.present) {
      map['is_week_even'] = Variable<bool>(isWeekEven.value);
    }
    if (dayOfWeek.present) {
      map['day_of_week'] = Variable<int>(dayOfWeek.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (percentOfGroup.present) {
      map['percent_of_group'] = Variable<int>(percentOfGroup.value);
    }
    if (isInLectureHall.present) {
      map['is_in_lecture_hall'] = Variable<bool>(isInLectureHall.value);
    }
    if (isOnline.present) {
      map['is_online'] = Variable<bool>(isOnline.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LessonsCompanion(')
          ..write('group: $group, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('teacherName: $teacherName, ')
          ..write('classroom: $classroom, ')
          ..write('year: $year, ')
          ..write('semester: $semester, ')
          ..write('lessonNumber: $lessonNumber, ')
          ..write('fromWeek: $fromWeek, ')
          ..write('toWeek: $toWeek, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isWeekEven: $isWeekEven, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('date: $date, ')
          ..write('percentOfGroup: $percentOfGroup, ')
          ..write('isInLectureHall: $isInLectureHall, ')
          ..write('isOnline: $isOnline, ')
          ..write('comment: $comment, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExamsTable extends Exams with TableInfo<$ExamsTable, ExamsEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExamsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _groupMeta = const VerificationMeta('group');
  @override
  late final GeneratedColumn<String> group = GeneratedColumn<String>(
    'group',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _classroomMeta = const VerificationMeta(
    'classroom',
  );
  @override
  late final GeneratedColumn<String> classroom = GeneratedColumn<String>(
    'classroom',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _teacherMeta = const VerificationMeta(
    'teacher',
  );
  @override
  late final GeneratedColumn<String> teacher = GeneratedColumn<String>(
    'teacher',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
    'year',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _semesterMeta = const VerificationMeta(
    'semester',
  );
  @override
  late final GeneratedColumn<int> semester = GeneratedColumn<int>(
    'semester',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    group,
    name,
    date,
    classroom,
    teacher,
    year,
    semester,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exams';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExamsEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('group')) {
      context.handle(
        _groupMeta,
        group.isAcceptableOrUnknown(data['group']!, _groupMeta),
      );
    } else if (isInserting) {
      context.missing(_groupMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('classroom')) {
      context.handle(
        _classroomMeta,
        classroom.isAcceptableOrUnknown(data['classroom']!, _classroomMeta),
      );
    } else if (isInserting) {
      context.missing(_classroomMeta);
    }
    if (data.containsKey('teacher')) {
      context.handle(
        _teacherMeta,
        teacher.isAcceptableOrUnknown(data['teacher']!, _teacherMeta),
      );
    } else if (isInserting) {
      context.missing(_teacherMeta);
    }
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('semester')) {
      context.handle(
        _semesterMeta,
        semester.isAcceptableOrUnknown(data['semester']!, _semesterMeta),
      );
    } else if (isInserting) {
      context.missing(_semesterMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ExamsEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExamsEntry(
      group: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      classroom: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}classroom'],
      )!,
      teacher: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}teacher'],
      )!,
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}year'],
      )!,
      semester: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}semester'],
      )!,
    );
  }

  @override
  $ExamsTable createAlias(String alias) {
    return $ExamsTable(attachedDatabase, alias);
  }
}

class ExamsEntry extends DataClass implements Insertable<ExamsEntry> {
  final String group;
  final String name;
  final DateTime date;
  final String classroom;
  final String teacher;
  final int year;
  final int semester;
  const ExamsEntry({
    required this.group,
    required this.name,
    required this.date,
    required this.classroom,
    required this.teacher,
    required this.year,
    required this.semester,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['group'] = Variable<String>(group);
    map['name'] = Variable<String>(name);
    map['date'] = Variable<DateTime>(date);
    map['classroom'] = Variable<String>(classroom);
    map['teacher'] = Variable<String>(teacher);
    map['year'] = Variable<int>(year);
    map['semester'] = Variable<int>(semester);
    return map;
  }

  ExamsCompanion toCompanion(bool nullToAbsent) {
    return ExamsCompanion(
      group: Value(group),
      name: Value(name),
      date: Value(date),
      classroom: Value(classroom),
      teacher: Value(teacher),
      year: Value(year),
      semester: Value(semester),
    );
  }

  factory ExamsEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExamsEntry(
      group: serializer.fromJson<String>(json['group']),
      name: serializer.fromJson<String>(json['name']),
      date: serializer.fromJson<DateTime>(json['date']),
      classroom: serializer.fromJson<String>(json['classroom']),
      teacher: serializer.fromJson<String>(json['teacher']),
      year: serializer.fromJson<int>(json['year']),
      semester: serializer.fromJson<int>(json['semester']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'group': serializer.toJson<String>(group),
      'name': serializer.toJson<String>(name),
      'date': serializer.toJson<DateTime>(date),
      'classroom': serializer.toJson<String>(classroom),
      'teacher': serializer.toJson<String>(teacher),
      'year': serializer.toJson<int>(year),
      'semester': serializer.toJson<int>(semester),
    };
  }

  ExamsEntry copyWith({
    String? group,
    String? name,
    DateTime? date,
    String? classroom,
    String? teacher,
    int? year,
    int? semester,
  }) => ExamsEntry(
    group: group ?? this.group,
    name: name ?? this.name,
    date: date ?? this.date,
    classroom: classroom ?? this.classroom,
    teacher: teacher ?? this.teacher,
    year: year ?? this.year,
    semester: semester ?? this.semester,
  );
  ExamsEntry copyWithCompanion(ExamsCompanion data) {
    return ExamsEntry(
      group: data.group.present ? data.group.value : this.group,
      name: data.name.present ? data.name.value : this.name,
      date: data.date.present ? data.date.value : this.date,
      classroom: data.classroom.present ? data.classroom.value : this.classroom,
      teacher: data.teacher.present ? data.teacher.value : this.teacher,
      year: data.year.present ? data.year.value : this.year,
      semester: data.semester.present ? data.semester.value : this.semester,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExamsEntry(')
          ..write('group: $group, ')
          ..write('name: $name, ')
          ..write('date: $date, ')
          ..write('classroom: $classroom, ')
          ..write('teacher: $teacher, ')
          ..write('year: $year, ')
          ..write('semester: $semester')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(group, name, date, classroom, teacher, year, semester);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExamsEntry &&
          other.group == this.group &&
          other.name == this.name &&
          other.date == this.date &&
          other.classroom == this.classroom &&
          other.teacher == this.teacher &&
          other.year == this.year &&
          other.semester == this.semester);
}

class ExamsCompanion extends UpdateCompanion<ExamsEntry> {
  final Value<String> group;
  final Value<String> name;
  final Value<DateTime> date;
  final Value<String> classroom;
  final Value<String> teacher;
  final Value<int> year;
  final Value<int> semester;
  final Value<int> rowid;
  const ExamsCompanion({
    this.group = const Value.absent(),
    this.name = const Value.absent(),
    this.date = const Value.absent(),
    this.classroom = const Value.absent(),
    this.teacher = const Value.absent(),
    this.year = const Value.absent(),
    this.semester = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExamsCompanion.insert({
    required String group,
    required String name,
    required DateTime date,
    required String classroom,
    required String teacher,
    required int year,
    required int semester,
    this.rowid = const Value.absent(),
  }) : group = Value(group),
       name = Value(name),
       date = Value(date),
       classroom = Value(classroom),
       teacher = Value(teacher),
       year = Value(year),
       semester = Value(semester);
  static Insertable<ExamsEntry> custom({
    Expression<String>? group,
    Expression<String>? name,
    Expression<DateTime>? date,
    Expression<String>? classroom,
    Expression<String>? teacher,
    Expression<int>? year,
    Expression<int>? semester,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (group != null) 'group': group,
      if (name != null) 'name': name,
      if (date != null) 'date': date,
      if (classroom != null) 'classroom': classroom,
      if (teacher != null) 'teacher': teacher,
      if (year != null) 'year': year,
      if (semester != null) 'semester': semester,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExamsCompanion copyWith({
    Value<String>? group,
    Value<String>? name,
    Value<DateTime>? date,
    Value<String>? classroom,
    Value<String>? teacher,
    Value<int>? year,
    Value<int>? semester,
    Value<int>? rowid,
  }) {
    return ExamsCompanion(
      group: group ?? this.group,
      name: name ?? this.name,
      date: date ?? this.date,
      classroom: classroom ?? this.classroom,
      teacher: teacher ?? this.teacher,
      year: year ?? this.year,
      semester: semester ?? this.semester,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (group.present) {
      map['group'] = Variable<String>(group.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (classroom.present) {
      map['classroom'] = Variable<String>(classroom.value);
    }
    if (teacher.present) {
      map['teacher'] = Variable<String>(teacher.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (semester.present) {
      map['semester'] = Variable<int>(semester.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExamsCompanion(')
          ..write('group: $group, ')
          ..write('name: $name, ')
          ..write('date: $date, ')
          ..write('classroom: $classroom, ')
          ..write('teacher: $teacher, ')
          ..write('year: $year, ')
          ..write('semester: $semester, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $GroupsTable groups = $GroupsTable(this);
  late final $LessonsTable lessons = $LessonsTable(this);
  late final $ExamsTable exams = $ExamsTable(this);
  late final GroupsDao groupsDao = GroupsDao(this as Database);
  late final LessonsDao lessonsDao = LessonsDao(this as Database);
  late final ExamsDao examsDao = ExamsDao(this as Database);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [groups, lessons, exams];
}

typedef $$GroupsTableCreateCompanionBuilder =
    GroupsCompanion Function({required String name, Value<int> rowid});
typedef $$GroupsTableUpdateCompanionBuilder =
    GroupsCompanion Function({Value<String> name, Value<int> rowid});

class $$GroupsTableFilterComposer extends Composer<_$Database, $GroupsTable> {
  $$GroupsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GroupsTableOrderingComposer extends Composer<_$Database, $GroupsTable> {
  $$GroupsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GroupsTableAnnotationComposer
    extends Composer<_$Database, $GroupsTable> {
  $$GroupsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$GroupsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $GroupsTable,
          GroupsEntry,
          $$GroupsTableFilterComposer,
          $$GroupsTableOrderingComposer,
          $$GroupsTableAnnotationComposer,
          $$GroupsTableCreateCompanionBuilder,
          $$GroupsTableUpdateCompanionBuilder,
          (GroupsEntry, BaseReferences<_$Database, $GroupsTable, GroupsEntry>),
          GroupsEntry,
          PrefetchHooks Function()
        > {
  $$GroupsTableTableManager(_$Database db, $GroupsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GroupsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GroupsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GroupsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> name = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GroupsCompanion(name: name, rowid: rowid),
          createCompanionCallback:
              ({
                required String name,
                Value<int> rowid = const Value.absent(),
              }) => GroupsCompanion.insert(name: name, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GroupsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $GroupsTable,
      GroupsEntry,
      $$GroupsTableFilterComposer,
      $$GroupsTableOrderingComposer,
      $$GroupsTableAnnotationComposer,
      $$GroupsTableCreateCompanionBuilder,
      $$GroupsTableUpdateCompanionBuilder,
      (GroupsEntry, BaseReferences<_$Database, $GroupsTable, GroupsEntry>),
      GroupsEntry,
      PrefetchHooks Function()
    >;
typedef $$LessonsTableCreateCompanionBuilder =
    LessonsCompanion Function({
      required String group,
      required String name,
      required int type,
      Value<String?> teacherName,
      Value<String?> classroom,
      required int year,
      required int semester,
      required int lessonNumber,
      Value<int?> fromWeek,
      Value<int?> toWeek,
      Value<DateTime?> startDate,
      Value<DateTime?> endDate,
      Value<bool?> isWeekEven,
      Value<int?> dayOfWeek,
      Value<DateTime?> date,
      Value<int?> percentOfGroup,
      Value<bool?> isInLectureHall,
      Value<bool?> isOnline,
      Value<String?> comment,
      Value<int> rowid,
    });
typedef $$LessonsTableUpdateCompanionBuilder =
    LessonsCompanion Function({
      Value<String> group,
      Value<String> name,
      Value<int> type,
      Value<String?> teacherName,
      Value<String?> classroom,
      Value<int> year,
      Value<int> semester,
      Value<int> lessonNumber,
      Value<int?> fromWeek,
      Value<int?> toWeek,
      Value<DateTime?> startDate,
      Value<DateTime?> endDate,
      Value<bool?> isWeekEven,
      Value<int?> dayOfWeek,
      Value<DateTime?> date,
      Value<int?> percentOfGroup,
      Value<bool?> isInLectureHall,
      Value<bool?> isOnline,
      Value<String?> comment,
      Value<int> rowid,
    });

class $$LessonsTableFilterComposer extends Composer<_$Database, $LessonsTable> {
  $$LessonsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get group => $composableBuilder(
    column: $table.group,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get teacherName => $composableBuilder(
    column: $table.teacherName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get classroom => $composableBuilder(
    column: $table.classroom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get semester => $composableBuilder(
    column: $table.semester,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lessonNumber => $composableBuilder(
    column: $table.lessonNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fromWeek => $composableBuilder(
    column: $table.fromWeek,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get toWeek => $composableBuilder(
    column: $table.toWeek,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isWeekEven => $composableBuilder(
    column: $table.isWeekEven,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dayOfWeek => $composableBuilder(
    column: $table.dayOfWeek,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get percentOfGroup => $composableBuilder(
    column: $table.percentOfGroup,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isInLectureHall => $composableBuilder(
    column: $table.isInLectureHall,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isOnline => $composableBuilder(
    column: $table.isOnline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LessonsTableOrderingComposer
    extends Composer<_$Database, $LessonsTable> {
  $$LessonsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get group => $composableBuilder(
    column: $table.group,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get teacherName => $composableBuilder(
    column: $table.teacherName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get classroom => $composableBuilder(
    column: $table.classroom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get semester => $composableBuilder(
    column: $table.semester,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lessonNumber => $composableBuilder(
    column: $table.lessonNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fromWeek => $composableBuilder(
    column: $table.fromWeek,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get toWeek => $composableBuilder(
    column: $table.toWeek,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isWeekEven => $composableBuilder(
    column: $table.isWeekEven,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dayOfWeek => $composableBuilder(
    column: $table.dayOfWeek,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get percentOfGroup => $composableBuilder(
    column: $table.percentOfGroup,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isInLectureHall => $composableBuilder(
    column: $table.isInLectureHall,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isOnline => $composableBuilder(
    column: $table.isOnline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LessonsTableAnnotationComposer
    extends Composer<_$Database, $LessonsTable> {
  $$LessonsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get group =>
      $composableBuilder(column: $table.group, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get teacherName => $composableBuilder(
    column: $table.teacherName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get classroom =>
      $composableBuilder(column: $table.classroom, builder: (column) => column);

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<int> get semester =>
      $composableBuilder(column: $table.semester, builder: (column) => column);

  GeneratedColumn<int> get lessonNumber => $composableBuilder(
    column: $table.lessonNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get fromWeek =>
      $composableBuilder(column: $table.fromWeek, builder: (column) => column);

  GeneratedColumn<int> get toWeek =>
      $composableBuilder(column: $table.toWeek, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<bool> get isWeekEven => $composableBuilder(
    column: $table.isWeekEven,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dayOfWeek =>
      $composableBuilder(column: $table.dayOfWeek, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get percentOfGroup => $composableBuilder(
    column: $table.percentOfGroup,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isInLectureHall => $composableBuilder(
    column: $table.isInLectureHall,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isOnline =>
      $composableBuilder(column: $table.isOnline, builder: (column) => column);

  GeneratedColumn<String> get comment =>
      $composableBuilder(column: $table.comment, builder: (column) => column);
}

class $$LessonsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $LessonsTable,
          LessonsEntry,
          $$LessonsTableFilterComposer,
          $$LessonsTableOrderingComposer,
          $$LessonsTableAnnotationComposer,
          $$LessonsTableCreateCompanionBuilder,
          $$LessonsTableUpdateCompanionBuilder,
          (
            LessonsEntry,
            BaseReferences<_$Database, $LessonsTable, LessonsEntry>,
          ),
          LessonsEntry,
          PrefetchHooks Function()
        > {
  $$LessonsTableTableManager(_$Database db, $LessonsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LessonsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LessonsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LessonsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> group = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> type = const Value.absent(),
                Value<String?> teacherName = const Value.absent(),
                Value<String?> classroom = const Value.absent(),
                Value<int> year = const Value.absent(),
                Value<int> semester = const Value.absent(),
                Value<int> lessonNumber = const Value.absent(),
                Value<int?> fromWeek = const Value.absent(),
                Value<int?> toWeek = const Value.absent(),
                Value<DateTime?> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<bool?> isWeekEven = const Value.absent(),
                Value<int?> dayOfWeek = const Value.absent(),
                Value<DateTime?> date = const Value.absent(),
                Value<int?> percentOfGroup = const Value.absent(),
                Value<bool?> isInLectureHall = const Value.absent(),
                Value<bool?> isOnline = const Value.absent(),
                Value<String?> comment = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LessonsCompanion(
                group: group,
                name: name,
                type: type,
                teacherName: teacherName,
                classroom: classroom,
                year: year,
                semester: semester,
                lessonNumber: lessonNumber,
                fromWeek: fromWeek,
                toWeek: toWeek,
                startDate: startDate,
                endDate: endDate,
                isWeekEven: isWeekEven,
                dayOfWeek: dayOfWeek,
                date: date,
                percentOfGroup: percentOfGroup,
                isInLectureHall: isInLectureHall,
                isOnline: isOnline,
                comment: comment,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String group,
                required String name,
                required int type,
                Value<String?> teacherName = const Value.absent(),
                Value<String?> classroom = const Value.absent(),
                required int year,
                required int semester,
                required int lessonNumber,
                Value<int?> fromWeek = const Value.absent(),
                Value<int?> toWeek = const Value.absent(),
                Value<DateTime?> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<bool?> isWeekEven = const Value.absent(),
                Value<int?> dayOfWeek = const Value.absent(),
                Value<DateTime?> date = const Value.absent(),
                Value<int?> percentOfGroup = const Value.absent(),
                Value<bool?> isInLectureHall = const Value.absent(),
                Value<bool?> isOnline = const Value.absent(),
                Value<String?> comment = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LessonsCompanion.insert(
                group: group,
                name: name,
                type: type,
                teacherName: teacherName,
                classroom: classroom,
                year: year,
                semester: semester,
                lessonNumber: lessonNumber,
                fromWeek: fromWeek,
                toWeek: toWeek,
                startDate: startDate,
                endDate: endDate,
                isWeekEven: isWeekEven,
                dayOfWeek: dayOfWeek,
                date: date,
                percentOfGroup: percentOfGroup,
                isInLectureHall: isInLectureHall,
                isOnline: isOnline,
                comment: comment,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LessonsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $LessonsTable,
      LessonsEntry,
      $$LessonsTableFilterComposer,
      $$LessonsTableOrderingComposer,
      $$LessonsTableAnnotationComposer,
      $$LessonsTableCreateCompanionBuilder,
      $$LessonsTableUpdateCompanionBuilder,
      (LessonsEntry, BaseReferences<_$Database, $LessonsTable, LessonsEntry>),
      LessonsEntry,
      PrefetchHooks Function()
    >;
typedef $$ExamsTableCreateCompanionBuilder =
    ExamsCompanion Function({
      required String group,
      required String name,
      required DateTime date,
      required String classroom,
      required String teacher,
      required int year,
      required int semester,
      Value<int> rowid,
    });
typedef $$ExamsTableUpdateCompanionBuilder =
    ExamsCompanion Function({
      Value<String> group,
      Value<String> name,
      Value<DateTime> date,
      Value<String> classroom,
      Value<String> teacher,
      Value<int> year,
      Value<int> semester,
      Value<int> rowid,
    });

class $$ExamsTableFilterComposer extends Composer<_$Database, $ExamsTable> {
  $$ExamsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get group => $composableBuilder(
    column: $table.group,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get classroom => $composableBuilder(
    column: $table.classroom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get teacher => $composableBuilder(
    column: $table.teacher,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get semester => $composableBuilder(
    column: $table.semester,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExamsTableOrderingComposer extends Composer<_$Database, $ExamsTable> {
  $$ExamsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get group => $composableBuilder(
    column: $table.group,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get classroom => $composableBuilder(
    column: $table.classroom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get teacher => $composableBuilder(
    column: $table.teacher,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get semester => $composableBuilder(
    column: $table.semester,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExamsTableAnnotationComposer extends Composer<_$Database, $ExamsTable> {
  $$ExamsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get group =>
      $composableBuilder(column: $table.group, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get classroom =>
      $composableBuilder(column: $table.classroom, builder: (column) => column);

  GeneratedColumn<String> get teacher =>
      $composableBuilder(column: $table.teacher, builder: (column) => column);

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<int> get semester =>
      $composableBuilder(column: $table.semester, builder: (column) => column);
}

class $$ExamsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $ExamsTable,
          ExamsEntry,
          $$ExamsTableFilterComposer,
          $$ExamsTableOrderingComposer,
          $$ExamsTableAnnotationComposer,
          $$ExamsTableCreateCompanionBuilder,
          $$ExamsTableUpdateCompanionBuilder,
          (ExamsEntry, BaseReferences<_$Database, $ExamsTable, ExamsEntry>),
          ExamsEntry,
          PrefetchHooks Function()
        > {
  $$ExamsTableTableManager(_$Database db, $ExamsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExamsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExamsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExamsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> group = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> classroom = const Value.absent(),
                Value<String> teacher = const Value.absent(),
                Value<int> year = const Value.absent(),
                Value<int> semester = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExamsCompanion(
                group: group,
                name: name,
                date: date,
                classroom: classroom,
                teacher: teacher,
                year: year,
                semester: semester,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String group,
                required String name,
                required DateTime date,
                required String classroom,
                required String teacher,
                required int year,
                required int semester,
                Value<int> rowid = const Value.absent(),
              }) => ExamsCompanion.insert(
                group: group,
                name: name,
                date: date,
                classroom: classroom,
                teacher: teacher,
                year: year,
                semester: semester,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExamsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $ExamsTable,
      ExamsEntry,
      $$ExamsTableFilterComposer,
      $$ExamsTableOrderingComposer,
      $$ExamsTableAnnotationComposer,
      $$ExamsTableCreateCompanionBuilder,
      $$ExamsTableUpdateCompanionBuilder,
      (ExamsEntry, BaseReferences<_$Database, $ExamsTable, ExamsEntry>),
      ExamsEntry,
      PrefetchHooks Function()
    >;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$GroupsTableTableManager get groups =>
      $$GroupsTableTableManager(_db, _db.groups);
  $$LessonsTableTableManager get lessons =>
      $$LessonsTableTableManager(_db, _db.lessons);
  $$ExamsTableTableManager get exams =>
      $$ExamsTableTableManager(_db, _db.exams);
}
