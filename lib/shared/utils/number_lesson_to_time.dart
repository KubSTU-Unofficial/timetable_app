String getLessonTime(int lessonNumber) {
  switch (lessonNumber) {
    case 1:
      return '8:00 - 9:30';
    case 2:
      return '9:40 - 11:10';
    case 3:
      return '11:20 - 12:50';
    case 4:
      return '13:20 - 14:50';
    case 5:
      return '15:00 - 16:30';
    case 6:
      return '16:40 - 18:10';
    case 7:
      return '18:20 - 19:50';
    case 8:
      return '20:00 - 21:30';
    default:
      return '$lessonNumber пара';
  }
}