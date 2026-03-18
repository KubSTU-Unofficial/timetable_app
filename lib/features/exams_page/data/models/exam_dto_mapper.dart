import 'package:timetable_app/features/exams_page/data/models/exam_dto.dart';
import 'package:timetable_app/features/exams_page/domain/entities/exam.dart';

extension ExamDtoMapper on ExamDTO {
	Exam toExam() => Exam(
		group: group, 
		name: name, 
		date: date, 
		classroom: classroom, 
		teacher: teacher, 
		year: year, 
		semester: semester,
	);
}
