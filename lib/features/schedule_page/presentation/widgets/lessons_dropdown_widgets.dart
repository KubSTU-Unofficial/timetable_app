import 'package:flutter/material.dart';

//core
import 'package:timetable_app/core/di/get_it.dart';

//shared
import 'package:timetable_app/shared/domain/entities/lesson.dart';
import 'package:timetable_app/shared/domain/usecases/get_all_classes_for_group_usecase.dart';
import 'package:timetable_app/shared/presentation/theme/app_colors.dart';

class LessonDropdown extends StatefulWidget {
  const LessonDropdown({super.key});

  @override
  _LessonsDropdownState createState() => _LessonsDropdownState();
}

class _LessonsDropdownState extends State<LessonDropdown> {
  List<Lesson> lessons = [];
  Lesson? selectedLesson;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadLessons();
  }

  Future<void> loadLessons() async {
    try {
      final lessonsList = await getIt
          .get<GetAllLessonsForUserGroupUsecase>()
          .execute();
      setState(() {
        lessons = lessonsList;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return CircularProgressIndicator();
    }

    return Container(
      decoration: ShapeDecoration(
        color: AppColors.darkBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
          side: BorderSide(
            width: 3.0,
            style: BorderStyle.solid,
            color: AppColors.focusedBorder,
          ),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Lesson>(
          icon: Visibility(visible: false, child: Icon(Icons.arrow_downward)),
          dropdownColor: AppColors.darkBackground,
          value: selectedLesson,
          hint: Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              selectedLesson?.name ?? 'Пара',
              style: TextStyle(
                color: AppColors.textAccent,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          isExpanded: true,
          items: lessons.map((Lesson lesson) {
            return DropdownMenuItem<Lesson>(
              value: lesson,
              child: Text(lesson.name),
            );
          }).toList(),
          onChanged: (Lesson? newValue) {
            setState(() {
              selectedLesson = newValue;
            });
          },
        ),
      ),
    );
  }
}
