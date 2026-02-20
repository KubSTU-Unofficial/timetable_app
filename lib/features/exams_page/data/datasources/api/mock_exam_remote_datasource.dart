import 'package:timetable_app/features/exams_page/data/datasources/api/exam_remote_data_source_int.dart';
import 'package:timetable_app/features/exams_page/data/models/exam_dto.dart';

class  MockExamRemoteDatasource implements ExamRemoteDataSourceInt {
  @override
  Future<List<ExamDTO>> getByGroup(String group) async => _exams;

	static final List<ExamDTO> _exams = [
		ExamDTO(
			group: "22-КБ-ИВ1", 
			name: "Теория теории теоретизации", 
			date: DateTime(2026, 04, 12), 
			classroom: 'К-512', 
			teacher: "Пророщеноко Григорий Иванович", 
			year: 2026, 
			semester: 2
		),
		ExamDTO(
			group: "22-КБ-ИВ1", 
			name: "Ламповая архитектура ЭВМ", 
			date: DateTime(2026, 04, 13), 
			classroom: 'К-516', 
			teacher: "Иванов Прокофий Александрович", 
			year: 2026, 
			semester: 2
		),
		ExamDTO(
			group: "22-КБ-ИВ1", 
			name: "Разработка в системах автоматизации тока тока", 
			date: DateTime(2026, 04, 14), 
			classroom: 'К-711', 
			teacher: "Гаврилова Галина Евгеньевна", 
			year: 2026, 
			semester: 2
		),
	];
  
}
