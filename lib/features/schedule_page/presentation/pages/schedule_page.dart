import 'package:flutter/material.dart';

//Widgets
import 'package:timetable_app/features/schedule_page/presentation/widgets/lessons_dropdown_widgets.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: ListView(
            children: [
              Text("Четная неделя"),
              SizedBox(height: 5),
              LessonDropdown(),
              SizedBox(height: 5),
              Text("Нечетная неделя")
            ],
          ),
        ),
      ),
    );
  }
}
