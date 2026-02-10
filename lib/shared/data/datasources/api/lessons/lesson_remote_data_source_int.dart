import 'package:timetable_app/shared/data/models/class/lessons_dto.dart';

abstract class LessonRemoteDataSourceInt {

	Future<List<LessonDTO>> getByGroup(String group);

}
