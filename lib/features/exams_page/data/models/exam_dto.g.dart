// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamDTO _$ExamDTOFromJson(Map<String, dynamic> json) => ExamDTO(
  group: json['group'] as String,
  name: json['name'] as String,
  date: DateTime.parse(json['date'] as String),
  classroom: json['classroom'] as String,
  teacher: json['teacher'] as String,
  year: (json['year'] as num).toInt(),
  semester: (json['semester'] as num).toInt(),
);

Map<String, dynamic> _$ExamDTOToJson(ExamDTO instance) => <String, dynamic>{
  'group': instance.group,
  'name': instance.name,
  'date': instance.date.toIso8601String(),
  'classroom': instance.classroom,
  'teacher': instance.teacher,
  'year': instance.year,
  'semester': instance.semester,
};
