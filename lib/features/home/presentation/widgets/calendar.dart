import 'package:flutter/material.dart';
import 'package:timetable_app/shared/presentation/theme/theme_getter_ext.dart';
import 'package:timetable_app/shared/presentation/widgets/date_selector.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key, required this.onPicked});

	final void Function(DateTime data) onPicked;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.all(5),
      child: FloatingActionButton(
        onPressed: () {
          showDateSelector(context, onPicked);
        },
        backgroundColor: context.colors.background,
        foregroundColor: context.colors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
          side: BorderSide(color: context.colors.primary, width: 2),
        ),
        child: const Icon(Icons.calendar_today),
      ),
    );
  }
}
