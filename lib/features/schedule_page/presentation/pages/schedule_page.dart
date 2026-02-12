import 'package:flutter/material.dart';

//Widgets
import 'package:timetable_app/features/schedule_page/presentation/widgets/expansion_title_widgets.dart';

//Appcolor
import 'package:timetable_app/shared/presentation/theme/app_colors.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: AppColors.darkBackground,
          body: Column(
            children: [
              Container(
                color: AppColors.darkBackground,
                child: TabBar(
                  indicatorColor: AppColors.primary,
                  indicatorWeight: 3.0,
                  dividerHeight: 1.0,
                  dividerColor: AppColors.primary,
                  labelColor: AppColors.focusedText,
                  tabs: [
                    Tab(
                      child: Text(
                        style: TextStyle(
                          color: AppColors.textAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        'Четная',
                      ),
                    ),
                    Tab(
                      child: Text(
                        style: TextStyle(
                          color: AppColors.textAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        'Нечетная',
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    //Пары 1ой вкладки
                    Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                        child: ListView.separated(
                          itemCount: 3,
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 8),
                          itemBuilder: (context, index) =>
                              ExpansionTileWidget(),
                        ),
                      ),
                    ),
                    // Пары 2ой вкладки
                    Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                        child: ListView.separated(
                          itemCount: 3,
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 8),
                          itemBuilder: (context, index) =>
                              ExpansionTileWidget(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
