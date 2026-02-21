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

	String get shortWeekdayName => [
		"Пн",
		"Вт",
		"Ср",
		"Чт",
		"Пт",
		"Сб",
		"Вс",
	][weekday - 1];
}
