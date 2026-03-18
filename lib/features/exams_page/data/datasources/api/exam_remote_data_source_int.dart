import 'package:timetable_app/features/exams_page/data/models/exam_dto.dart';

abstract class ExamRemoteDataSourceInt  {
  
	Future<List<ExamDTO>> getByGroup(String group);
}
