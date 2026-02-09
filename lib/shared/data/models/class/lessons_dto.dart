import 'package:json_annotation/json_annotation.dart';

part 'lessons_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class LessonDTO {
	final String group;
	final String name;
	final int type;
	final String? teacherName;
	final String? classroom;
	final TimingDTO timing;
	final int? percentOfGroup;
	final bool? isStream;
	final bool? isDistant;
	final String? comment;

	LessonDTO({
		required this.group,
		required this.name,
		required this.type,
		required this.teacherName,
		required this.classroom,
		required this.timing,
		required this.percentOfGroup,
		required this.isStream,
		required this.isDistant,
		required this.comment
	});

	Map<String, dynamic> toJson() => _$LessonDTOToJson(this);
	factory LessonDTO.fromJson(Map<String, dynamic> json) => _$LessonDTOFromJson(json);
}

@JsonSerializable(explicitToJson: true)
class TimingDTO {
	final int year;
	final int semester;
	final int lessonNumber;
	final WeeksDTO? weeks;
	final DateTime? date;

	TimingDTO({
		required this.year,
		required this.semester,
		required this.lessonNumber,
		required this.weeks,
		required this.date
	});

	Map<String, dynamic> toJson() => _$TimingDTOToJson(this);
	factory TimingDTO.fromJson(Map<String, dynamic> json) => _$TimingDTOFromJson(json);
}

@JsonSerializable()
class WeeksDTO {
	final int from;
	final int to;
	final DateTime startDate;
	final DateTime endDate;
	final bool type;
	final int dayOfWeek;

	WeeksDTO({
		required this.from,
		required this.to,
		required this.startDate,
		required this.endDate,
		required this.type,
		required this.dayOfWeek
	});

	factory WeeksDTO.fromJson(Map<String, dynamic> json) => _$WeeksDTOFromJson(json);
	Map<String, dynamic> toJson() => _$WeeksDTOToJson(this);
}
