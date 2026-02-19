extension WeekDayNameExt on DateTime {
	String get weekdayName => [
		"Понедельник",
		"Вторник",
		"Среда",
		"Четверг",
		"Пятница",
		"Суббота",
		"Воскресенье",
	][weekday - 1];
}
