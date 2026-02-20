import 'package:timetable_app/features/exams_page/domain/entities/exam.dart';

abstract class ExamRepoInt {

	Stream<List<Exam>> getAllForUser();

	Future<DateTime> ensureExamsUpToDateForUser();

}
