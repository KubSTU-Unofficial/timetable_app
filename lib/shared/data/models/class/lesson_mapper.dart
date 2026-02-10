import 'package:timetable_app/shared/data/models/class/lessons_dto.dart';
import 'package:timetable_app/shared/domain/entities/lesson.dart';
import 'package:timetable_app/shared/domain/entities/timing.dart';
import 'package:timetable_app/shared/domain/entities/weeks.dart';

extension LessonDtoMapper on LessonDTO {
Lesson toLesson() => Lesson(
	group: group,
	name: name,
	type: LessonType.values[type],
	teacherName: teacherName,
	classroom: classroom,
	timing: timing.toTiming(),
	percentOfGroup: percentOfGroup,
	isInLectureHall: isStream,
	isOnline: isDistant,
	comment: comment

);
}

extension TimingDtoMapper on TimingDTO {
	Timing toTiming() => Timing(
		year: year,
		semester: semester,
		lessonNumber: lessonNumber,
		weeks: weeks?.toWeeks(),
		date: date,
	);
}

extension WeeksDtoMapper on WeeksDTO {
	Weeks toWeeks() => Weeks(
		from: from,
		to: to,
		startDate: startDate,
		endDate: endDate,
		isEven: type,
		dayOfWeek: dayOfWeek,
	);
}
