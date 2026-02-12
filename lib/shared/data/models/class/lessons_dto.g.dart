// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessons_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonDTO _$LessonDTOFromJson(Map<String, dynamic> json) => LessonDTO(
  group: json['group'] as String,
  name: json['name'] as String,
  type: (json['type'] as num).toInt(),
  teacherName: json['teacherName'] as String?,
  classroom: json['classroom'] as String?,
  timing: TimingDTO.fromJson(json['timing'] as Map<String, dynamic>),
  percentOfGroup: (json['percentOfGroup'] as num?)?.toInt(),
  isStream: json['isStream'] as bool?,
  isDistant: json['isDistant'] as bool?,
  comment: json['comment'] as String?,
);

Map<String, dynamic> _$LessonDTOToJson(LessonDTO instance) => <String, dynamic>{
  'group': instance.group,
  'name': instance.name,
  'type': instance.type,
  'teacherName': instance.teacherName,
  'classroom': instance.classroom,
  'timing': instance.timing.toJson(),
  'percentOfGroup': instance.percentOfGroup,
  'isStream': instance.isStream,
  'isDistant': instance.isDistant,
  'comment': instance.comment,
};

TimingDTO _$TimingDTOFromJson(Map<String, dynamic> json) => TimingDTO(
  year: (json['year'] as num).toInt(),
  semester: (json['semester'] as num).toInt(),
  lessonNumber: (json['lessonNumber'] as num).toInt(),
  weeks: json['weeks'] == null
      ? null
      : WeeksDTO.fromJson(json['weeks'] as Map<String, dynamic>),
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
);

Map<String, dynamic> _$TimingDTOToJson(TimingDTO instance) => <String, dynamic>{
  'year': instance.year,
  'semester': instance.semester,
  'lessonNumber': instance.lessonNumber,
  'weeks': instance.weeks?.toJson(),
  'date': instance.date?.toIso8601String(),
};

WeeksDTO _$WeeksDTOFromJson(Map<String, dynamic> json) => WeeksDTO(
  from: (json['from'] as num).toInt(),
  to: (json['to'] as num).toInt(),
  startDate: DateTime.parse(json['startDate'] as String),
  endDate: DateTime.parse(json['endDate'] as String),
  isEven: json['type'] as bool,
  dayOfWeek: (json['dayOfWeek'] as num).toInt(),
);

Map<String, dynamic> _$WeeksDTOToJson(WeeksDTO instance) => <String, dynamic>{
  'from': instance.from,
  'to': instance.to,
  'startDate': instance.startDate.toIso8601String(),
  'endDate': instance.endDate.toIso8601String(),
  'type': instance.isEven,
  'dayOfWeek': instance.dayOfWeek,
};
