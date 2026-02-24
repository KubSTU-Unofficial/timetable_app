import 'package:flutter/material.dart';

// Shared
import 'package:timetable_app/shared/presentation/theme/theme_getter_ext.dart';
import 'package:timetable_app/shared/presentation/widgets/svg_icon.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting, 
      backgroundColor: context.colors.navigationBarBackground, 
      selectedItemColor: context.colors.primary,
      unselectedItemColor: context.colors.primary.withAlpha(150),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: "",
          backgroundColor: context.colors.navigationBarBackground,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: "",
          backgroundColor: context.colors.navigationBarBackground,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.today),
          label: "",
          backgroundColor: context.colors.navigationBarBackground,
        ),
        BottomNavigationBarItem(
          icon: SvgIcon(
						assetName: 'assets/exam.svg',
					),
          label: "",
          backgroundColor: context.colors.navigationBarBackground,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "",
          backgroundColor: context.colors.navigationBarBackground,
        ),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}
