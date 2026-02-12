import 'package:flutter/material.dart';

//AppColors
import 'package:timetable_app/shared/presentation/theme/app_colors.dart';

class ExpansionTileWidget extends StatefulWidget {

  @override
  _ExpansionTileWidgetState createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {

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
      backgroundColor: AppColors.darkSurface,
      collapsedBackgroundColor: AppColors.darkSurface,
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
