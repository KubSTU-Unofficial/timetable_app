import 'package:json_annotation/json_annotation.dart';

part 'exam_dto.g.dart';

@JsonSerializable()
class ExamDTO {
	final String group;
	final String name;
	final DateTime date;
	final String classroom;
	final String teacher;
	final int year;
	final int semester;

  ExamDTO({
		required this.group, 
		required this.name, 
		required this.date, 
		required this.classroom, 
		required this.teacher, 
		required this.year, 
		required this.semester
	});

	Map<String, dynamic> toJson() => _$ExamDTOToJson(this);
	factory ExamDTO.fromJson(Map<String, dynamic> json) => _$ExamDTOFromJson(json);
}
