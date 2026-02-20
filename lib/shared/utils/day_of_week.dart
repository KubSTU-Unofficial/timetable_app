extension DateTimeWeekdayExtension on DateTime {
  // Получить дату указанного дня недели в текущей неделе
   // - номер дня недели (1-7, где 1 = понедельник)
  DateTime? dateByWeekday(int weekday) {
    if (weekday < 1 || weekday > 7) {
      return null;
    }
    // Находим начало текущей недели (понедельник) относительно текущей даты
    final monday = subtract(Duration(days: this.weekday - 1));
    
    // Добавляем нужное количество дней
    return monday.add(Duration(days: weekday - 1));
  }
}