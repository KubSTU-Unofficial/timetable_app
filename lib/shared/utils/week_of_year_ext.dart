extension WeekOfYearExt on DateTime {
  int get weekOfYear {
		// Создаем копию даты, отбрасывая время (устанавливаем в полночь)
    DateTime date = DateTime.utc(year, month, day);

    // Находим четверг текущей недели (ISO 8601: неделя относится к тому году, 
    // в котором находится её четверг)
    // weekday в Dart: Пн = 1, Вс = 7.
    date = date.add(Duration(days: 3 - ((date.weekday - 1))));

    // Находим 4-е января этого года
    DateTime week1 = DateTime.utc(date.year, 1, 4);

    // Считаем разницу в днях и вычисляем номер недели
    int dayDifference = date.difference(week1).inDays;
    
    return 1 + ((dayDifference - 3 + ((week1.weekday - 1))) / 7).round();
  }
}
