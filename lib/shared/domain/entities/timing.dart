import 'package:timetable_app/shared/domain/entities/weeks.dart';
import 'package:timetable_app/shared/utils/week_of_year_ext.dart';

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

	String get lessonTime {
		return switch (lessonNumber) {
			1 => '8:00 - 9:30',
			2 => '9:40 - 11:10',
			3 => '11:20 - 12:50',
			4 => '13:20 - 14:50',
			5 => '15:00 - 16:30',
			6 => '16:40 - 18:10',
			7 =>'18:20 - 19:50',
			8 => '20:00 - 21:30',
			_ => "$lessonNumber пара"
		};
	}

	DateTime? get nextDate {
		if (date != null) return date!;
		DateTime now = DateTime.now();
		if (weeks == null) return null;
		if ( (now.weekOfYear % 2 == 0) != weeks!.isEven) {
			return now
			.add(
				Duration(days: 7 - now.weekday + weeks!.dayOfWeek)
			);
		}
		if (now.weekday <= weeks!.dayOfWeek) {
			return now.add(Duration(days: weeks!.dayOfWeek - now.weekday));
		}
		if (now.weekday > weeks!.dayOfWeek) {
			return now.add(Duration(days: 14 + weeks!.dayOfWeek - now.weekday));
		}
		return null;
	}
}
