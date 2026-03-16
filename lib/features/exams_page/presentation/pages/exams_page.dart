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
                return RefreshIndicator(
                  onRefresh: onRefreshRequested,
                  color: context.colors.primary,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: ConstrainedBox(
                          constraints: constraints,
                          child: Column(
                            spacing: 16.0,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Информации об экзаменах пока нет.",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: onRefreshRequested,
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(120, 45),
                                  backgroundColor: context.colors.cardBackground,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                                child: Text(
                                  "Обновить",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: context.colors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              return RefreshIndicator(
                onRefresh: onRefreshRequested,
                color: context.colors.primary,
                child: ListView.builder(
                  itemCount: exams.length,
                  itemBuilder: (context, index) {
                    return ExamsCardWidget(exams: exams[index]);
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
