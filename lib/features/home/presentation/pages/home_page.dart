import 'package:flutter/material.dart';

// Core

// Router

// Shared

//appcolors
import 'package:timetable_app/shared/presentation/theme/app_colors.dart';
import 'package:timetable_app/shared/presentation/widgets/expansion_title_widget.dart';

//Widgets
import 'package:timetable_app/features/home/presentation/widgets/calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: Calendar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        backgroundColor: AppColors.darkBackground,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox.square(
                child: Container(
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
                          'Дата',
                        ),
                      ),
                      Tab(
                        child: Text(
                          style: TextStyle(
                            color: AppColors.textAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          'Сегодня',
                        ),
                      ),
                      Tab(
                        child: Text(
                          style: TextStyle(
                            color: AppColors.textAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          'Завтра',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    //Пары на нужную дату
                    Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                        child: ListView.separated(
                          itemCount: 3,
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 8),
                          itemBuilder: (context, index) =>
                              ExpansionTitleWidget(),
                        ),
                      ),
                    ),
                    //Пары на сегодня
                    Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                        child: ListView.separated(
                          itemCount: 3,
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 8),
                          itemBuilder: (context, index) =>
                              ExpansionTitleWidget(),
                        ),
                      ),
                    ),
                    // Пары на завтра
                    Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                        child: ListView.separated(
                          itemCount: 3,
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 8),
                          itemBuilder: (context, index) =>
                              ExpansionTitleWidget(),
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
