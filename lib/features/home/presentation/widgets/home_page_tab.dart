import 'package:flutter/material.dart';
import 'package:timetable_app/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:timetable_app/shared/domain/entities/lesson.dart';
import 'package:timetable_app/shared/presentation/theme/app_colors.dart';
import 'package:timetable_app/shared/presentation/widgets/error_message_block.dart';
import 'package:timetable_app/shared/presentation/widgets/lesson_widget.dart';

class HomePageTab extends StatelessWidget {
  const HomePageTab({
		super.key,
		required this.onRetry,
		this.data,
	});

  final HomePageTabData? data;
  final void Function() onRetry;

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Center(
        child: Text(
          "Выберите дату для показа",
          style: TextStyle(color: AppColors.primary),
        ),
      );
    }
    if (data!.error != null) {
      return ErrorMessageBlock(
        errorMessage: data!.error!,
        circumstances: "загрузке пар",
        onRetry: onRetry,
      );
    }
    return StreamBuilder(
      stream: data!.lessons,
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.data == null || asyncSnapshot.data!.isEmpty) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ПАР НЕТ!!!',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textAccent,
                  ),
                ),
                Image.asset(
                  'assets/chill_girl.gif',
                  fit: BoxFit.contain,
                  gaplessPlayback: true,
                  width: 300,
                  height: 300,
                ),
                Text(
                  'ОТДОХНИ!!!',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textAccent,
                  ),
                ),
              ],
            ),
          );
        }

        List<Lesson> lessons = asyncSnapshot.data!;

        return Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: ListView.separated(
              itemCount: lessons.length,
              separatorBuilder: (context, index) => SizedBox(height: 8),
              itemBuilder: (context, index) =>
								LessonWidget(lesson: lessons[index])
								// ExpansionTitleWidget(lesson: lessons[index])
            ),
          ),
        );
      },
    );
  }
}
