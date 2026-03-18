import 'package:timetable_app/core/data/api/api.dart';
import 'package:timetable_app/features/exams_page/data/datasources/api/exam_remote_data_source_int.dart';
import 'package:timetable_app/features/exams_page/data/models/exam_dto.dart';

class ExamRemoteDatasource implements ExamRemoteDataSourceInt {

  @override
  Future<List<ExamDTO>> getByGroup(String group) async {
		List<dynamic> body = await Api.get(
			"groups/$group/exams",
		);
		List<ExamDTO> exams = body.map((e) => ExamDTO.fromJson(e as Map<String, dynamic>)).toList();
		return exams;
  }
  
}
