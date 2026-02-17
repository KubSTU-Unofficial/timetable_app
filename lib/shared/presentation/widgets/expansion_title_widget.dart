import 'package:flutter/material.dart';

//AppColors
import 'package:timetable_app/shared/presentation/theme/app_colors.dart';

class ExpansionTitleWidget extends StatefulWidget {
  const ExpansionTitleWidget({super.key});


  @override
  State<ExpansionTitleWidget> createState() => _ExpansionTitleWidgetState();
}

class _ExpansionTitleWidgetState extends State<ExpansionTitleWidget> {

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.textAccent,
        ),
        'пара',
      ),
      iconColor: AppColors.focusedBorder,
      collapsedIconColor: AppColors.enabledBorder,
      textColor: AppColors.textAccent,
      collapsedTextColor: Colors.black,
      backgroundColor: AppColors.darkBackground,
      collapsedBackgroundColor: AppColors.darkBackground,
      collapsedShape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.enabledBorder, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(3)),
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.focusedBorder, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(3)),
      ),
      children: [],
    );
  }
}
