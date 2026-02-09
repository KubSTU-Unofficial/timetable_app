import 'package:timetable_app/shared/domain/entities/weeks.dart';

class Timing {
	final int year;
	final int semester;
	final int lessonNumber;
	final Weeks? weeks;
	final DateTime? date;

	Timing({
		required this.year,
		required this.semester,
		required this.lessonNumber,
		required this.weeks,
		required this.date
	});
}
