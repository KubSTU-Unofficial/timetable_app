import 'package:flutter/material.dart';
import 'package:timetable_app/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:timetable_app/shared/domain/entities/lesson.dart';
import 'package:timetable_app/shared/presentation/theme/theme_getter_ext.dart';
import 'package:timetable_app/shared/presentation/widgets/error_message_block.dart';
import 'package:timetable_app/shared/presentation/widgets/lesson_widget.dart';

class HomePageTab extends StatelessWidget {
  const HomePageTab({
    super.key,
    required this.onRetry,
    required this.onRefreshRequested,
    this.data,
  });

  final HomePageTabData? data;
  final void Function() onRetry;
  final Future<void> Function() onRefreshRequested;

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Center(
        child: Text(
          "Выберите дату для показа",
          style: TextStyle(color: context.colors.primary),
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
				if (asyncSnapshot.data == null) return SizedBox.expand();
        if (asyncSnapshot.data!.isEmpty) {
          return RefreshIndicator(
						color: context.colors.primary,
						backgroundColor: context.colors.background,
						onRefresh: onRefreshRequested,
            child: LayoutBuilder(
              builder: (context, constraints) {
								return SingleChildScrollView(
									physics: AlwaysScrollableScrollPhysics(),
                  child: ConstrainedBox(
										constraints: constraints,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'ПАР НЕТ!!!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: context.colors.textAccent,
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
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: context.colors.textAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            ),
          );
        }

        List<Lesson> lessons = asyncSnapshot.data!;

        return Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: RefreshIndicator(
              color: context.colors.primary,
              backgroundColor: context.colors.background,
              onRefresh: onRefreshRequested,
              child: ListView.separated(
                itemCount: lessons.length,
                separatorBuilder: (context, index) => SizedBox(height: 8),
                itemBuilder: (context, index) =>
                    LessonWidget(lesson: lessons[index]),
              ),
            ),
          ),
        );
      },
    );
  }
}
