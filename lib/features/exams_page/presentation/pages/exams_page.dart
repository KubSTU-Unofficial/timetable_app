import 'package:flutter/material.dart';
import 'package:timetable_app/features/exams_page/presentation/widgets/exams_page_bloc_widget.dart';

//widgets
import 'package:timetable_app/features/exams_page/presentation/widgets/exams_card_widget.dart';
import 'package:timetable_app/shared/presentation/theme/theme_getter_ext.dart';

class ExamsPage extends StatelessWidget {
  const ExamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: Center(
          child: ExamsPageBlocWidget(
            builder: (ctx, exams, onRefreshRequested) {
              // Если экзаменов нет
              if (exams == null || exams.isEmpty) {
                return SizedBox.shrink();
              }
              return RefreshIndicator(
                onRefresh: onRefreshRequested,
                child: ListView.builder(
                  itemCount: exams.length,
                  itemBuilder: (context, index) {
                    return ExamsCardWidget(exams: exams[index]); 
                    //ExamsCardWidget(exams: exams[idx]);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
