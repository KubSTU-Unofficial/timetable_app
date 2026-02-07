import 'package:flutter/material.dart';

// Shared
import 'package:timetable_app/shared/presentation/theme/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting, 
      backgroundColor: AppColors.navigationBarBackground, 
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.primary.withAlpha(150),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.today),
          label: "",
          backgroundColor: AppColors.navigationBarBackground,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: "",
          backgroundColor: AppColors.navigationBarBackground,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.groups),
          label: "",
          backgroundColor: AppColors.navigationBarBackground,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: "",
          backgroundColor: AppColors.navigationBarBackground,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "",
          backgroundColor: AppColors.navigationBarBackground,
        ),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}